#include "test.h"

static bool has_error = false;
#define print_analyzer_error(message) (void)(fprintf(stderr, "[analyzer Error] at %s: " message "\n", file)), has_error = true
#define analyzer_check(condition, message, run) \
    do {                                        \
        if (!(condition)) {                     \
            print_analyzer_error(message);      \
            run;                                \
        }                                       \
    } while (0)
#define check_not_null(member) assert(member != NULL)
#define check_is_null(member) assert(member == NULL)
static void fill_symbol_offset(SymbolTable* table, size_t base_offset);
static size_t get_type_size(Symbol* type);
static Symbol* calculate_type(Symbol* left, Symbol* right, OperatorType op);
static void analyze_import(Import* import);
static void analyze_class(Class* class);
static void analyze_function(Function* function);
static void analyze_method(Method* method);
static void analyze_variable(Variable* variable);
static void analyze_type(Symbol* type);
static void analyze_statement(Statement* statement);
static void analyze_body(list(Statement*) body);
static void analyze_expression(Expression* expression);
static void analyze_if(If* if_);
static void analyze_for(For* for_);
static void analyze_while(While* while_);
static void analyze_primary(Primary* primary);
static void analyze_variable_access(VariableAccess* variable_access);
static void analyze_var_access_var(VariableAccess* variable_access);
static void analyze_var_access_call(VariableAccess* variable_access);
static void analyze_var_access_attribute(VariableAccess* variable_access);
static void analyze_var_access_index(VariableAccess* variable_access);
static void analyze_symbol(Symbol* symbol);
static int loop_depth = 0;
static Symbol* return_type = NULL;
static string file = NULL;
AST* analyzer(AST* ast) {
    check_not_null(ast);
    check_not_null(ast->file);
    file = file_full_path(ast->file);
    check_not_null(ast->members);
    check_not_null(ast->table);
    has_error = false;
    foreach (SymbolTable*, table, global_symbol_table->children) {
        fill_symbol_offset(table, 0);
    }
    if (!list_empty(ast->members)) {
        foreach (CodeMember*, member, ast->members) {
            switch (member->type) {
                case CODE_CLASS:
                    analyze_class(member->member.class);
                    break;
                case CODE_FUNCTION:
                    analyze_function(member->member.function);
                    break;
                case CODE_IMPORT:
                    analyze_import(member->member.import);
                    break;
                default:
                    assert(false);
            }
        }
    }
    if (has_error) return NULL;
    return ast;
}
size_t get_type_size(Symbol* type) {
    if (type->kind == SYMBOL_CLASS)
        return pointer_size;
    return type->info.size;
}
void fill_symbol_offset(SymbolTable* table, size_t base_offset) {
    check_not_null(table);
    size_t offset = base_offset;
    if (table->type == SYMBOL_TABLE_CLASS || table->type == SYMBOL_TABLE_FUNCTION || table->type == SYMBOL_TABLE_METHOD)
        offset = 0;
    foreach (Symbol*, symbol, table->symbols) {
        if (symbol->kind != SYMBOL_VARIABLE && symbol->kind != SYMBOL_PARAMETER && symbol->kind != SYMBOL_ATTRIBUTE)
            continue;
        symbol->info.offset = offset;
        check_not_null(symbol->type);
        assert(symbol->type->kind == SYMBOL_TYPE || symbol->type->kind == SYMBOL_CLASS);
        offset += get_type_size(symbol->type);
    }
    foreach (SymbolTable*, child, table->children)
        fill_symbol_offset(child, offset);
}
#define is_arithmetic_op(op) (op == OP_ADD || op == OP_SUB || op == OP_MUL || op == OP_DIV || op == OP_MOD)
#define is_arithmetic_assign_op(op) (op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN)
#define is_comparison_op(op) (op == OP_LT || op == OP_GT || op == OP_LE || op == OP_GE)
#define is_equality_op(op) (op == OP_EQ || op == OP_NE)
#define is_logical_op(op) (op == OP_AND || op == OP_OR)
static bool is_number_type(Symbol* type) {
    return type == symbol_int || type == symbol_float || type == symbol_bool;
}
static Symbol* types_compatible(Symbol* left, Symbol* right) {
    if (right == NULL || left == NULL)
        return NULL;
    if (left == right)
        return left;
    if (is_number_type(left) && is_number_type(right)) {
        if (left == symbol_float || right == symbol_float)
            return symbol_float;
        if (left == symbol_int || right == symbol_int)
            return symbol_int;
        return symbol_bool;
    }
    return NULL;
}
static Symbol* find_method(SymbolTable* table, OperatorType op) {
    switch (op) {
        case OP_ADD:
            return search_symbol(table, SPECIAL_ADD, true, SYMBOL_METHOD, NULL);
        case OP_SUB:
            return search_symbol(table, SPECIAL_SUB, true, SYMBOL_METHOD, NULL);
        case OP_MUL:
            return search_symbol(table, SPECIAL_MUL, true, SYMBOL_METHOD, NULL);
        case OP_DIV:
            return search_symbol(table, SPECIAL_DIV, true, SYMBOL_METHOD, NULL);
        case OP_MOD:
            return search_symbol(table, SPECIAL_MOD, true, SYMBOL_METHOD, NULL);
        case OP_ASSIGN:
        case OP_ADD_ASSIGN:
        case OP_SUB_ASSIGN:
        case OP_MUL_ASSIGN:
        case OP_DIV_ASSIGN:
        case OP_MOD_ASSIGN:
        case OP_NONE:
            return NULL;
        case OP_EQ:
            return search_symbol(table, SPECIAL_EQ, true, SYMBOL_METHOD, NULL);
        case OP_NE:
            return search_symbol(table, SPECIAL_NE, true, SYMBOL_METHOD, NULL);
        case OP_LT:
            return search_symbol(table, SPECIAL_LT, true, SYMBOL_METHOD, NULL);
        case OP_GE:
            return search_symbol(table, SPECIAL_GE, true, SYMBOL_METHOD, NULL);
        case OP_GT:
            return search_symbol(table, SPECIAL_GT, true, SYMBOL_METHOD, NULL);
        case OP_LE:
            return search_symbol(table, SPECIAL_LE, true, SYMBOL_METHOD, NULL);
        case OP_AND:
            return search_symbol(table, SPECIAL_AND, true, SYMBOL_METHOD, NULL);
        case OP_OR:
            return search_symbol(table, SPECIAL_OR, true, SYMBOL_METHOD, NULL);
        case OP_NOT:
            return search_symbol(table, SPECIAL_NOT, true, SYMBOL_METHOD, NULL);
        case OP_NEG:
            return search_symbol(table, SPECIAL_NEG, true, SYMBOL_METHOD, NULL);
        default:
            return NULL;
    }
}
static Symbol* method_other_type(Symbol* method) {
    check_not_null(method);
    check_not_null(method->info.method);
    check_not_null(method->info.method->parameters);
    size_t param_count = 0;
    Symbol* second_param = NULL;
    foreach (Symbol*, param, method->info.method->parameters) {
        if (param_count == 0)
            analyzer_check(param->name == KEYWORD_SELF, "First parameter of method must be 'self'", return NULL);
        else if (param_count == 1)
            second_param = param;
        param_count++;
    }
    analyzer_check(param_count == 2, "Binary operations method must have exactly two parameters", return NULL);
    analyzer_check(second_param != NULL, "Second parameter of binary operations special method must not be NULL", return NULL);
    return second_param->type;
}
static VariableAccess* create_variable_access_var(Symbol* symbol) {
    VariableAccess* variable_access = create_struct(VariableAccess);
    variable_access->base = NULL;
    variable_access->access.var = symbol;
    variable_access->kind = VAR_ACCESS_VAR;
    variable_access->type = NULL;
    return variable_access;
}
static VariableAccess* create_variable_access_attribute(VariableAccess* base, Symbol* attribute) {
    VariableAccess* variable_access = create_struct(VariableAccess);
    variable_access->base = base;
    variable_access->access.attribute = attribute;
    variable_access->kind = VAR_ACCESS_ATTRIBUTE;
    variable_access->type = NULL;
    return variable_access;
}
static VariableAccess* create_variable_access_call(VariableAccess* base, Expression* argument) {
    VariableAccess* variable_access = create_struct(VariableAccess);
    variable_access->base = base;
    variable_access->access.args = list_create();
    variable_access->kind = VAR_ACCESS_CALL;
    variable_access->type = NULL;
    list_append(variable_access->access.args, (pointer)argument);
    return variable_access;
}
static Primary* create_primary_var_access(VariableAccess* variable_access) {
    Primary* primary = create_struct(Primary);
    primary->kind = PRIMARY_VAR_ACCESS;
    primary->value.var_access = variable_access;
    primary->type = NULL;
    return primary;
}
static Expression* create_expression_from_primary(Primary* primary) {
    Expression* expression = create_struct(Expression);
    expression->left.unary = primary;
    expression->op = OP_NONE;
    expression->right = NULL;
    expression->type = NULL;
    return expression;
}
static Symbol* create_comparison_method(Class* class, string method_name, Symbol* method_1, Symbol* method_2) {
    check_not_null(class);
    check_not_null(class->table);
    check_not_null(method_name);
    check_not_null(method_1);
    Method* method = create_struct(Method);
    method->body = list_create();
    method->parameters = list_create();
    method->special = true;
    method->type = symbol_bool;
    SymbolTable* method_table = create_symbol_table(SYMBOL_TABLE_METHOD, class->table);
    Symbol* self_symbol = create_symbol(KEYWORD_SELF, class->name, SYMBOL_PARAMETER, NULL, method_table);
    Symbol* other_type = method_other_type(method_1);
    if (method_2 != NULL) {
        Symbol* second_other_type = method_other_type(method_2);
        Symbol* compatible_type = types_compatible(other_type, second_other_type);
        analyzer_check(compatible_type != NULL, "The second parameter types of the two comparison methods must be compatible", return NULL);
        other_type = compatible_type;
    }
    Symbol* other_symbol = create_symbol(create_string("other", 5), other_type, SYMBOL_PARAMETER, NULL, method_table);
    list_append(method->parameters, (pointer)self_symbol);
    list_append(method->parameters, (pointer)other_symbol);
    VariableAccess* self_access = create_variable_access_var(self_symbol);
    VariableAccess* call_1_base = create_variable_access_attribute(self_access, method_1);
    Expression* other_argument = create_expression_from_primary(create_primary_var_access(create_variable_access_var(other_symbol)));
    VariableAccess* call_1_access = create_variable_access_call(call_1_base, other_argument);
    Expression* return_expression = NULL;
    if (method_2 == NULL) {
        Primary* call_primary = create_primary_var_access(call_1_access);
        Primary* not_primary = create_struct(Primary);
        not_primary->kind = PRIMARY_NOT;
        not_primary->value.not = call_primary;
        not_primary->type = NULL;
        return_expression = create_expression_from_primary(not_primary);
    } else {
        VariableAccess* call_2_base = create_variable_access_attribute(create_variable_access_var(self_symbol), method_2);
        Expression* other_argument_2 = create_expression_from_primary(create_primary_var_access(create_variable_access_var(other_symbol)));
        VariableAccess* call_2_access = create_variable_access_call(call_2_base, other_argument_2);
        Expression* left_expression = create_expression_from_primary(create_primary_var_access(call_1_access));
        Expression* right_expression = create_expression_from_primary(create_primary_var_access(call_2_access));
        return_expression = create_struct(Expression);
        return_expression->left.binary = left_expression;
        return_expression->op = OP_OR;
        return_expression->right = right_expression;
        return_expression->type = NULL;
    }
    Statement* statement = create_struct(Statement);
    statement->statement.return_ = return_expression;
    statement->type = STATEMENT_RETURN;
    list_append(method->body, (pointer)statement);
    method->name = create_symbol(method_name, method->type, SYMBOL_METHOD, (pointer)method, class->table);
    ClassMember* class_member = create_struct(ClassMember);
    class_member->type = CLASS_METHOD;
    class_member->member.method = method;
    list_append(class->members, (pointer)class_member);
    return method->name;
}
static void auto_fill_comparison_method(Class* class) {
    Symbol* eq = find_method(class->table, OP_EQ);
    Symbol* ne = find_method(class->table, OP_NE);
    Symbol* lt = find_method(class->table, OP_LT);
    Symbol* ge = find_method(class->table, OP_GE);
    Symbol* gt = find_method(class->table, OP_GT);
    Symbol* le = find_method(class->table, OP_LE);
    // TODO: support comparison object address
    if (!eq && !ne && (!(lt || ge) || !(gt || le))) {
        // eq = object identity comparison
    }
    while (true) {
        Symbol** method_0 = NULL;
        Symbol* method_1 = NULL;
        Symbol* method_2 = NULL;
        string method_name = NULL;
        if (!eq && ne) {  // eq = !ne
            method_0 = &eq;
            method_1 = ne;
            method_name = SPECIAL_EQ;
        }
        if (!ne && eq) {  // ne = !eq
            method_0 = &ne;
            method_1 = eq;
            method_name = SPECIAL_NE;
        }
        if (!lt && ge) {  // lt = !ge
            method_0 = &lt;
            method_1 = ge;
            method_name = SPECIAL_LT;
        }
        if (!ge && lt) {  // ge = !lt
            method_0 = &ge;
            method_1 = lt;
            method_name = SPECIAL_GE;
        }
        if (!gt && le) {  // gt = !le
            method_0 = &gt;
            method_1 = le;
            method_name = SPECIAL_GT;
        }
        if (!le && gt) {  // le = !gt
            method_0 = &le;
            method_1 = gt;
            method_name = SPECIAL_LE;
        }
        if (!le && eq && lt) {  // le = eq || lt
            method_0 = &le;
            method_1 = eq;
            method_2 = lt;
            method_name = SPECIAL_LE;
        }
        if (!ge && eq && gt) {  // ge = eq || gt
            method_0 = &ge;
            method_1 = eq;
            method_2 = gt;
            method_name = SPECIAL_GE;
        }
        if (!ne && lt && gt) {  // ne = lt || gt
            method_0 = &ne;
            method_1 = lt;
            method_2 = gt;
            method_name = SPECIAL_NE;
        }
        if (method_name == NULL)
            break;
        check_not_null(method_0);
        *method_0 = create_comparison_method(class, method_name, method_1, method_2);
    }
}
Symbol* calculate_type(Symbol* left, Symbol* right, OperatorType op) {
    // left type check
    check_not_null(left);
    if (left == symbol_void && right == NULL) return symbol_void;
    analyzer_check(left != symbol_void, "Cannot perform operations on void type", return symbol_void);
    assert(left->kind == SYMBOL_TYPE || left->kind == SYMBOL_CLASS);
    // unary operation
    if (right == NULL) {
        if (op == OP_NONE) return left;
        if (left->kind == SYMBOL_CLASS) {
            Symbol* method = find_method(left->info.class->table, op);
            if (method != NULL) {
                check_not_null(method->info.method);
                analyzer_check(!list_empty(method->info.method->parameters) && method->info.method->parameters->head == method->info.method->parameters->tail,
                               "Unary operation special method must have exactly one parameter", return symbol_void);
                analyzer_check(((Symbol*)method->info.method->parameters->head->data)->name == KEYWORD_SELF, "First parameter of method must be 'self'", return symbol_void);
                return method->type;
            }
        }
        if ((left == symbol_int || left == symbol_float) && op == OP_NEG) return left;
        if (op == OP_NOT) return symbol_bool;
        print_analyzer_error("Invalid unary operation");
        return symbol_void;
    }
    // right type check
    check_not_null(right);
    analyzer_check(right != symbol_void, "Cannot perform operations on void type", return symbol_void);
    assert(right->kind == SYMBOL_TYPE || right->kind == SYMBOL_CLASS);
    // binary operation
    if (is_logical_op(op))
        return symbol_bool;
    if (is_equality_op(op) && types_compatible(left, right) != NULL)
        return symbol_bool;
    if (is_comparison_op(op) && is_number_type(left) && is_number_type(right))
        return symbol_bool;
    if (is_arithmetic_op(op) && is_number_type(left) && is_number_type(right))
        return types_compatible(left, right);
    if (op == OP_ASSIGN && types_compatible(left, right) != NULL)
        return left;
    if (is_arithmetic_assign_op(op) && is_number_type(left) && types_compatible(left, right) != NULL)
        return left;
    if (left->kind == SYMBOL_CLASS) {
        Symbol* method = find_method(left->info.class->table, op);
        if (method != NULL && types_compatible(method_other_type(method), right) != NULL)
            return method->type;
    }
    if (right->kind == SYMBOL_CLASS) {
        Symbol* method = find_method(right->info.class->table, op);
        if (method != NULL && types_compatible(method_other_type(method), left) != NULL)
            return method->type;
    }
    print_analyzer_error("Invalid binary operation");
    fprintf(stderr, "[analyzer Warning]: Type mismatch, left: '%s', right: '%s', op: '%u'\n", left->name, right->name, op);
    return symbol_void;
}
void analyze_import(Import* import) {
    check_not_null(import);
    check_not_null(import->path);
    FILE* import_file = fopen(import->path, "r");
    analyzer_check(import_file != NULL, "Failed to open import file", return);
    fclose(import_file);
    analyze_symbol(import->name);
    if (import->name->kind == SYMBOL_CLASS)
        check_not_null(import->name->info.class);
    else if (import->name->kind == SYMBOL_FUNCTION)
        check_not_null(import->name->info.function);
    else
        print_analyzer_error("Imported symbol must be a class or function");
}
void analyze_class(Class* class) {
    check_not_null(class);
    analyze_symbol(class->name);
    check_not_null(class->members);
    auto_fill_comparison_method(class);
    if (!list_empty(class->members)) {
        foreach (ClassMember*, member, class->members) {
            switch (member->type) {
                case CLASS_METHOD:
                    analyze_method(member->member.method);
                    break;
                case CLASS_ATTRIBUTE:
                    analyze_variable(member->member.attribute);
                    break;
                default:
                    assert(false);
            }
        }
    }
}
void analyze_function(Function* function) {
    check_not_null(function);
    analyze_symbol(function->name);
    analyze_type(function->type);
    return_type = function->type;
    check_not_null(function->parameters);
    if (!list_empty(function->parameters)) {
        foreach (Symbol*, symbol, function->parameters) {
            analyze_symbol(symbol);
            assert(symbol->kind == SYMBOL_PARAMETER);
        }
    }
    analyze_body(function->body);
    return_type = NULL;
}
void analyze_method(Method* method) {
    check_not_null(method);
    analyze_symbol(method->name);
    analyze_type(method->type);
    return_type = method->type;
    analyzer_check(!list_empty(method->parameters), "Method must have at least one parameter (self)", return);
    size_t param_count = 0;
    foreach (Symbol*, symbol, method->parameters) {
        analyze_symbol(symbol);
        assert(symbol->kind == SYMBOL_PARAMETER);
        if (param_count == 0)
            analyzer_check(symbol->name == KEYWORD_SELF, "First parameter of method must be 'self'", return);
        param_count++;
    }
    analyze_body(method->body);
    return_type = NULL;
}
void analyze_variable(Variable* variable) {
    check_not_null(variable);
    analyze_symbol(variable->var);
    analyze_type(variable->var->type);
    if (variable->initializer != NULL) {
        analyze_expression(variable->initializer);
        analyzer_check(types_compatible(variable->var->type, variable->initializer->type) != NULL,
                       "Variable initializer type must be compatible with variable type", );
    }
}
static bool is_container_type(Symbol* type) {
    return type->name == KEYWORD_CONST || type->name == KEYWORD_POINTER || strcmp(type->name, "arr") == 0 || strcmp(type->name, "list") == 0;
}
void analyze_type(Symbol* type) {
    check_not_null(type);
    check_not_null(type->name);
    assert(type->kind == SYMBOL_TYPE || type->kind == SYMBOL_CLASS);
    if (type->type != NULL) {
        // assume that the container types only include arr, list, const and pointer
        analyzer_check(is_container_type(type), "Container types must be const, pointer, arr or list", return);
        analyze_type(type->type);
    }
    if (type->kind == SYMBOL_CLASS)
        check_not_null(type->info.class);
}
void analyze_statement(Statement* statement) {
    check_not_null(statement);
    switch (statement->type) {
        case STATEMENT_DECLARE_LIST:
            analyzer_check(!list_empty(statement->statement.declare_list), "Declare list statement must not be empty", return);
            foreach (Variable*, var, statement->statement.declare_list)
                analyze_variable(var);
            break;
        case STATEMENT_DECLARE:
            analyze_variable(statement->statement.declare);
            break;
        case STATEMENT_IF:
            analyze_if(statement->statement.if_);
            break;
        case STATEMENT_FOR:
            analyze_for(statement->statement.for_);
            break;
        case STATEMENT_WHILE:
            analyze_while(statement->statement.while_);
            break;
        case STATEMENT_BREAK:
        case STATEMENT_CONTINUE:
            analyzer_check(loop_depth > 0, "Break and continue statements must be inside a loop", return);
            break;
        case STATEMENT_RETURN:
            if (statement->statement.return_ != NULL)
                analyze_expression(statement->statement.return_);
            analyzer_check(return_type != NULL, "Return statement must be inside a function or method", );
            if (statement->statement.return_ == NULL) {
                analyzer_check(return_type == symbol_void, "Return statement type must be compatible with function or method return type", );
            } else {
                analyzer_check(types_compatible(return_type, statement->statement.return_->type) != NULL,
                               "Return statement type must be compatible with function or method return type", );
            }
            break;
        case STATEMENT_EXPRESSION:
            analyze_expression(statement->statement.expression);
            break;
        default:
            assert(false);
    }
}
void analyze_body(list(Statement*) body) {
    check_not_null(body);
    if (list_empty(body)) return;
    foreach (Statement*, statement, body) {
        analyze_statement(statement);
    }
}
void analyze_expression(Expression* expression) {
    check_not_null(expression);
    check_is_null(expression->type);  // why???
    if (expression->op == OP_NONE) {
        check_not_null(expression->left.unary);
        check_is_null(expression->right);
        analyze_primary(expression->left.unary);
        expression->type = calculate_type(expression->left.unary->type, NULL, OP_NONE);
    } else {
        check_not_null(expression->left.binary);
        check_not_null(expression->right);
        analyze_expression(expression->left.binary);
        analyze_expression(expression->right);
        expression->type = calculate_type(expression->left.binary->type, expression->right->type, expression->op);
    }
    analyzer_check(expression->type != NULL, "Expression type must not be NULL", expression->type = symbol_void);
}
void analyze_if(If* if_) {
    check_not_null(if_);
    check_not_null(if_->condition);
    check_not_null(if_->body);
    check_not_null(if_->elif_list);
    check_not_null(if_->else_body);
    analyze_expression(if_->condition);
    analyze_body(if_->body);
    if (!list_empty(if_->elif_list)) {
        foreach (If*, elif, if_->elif_list) {
            check_not_null(elif);
            check_not_null(elif->condition);
            check_not_null(elif->body);
            check_is_null(elif->else_body);
            check_is_null(elif->elif_list);
            analyze_expression(elif->condition);
            analyze_body(elif->body);
        }
    }
    if (!list_empty(if_->else_body))
        analyze_body(if_->else_body);
}
void analyze_for(For* for_) {
    check_not_null(for_);
    assert(loop_depth >= 0);
    check_not_null(for_->body);
    loop_depth++;
    if (for_->is_decl && for_->init.decl != NULL)
        analyze_variable(for_->init.decl);
    else if (!for_->is_decl && for_->init.expr != NULL)
        analyze_expression(for_->init.expr);
    if (for_->condition != NULL)
        analyze_expression(for_->condition);
    if (for_->increment != NULL)
        analyze_expression(for_->increment);
    analyze_body(for_->body);
    loop_depth--;
    assert(loop_depth >= 0);
}
void analyze_while(While* while_) {
    check_not_null(while_);
    assert(loop_depth >= 0);
    check_not_null(while_->condition);
    check_not_null(while_->body);
    loop_depth++;
    analyze_expression(while_->condition);
    analyze_body(while_->body);
    loop_depth--;
    assert(loop_depth >= 0);
}
void analyze_primary(Primary* primary) {
    check_not_null(primary);
    check_is_null(primary->type);
    switch (primary->kind) {
        case PRIMARY_INT:
            check_not_null(primary->value.literal);
            primary->type = symbol_int;
            break;
        case PRIMARY_FLOAT:
            check_not_null(primary->value.literal);
            primary->type = symbol_float;
            break;
        case PRIMARY_STRING:
            check_not_null(primary->value.literal);
            primary->type = symbol_string;
            break;
        case PRIMARY_BOOL:
            check_not_null(primary->value.literal);
            primary->type = symbol_bool;
            break;
        case PRIMARY_NOT:
            analyze_primary(primary->value.not);
            primary->type = calculate_type(primary->value.not->type, NULL, OP_NOT);
            break;
        case PRIMARY_NEG:
            analyze_primary(primary->value.neg);
            primary->type = calculate_type(primary->value.neg->type, NULL, OP_NEG);
            break;
        case PRIMARY_EXPR:
            analyze_expression(primary->value.exp);
            primary->type = primary->value.exp->type;
            break;
        case PRIMARY_VAR_ACCESS:
            analyze_variable_access(primary->value.var_access);
            primary->type = primary->value.var_access->type;
            break;
        default:
            assert(false);
    }
    analyzer_check(primary->type != NULL, "Primary expression type could not be determined", primary->type = symbol_void);
}
static void analyze_var_access_var(VariableAccess* variable_access) {
    check_not_null(variable_access->access.var);
    analyze_symbol(variable_access->access.var);
    check_is_null(variable_access->base);
    Symbol* var = variable_access->access.var;
    if (var->kind == SYMBOL_VARIABLE || var->kind == SYMBOL_PARAMETER || var->kind == SYMBOL_ATTRIBUTE)
        variable_access->type = var->type;
    else if (var->kind == SYMBOL_FUNCTION || var->kind == SYMBOL_METHOD || var->kind == SYMBOL_CLASS)
        variable_access->type = var;
    else
        assert(false);
}
#define max(a, b) ((a) > (b) ? (a) : (b))
#define min(a, b) ((a) < (b) ? (a) : (b))
static void analyze_var_access_call(VariableAccess* variable_access) {
    check_not_null(variable_access->base);
    check_not_null(variable_access->access.args);
    analyzer_check(variable_access->base->type != NULL, "Base of call has no type", return);
    size_t arg_count = 0;
    foreach (Expression*, arg, variable_access->access.args) {
        analyze_expression(arg);
        ++arg_count;
    }
    VariableAccess* base = variable_access->base;
    analyzer_check((base->kind == VAR_ACCESS_VAR && (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_CLASS)) ||
                       (base->kind == VAR_ACCESS_ATTRIBUTE && base->type->kind == SYMBOL_METHOD),
                   "Base of call must be a function, method or class", return);
    union {
        Function* function;
        Method* method;
    } callee;
    bool is_method = true;
    if (base->type->kind == SYMBOL_CLASS) {
        Symbol* init_method = search_symbol(base->type->info.class->table, SPECIAL_INIT, true, SYMBOL_METHOD, NULL);
        analyzer_check(init_method != NULL, "Class call must define '$init' special method", return);
        check_not_null(init_method->info.method);
        callee.method = init_method->info.method;
    } else if (base->type->kind == SYMBOL_FUNCTION) {
        check_not_null(base->type->info.function);
        callee.function = base->type->info.function;
        is_method = false;
    } else if (base->type->kind == SYMBOL_METHOD) {
        check_not_null(base->type->info.method);
        callee.method = base->type->info.method;
    } else {
        assert(false);
    }
    size_t param_count = 0;
    foreach (Symbol*, param, is_method ? callee.method->parameters : callee.function->parameters) param_count++;
    Symbol** param_types = calloc(max(arg_count, param_count), sizeof(Symbol*));
    size_t i = 0;
    foreach (Symbol*, param, is_method ? callee.method->parameters : callee.function->parameters) {
        assert(param->kind == SYMBOL_PARAMETER);
        param_types[i++] = param->type;
    }
    Symbol* name = is_method ? callee.method->name : callee.function->name;
    size_t compare_count = min(arg_count, param_count);
    if (is_method) --param_count;
    i = is_method ? 1 : 0;
    foreach (Expression*, arg, variable_access->access.args) {
        if (i >= compare_count)
            break;
        Symbol* param_type = param_types[i++];
        check_not_null(arg->type);
        check_not_null(param_type);
        analyzer_check(types_compatible(arg->type, param_type), "Argument type must match callee parameter type",
                       fprintf(stderr, "    Type mismatch in %s call '%s', expected '%s', got '%s'\n",
                               (is_method ? "method" : "function"), name->name, param_type->name, arg->type->name));
    }
    analyzer_check(arg_count == param_count, "Argument count must match callee parameter count",
                   fprintf(stderr, "    Argument count mismatch in %s call '%s', expected %zu, got %zu\n",
                           (is_method ? "method" : "function"), name->name, param_count, arg_count));
    if (base->type->kind == SYMBOL_CLASS)
        variable_access->type = base->type;
    else
        variable_access->type = base->type->type;
    free(param_types);
}
static void analyze_var_access_attribute(VariableAccess* variable_access) {
    check_not_null(variable_access->base);
    check_not_null(variable_access->access.attribute);
    analyzer_check(variable_access->base->type != NULL, "Base of attribute access has no type", return);
    analyze_symbol(variable_access->access.attribute);
    analyzer_check(variable_access->base->type->kind == SYMBOL_CLASS, "Base of attribute access must be a class", return);
    if (variable_access->access.attribute->kind == SYMBOL_METHOD)
        variable_access->type = variable_access->access.attribute;
    else if (variable_access->access.attribute->kind == SYMBOL_ATTRIBUTE)
        variable_access->type = variable_access->access.attribute->type;
    else
        assert(false);
}
static void analyze_var_access_index(VariableAccess* variable_access) {
    check_not_null(variable_access->base);
    check_not_null(variable_access->access.index);
    analyzer_check(variable_access->base->type != NULL, "Base of index access has no type", return);
    analyze_expression(variable_access->access.index);
    analyzer_check(types_compatible(variable_access->access.index->type, symbol_int) == symbol_int, "Index must be of type int", return);
    Symbol* type = variable_access->base->type;
    analyzer_check(is_container_type(type), "Index access base must be a container type", return);
    check_not_null(type->type);
    variable_access->type = type->type;
}
void analyze_variable_access(VariableAccess* variable_access) {
    check_not_null(variable_access);
    check_is_null(variable_access->type);
    if (variable_access->base != NULL) analyze_variable_access(variable_access->base);
    switch (variable_access->kind) {
        case VAR_ACCESS_VAR:
            analyze_var_access_var(variable_access);
            break;
        case VAR_ACCESS_CALL:
            analyze_var_access_call(variable_access);
            break;
        case VAR_ACCESS_ATTRIBUTE:
            analyze_var_access_attribute(variable_access);
            break;
        case VAR_ACCESS_INDEX:
            analyze_var_access_index(variable_access);
            break;
        default:
            assert(false);
    }
    analyzer_check(variable_access->type != NULL, "Variable access type could not be determined", variable_access->type = symbol_void);
}
void analyze_symbol(Symbol* symbol) {
    check_not_null(symbol);
    check_not_null(symbol->name);
    switch (symbol->kind) {
        case SYMBOL_TYPE:
            if (is_container_type(symbol))
                check_not_null(symbol->type);
            else
                check_is_null(symbol->type);
            break;
        case SYMBOL_VARIABLE:
            check_not_null(symbol->type);
            break;
        case SYMBOL_FUNCTION:
            check_not_null(symbol->type);
            check_not_null(symbol->info.function);
            break;
        case SYMBOL_CLASS:
            check_not_null(symbol->info.class);
            if (is_container_type(symbol))
                check_not_null(symbol->type);
            else
                check_is_null(symbol->type);
            break;
        case SYMBOL_METHOD:
            check_not_null(symbol->type);
            check_not_null(symbol->info.method);
            break;
        case SYMBOL_ATTRIBUTE:
            check_not_null(symbol->type);
            break;
        case SYMBOL_PARAMETER:
            check_not_null(symbol->type);
            break;
        default:
            assert(false);
    }
    if (symbol->type != NULL)
        analyze_type(symbol->type);
}
/*
All the functions implemented here are temporary and will be replaced by formal implementations in the future.
*/
// TODO: implement file handle functions, and complete struct File
static string get_cwd(void) {
#if PLATFORM == 1
    return _getcwd(NULL, 0);  // MSVC
#elif PLATFORM == 2 || PLATFORM == 3 || PLATFORM == 4
    return getcwd(NULL, 0);  // MinGW or LINUX or MACOS
#else
    return NULL;  // Unknown platform
#endif
}
static string normalization(string path) {
    if (path == NULL || path[0] == '\0') {
        return NULL;
    }
    string cwd = NULL;
#if PLATFORM == 1 || PLATFORM == 2
    bool path_has_drive = ((path[0] >= 'A' && path[0] <= 'Z') || (path[0] >= 'a' && path[0] <= 'z')) && path[1] == ':';
    bool path_is_absolute = path[0] == '/' || path[0] == '\\' || (path_has_drive && (path[2] == '/' || path[2] == '\\'));
#else
    bool path_is_absolute = path[0] == '/';
#endif
    if (!path_is_absolute) {
        cwd = get_cwd();
    }
    const char* sources[2];
    size_t source_count = 0;
    if (cwd != NULL) {
        sources[source_count++] = cwd;
    }
    sources[source_count++] = path;
    size_t capacity = strlen(path) + (cwd != NULL ? strlen(cwd) : 0) + 2;
    char* normalized = (char*)alloc_memory(capacity + 1, false);
    if (normalized == NULL) {
        if (cwd != NULL) {
            free(cwd);
        }
        return path;
    }
    size_t* checkpoints = (size_t*)alloc_memory((capacity + 1) * sizeof(size_t), false);
    if (checkpoints == NULL) {
        if (cwd != NULL) {
            free(cwd);
        }
        return path;
    }
    size_t out_len = 0;
    size_t depth = 0;
    size_t prefix_depth = 0;
    bool absolute_result = false;
    for (size_t source_index = 0; source_index < source_count; ++source_index) {
        const char* source = sources[source_index];
        size_t i = 0;
        if (source_index == 0) {
#if PLATFORM == 1 || PLATFORM == 2
            if (((source[0] >= 'A' && source[0] <= 'Z') || (source[0] >= 'a' && source[0] <= 'z')) && source[1] == ':') {
                normalized[out_len++] = source[0];
                normalized[out_len++] = ':';
                absolute_result = true;
                if (source[2] == '/' || source[2] == '\\') {
                    normalized[out_len++] = '/';
                    i = 3;
                } else {
                    i = 2;
                }
                prefix_depth = 1;
                checkpoints[depth++] = out_len;
            } else if (source[0] == '/' || source[0] == '\\') {
                normalized[out_len++] = '/';
                absolute_result = true;
                prefix_depth = 1;
                checkpoints[depth++] = out_len;
                while (source[i] == '/' || source[i] == '\\') {
                    ++i;
                }
            }
#else
            if (source[0] == '/') {
                normalized[out_len++] = '/';
                absolute_result = true;
                prefix_depth = 1;
                checkpoints[depth++] = out_len;
                while (source[i] == '/') {
                    ++i;
                }
            }
#endif
        }
        while (source[i] != '\0') {
            while (source[i] == '/' || source[i] == '\\') {
                ++i;
            }
            size_t start = i;
            while (source[i] != '\0' && source[i] != '/' && source[i] != '\\') {
                ++i;
            }
            size_t seg_len = i - start;
            if (seg_len == 0) {
                break;
            }
            if (seg_len == 1 && source[start] == '.') {
                continue;
            }
            if (seg_len == 2 && source[start] == '.' && source[start + 1] == '.') {
                if (depth > prefix_depth) {
                    size_t last_start;
                    if (depth == 1) {
                        last_start = prefix_depth > 0 ? out_len : 0;
                    } else {
                        last_start = checkpoints[depth - 2] + 1;
                    }
                    size_t last_len = checkpoints[depth - 1] - last_start;
                    if (!(last_len == 2 && normalized[last_start] == '.' && normalized[last_start + 1] == '.')) {
                        if (depth == 1) {
                            out_len = 0;
                        } else {
                            out_len = checkpoints[depth - 2];
                        }
                        --depth;
                        continue;
                    }
                }
                if (!absolute_result) {
                    if (out_len > 0 && normalized[out_len - 1] != '/') {
                        normalized[out_len++] = '/';
                    }
                    normalized[out_len++] = '.';
                    normalized[out_len++] = '.';
                    checkpoints[depth++] = out_len;
                }
                continue;
            }
            if (out_len > 0 && normalized[out_len - 1] != '/') {
                normalized[out_len++] = '/';
            }
            memcpy(normalized + out_len, source + start, seg_len);
            out_len += seg_len;
            checkpoints[depth++] = out_len;
        }
    }
    if (out_len == 0) {
        normalized[out_len++] = '.';
    }
    normalized[out_len] = '\0';
    string result = create_string(normalized, out_len);
    if (cwd != NULL) {
        free(cwd);
    }
    return result;
}
File* create_file(string path) {
    File* file = create_struct(File);
    file->path = normalization(path);
    return file;
}
string read_source_code(File* file, size_t* size) {
    FILE* open_file = fopen(file->path, "r");
    if (open_file == NULL) {
        fprintf(stderr, "[fill Error] at <read_source_code> Cannot open file: %s\n", file->path);
        return NULL;
    }
    fseek(open_file, 0, SEEK_END);
    *size = (size_t)ftell(open_file);
    fseek(open_file, 0, SEEK_SET);
    string content = (string)alloc_memory(*size, false);
    size_t len = fread(content, 1, *size, open_file);
    for (size_t i = len; i < *size; ++i) {
        content[i] = '\0';
    }
    *size = len;
    fclose(open_file);
    return content;
}
string file_full_path(File* file) {
    return file->path;
}
string change_extension(File* file, const char* new_extension) {
    string path = file->path;
    size_t len = strlen(path);
    size_t i = len;
    while (i > 0 && path[i - 1] != '.' && path[i - 1] != '/' && path[i - 1] != '\\') {
        --i;
    }
    if (i == 0 || path[i - 1] == '/' || path[i - 1] == '\\') {
        return string_splice("%s%s", path, new_extension);
    } else {
        return string_splice("%.*s%s", (int)(i - 1), path, new_extension);
    }
}
string file_dir_path(File* file) {
    string path = file->path;
    size_t len = strlen(path);
    while (len > 0 && path[len - 1] != '/' && path[len - 1] != '\\') {
        --len;
    }
    if (len == 0) {
        return ".";
    } else {
        return create_string(path, len - 1);
    }
}
static bool is_keyword(string str) {
    for (size_t i = 0; i < keywordCount; ++i) {
        if (str == keywordList[i]) {
            return true;
        }
    }
    return false;
}
#define is_digit(c) ((c) >= '0' && (c) <= '9')
#define is_alphabet(c) ((c) >= 'a' && (c) <= 'z') || ((c) >= 'A' && (c) <= 'Z')
#define lexer_error(message, line, column, filename) fprintf(stderr, "[lexer Error] at %s:%zu:%zu: %s\n", filename, line + 1, column + 1, message)
static Token* create_token(TokenType type, string lexeme, size_t line, size_t column) {
    Token* token = create_struct(Token);
    token->type = type;
    if (type == TOKEN_IDENTIFIER && is_keyword(lexeme)) {
        token->type = TOKEN_KEYWORD;
    }
    if (type == TOKEN_SPECIAL && !is_special(lexeme)) {
        return NULL;
    }
    token->lexeme = lexeme;
    token->line = line;
    token->column = column;
    return token;
}
static Token* get_token(Lexer* lexer) {
    while (true) {
        char c = lexer->source_code[lexer->pos++];
        lexer->column++;
        if (c == '\0') {
            return create_token(TOKEN_EOF, NULL, lexer->line, lexer->column);
        } else if (c == ' ' || c == '\t' || c == '\r') {
            continue;
        } else if (c == '\n') {
            lexer->line++;
            lexer->column = 0;
            continue;
        } else if (is_alphabet(c) || c == '_' || c == '$') {
            bool is_special = (c == '$');
            size_t start = lexer->pos - 1;
            size_t column_start = lexer->column - 1;
            do {
                c = lexer->source_code[lexer->pos++];
                lexer->column++;
            } while (is_alphabet(c) || is_digit(c) || c == '_');
            lexer->pos -= 1;
            lexer->column -= 1;
            string content = create_string(&lexer->source_code[start], lexer->pos - start);
            if (is_special) {
                Token* token = create_token(TOKEN_SPECIAL, content, lexer->line, column_start);
                if (token == NULL) {
                    lexer_error("Invalid special method", lexer->line, column_start, file_full_path(lexer->source_path));
                    return create_token(TOKEN_IDENTIFIER, content, lexer->line, column_start);
                }
                return token;
            }
            return create_token(TOKEN_IDENTIFIER, content, lexer->line, column_start);
        } else if (is_digit(c)) {
            size_t start = lexer->pos - 1;
            size_t column_start = lexer->column - 1;
            while (is_digit(c)) {
                c = lexer->source_code[lexer->pos++];
                lexer->column++;
            }
            TokenType type = TOKEN_INTEGER;
            char p = lexer->source_code[lexer->pos];
            if (c == '.' && (is_digit(p))) {
                c = lexer->source_code[lexer->pos++];
                lexer->column++;
                while (is_digit(c)) {
                    c = lexer->source_code[lexer->pos++];
                    lexer->column++;
                }
                type = TOKEN_FLOAT;
            }
            lexer->pos -= 1;
            lexer->column -= 1;
            return create_token(type, create_string(&lexer->source_code[start], lexer->pos - start), lexer->line, column_start);
        } else if (c == '"') {
            size_t start = lexer->pos;
            size_t column_start = lexer->column - 1;
            c = lexer->source_code[lexer->pos++];
            lexer->column++;
            while (c != '"' && c != '\0' && c != '\n') {
                c = lexer->source_code[lexer->pos++];
                lexer->column++;
            }
            if (c != '"') {
                lexer_error("Unterminated string literal", lexer->line, start - 1, file_full_path(lexer->source_path));
                if (c == '\n') {
                    lexer->line++;
                    lexer->column = 0;
                }
            }
            if (lexer->pos - start == 1) {
                return create_token(TOKEN_STRING, create_string("\0", 1), lexer->line, column_start);
            }
            return create_token(TOKEN_STRING, create_string(&lexer->source_code[start], lexer->pos - start - 1), lexer->line, column_start);
        } else {
            char p = lexer->source_code[lexer->pos];
            if (c == '/' && p == '/') {
                size_t start = lexer->pos + 1;
                size_t column_start = lexer->column - 1;
                while (c != '\n' && c != '\0') {
                    c = lexer->source_code[lexer->pos++];
                    lexer->column++;
                }
                lexer->pos -= 1;
                lexer->column -= 1;
                return create_token(TOKEN_COMMENT, create_string(&lexer->source_code[start], lexer->pos - start), lexer->line, column_start);
            } else if (c == '/' && p == '*') {
                size_t start = lexer->pos + 1;
                size_t column_start = lexer->column - 1;
                size_t line_start = lexer->line;
                while (!(c == '*' && p == '/')) {
                    c = lexer->source_code[lexer->pos++];
                    lexer->column++;
                    p = lexer->source_code[lexer->pos];
                    if (c == '\n') {
                        lexer->line++;
                        lexer->column = 0;
                    }
                    if (p == '\0') {
                        break;
                    }
                    assert(c != '\0');
                }
                if (p == '\0') {
                    if (c == '\0') {
                        lexer->pos -= 1;
                        lexer->column -= 1;
                    }
                    lexer_error("Unterminated comment", lexer->line, start, file_full_path(lexer->source_path));
                    return create_token(TOKEN_COMMENT, create_string(&lexer->source_code[start], lexer->pos - start), line_start, column_start);
                }
                c = lexer->source_code[lexer->pos++];
                lexer->column++;
                return create_token(TOKEN_COMMENT, create_string(&lexer->source_code[start], lexer->pos - start - 2), line_start, column_start);
            } else if (c == '=' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_EQ, lexer->line, lexer->column - 2);
            } else if (c == '!' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_NE, lexer->line, lexer->column - 2);
            } else if (c == '<' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_LE, lexer->line, lexer->column - 2);
            } else if (c == '>' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_GE, lexer->line, lexer->column - 2);
            } else if (c == '+' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_ADD_ASSIGN, lexer->line, lexer->column - 2);
            } else if (c == '-' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_SUB_ASSIGN, lexer->line, lexer->column - 2);
            } else if (c == '*' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_MUL_ASSIGN, lexer->line, lexer->column - 2);
            } else if (c == '/' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_DIV_ASSIGN, lexer->line, lexer->column - 2);
            } else if (c == '%' && p == '=') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_MOD_ASSIGN, lexer->line, lexer->column - 2);
            } else if (c == '&' && p == '&') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_AND, lexer->line, lexer->column - 2);
            } else if (c == '|' && p == '|') {
                lexer->column++;
                lexer->pos++;
                return create_token(TOKEN_SYMBOL, SYMBOL_OR, lexer->line, lexer->column - 2);
            } else if (c == '(') {
                return create_token(TOKEN_SYMBOL, SYMBOL_L_PAREN, lexer->line, lexer->column - 1);
            } else if (c == ')') {
                return create_token(TOKEN_SYMBOL, SYMBOL_R_PAREN, lexer->line, lexer->column - 1);
            } else if (c == '{') {
                return create_token(TOKEN_SYMBOL, SYMBOL_L_BRACE, lexer->line, lexer->column - 1);
            } else if (c == '}') {
                return create_token(TOKEN_SYMBOL, SYMBOL_R_BRACE, lexer->line, lexer->column - 1);
            } else if (c == ',') {
                return create_token(TOKEN_SYMBOL, SYMBOL_COMMA, lexer->line, lexer->column - 1);
            } else if (c == '!') {
                return create_token(TOKEN_SYMBOL, SYMBOL_NOT, lexer->line, lexer->column - 1);
            } else if (c == '.') {
                return create_token(TOKEN_SYMBOL, SYMBOL_DOT, lexer->line, lexer->column - 1);
            } else if (c == '[') {
                return create_token(TOKEN_SYMBOL, SYMBOL_L_BRACKET, lexer->line, lexer->column - 1);
            } else if (c == ']') {
                return create_token(TOKEN_SYMBOL, SYMBOL_R_BRACKET, lexer->line, lexer->column - 1);
            } else if (c == ';') {
                return create_token(TOKEN_SYMBOL, SYMBOL_SEMICOLON, lexer->line, lexer->column - 1);
            } else if (c == '_') {
                return create_token(TOKEN_SYMBOL, SYMBOL_UNDERLINE, lexer->line, lexer->column - 1);
            } else if (c == '+') {
                return create_token(TOKEN_SYMBOL, SYMBOL_ADD, lexer->line, lexer->column - 1);
            } else if (c == '-') {
                return create_token(TOKEN_SYMBOL, SYMBOL_SUB, lexer->line, lexer->column - 1);
            } else if (c == '*') {
                return create_token(TOKEN_SYMBOL, SYMBOL_MUL, lexer->line, lexer->column - 1);
            } else if (c == '/') {
                return create_token(TOKEN_SYMBOL, SYMBOL_DIV, lexer->line, lexer->column - 1);
            } else if (c == '%') {
                return create_token(TOKEN_SYMBOL, SYMBOL_MOD, lexer->line, lexer->column - 1);
            } else if (c == '<') {
                return create_token(TOKEN_SYMBOL, SYMBOL_LT, lexer->line, lexer->column - 1);
            } else if (c == '>') {
                return create_token(TOKEN_SYMBOL, SYMBOL_GT, lexer->line, lexer->column - 1);
            } else if (c == '=') {
                return create_token(TOKEN_SYMBOL, SYMBOL_ASSIGN, lexer->line, lexer->column - 1);
            } else {
                lexer_error("Unexpected character", lexer->line, lexer->column - 1, file_full_path(lexer->source_path));
                return create_token(TOKEN_EOF, NULL, 0, 0);
            }
        }
    }
}
Token* get_next_token(Lexer* lexer) {
    if (lexer->next_token != NULL) {
        lexer->current_token = lexer->next_token;
    } else {
        do {
            lexer->current_token = get_token(lexer);
        } while (lexer->skip_comment && lexer->current_token->type == TOKEN_COMMENT);
    }
    lexer->next_token = NULL;
    return lexer->current_token;
}
Token* peek_next_token(Lexer* lexer) {
    if (lexer->next_token == NULL) {
        do {
            lexer->next_token = get_token(lexer);
        } while (lexer->skip_comment && lexer->next_token->type == TOKEN_COMMENT);
    }
    return lexer->next_token;
}
Token* get_current_token(Lexer* lexer) {
    if (lexer->current_token == NULL) {
        do {
            lexer->current_token = get_token(lexer);
        } while (lexer->skip_comment && lexer->current_token->type == TOKEN_COMMENT);
    }
    return lexer->current_token;
}
Lexer* create_lexer(File* source_path) {
    Lexer* lexer = create_struct(Lexer);
    lexer->source_path = source_path;
    lexer->source_code = read_source_code(source_path, &lexer->size);
    lexer->line = 0;
    lexer->column = 0;
    lexer->pos = 0;
    lexer->current_token = NULL;
    lexer->next_token = NULL;
    return lexer;
}
void output_tokens(Lexer* lexer, File* output_path) {
    FILE* file = fopen(change_extension(output_path, ".lex"), "w");
    for (Token* token = get_next_token(lexer); token != NULL; token = get_next_token(lexer)) {
        output_one_token(token, file, true);
        if (token->type == TOKEN_EOF) break;
    }
    fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
    fclose(file);
}
void output_one_token(Token* token, FILE* file, bool is_lexer_mode) {
    if (is_lexer_mode) {
        switch (token->type) {
            case TOKEN_EOF:
                fprintf(file, "Token(Type: EOF,         Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
                return;
            case TOKEN_IDENTIFIER:
                fputs("Token(Type: identifier,  ", file);
                break;
            case TOKEN_INTEGER:
                fputs("Token(Type: integer,     ", file);
                break;
            case TOKEN_FLOAT:
                fputs("Token(Type: float,       ", file);
                break;
            case TOKEN_STRING:
                fputs("Token(Type: string,      ", file);
                break;
            case TOKEN_SYMBOL:
                fputs("Token(Type: symbol,      ", file);
                break;
            case TOKEN_KEYWORD:
                fputs("Token(Type: keyword,     ", file);
                break;
            case TOKEN_COMMENT:
                fputs("Token(Type: comment,     ", file);
                break;
            case TOKEN_SPECIAL:
                fputs("Token(Type: special,     ", file);
                break;
            default:
                fprintf(file, "Token(Type: unknown,     Line: %zu, Column: %zu)\n", token->line + 1, token->column + 1);
                return;
        }
        fprintf(file, "Line: %zu, Column: %zu)\tLexeme: '", token->line + 1, token->column + 1);
    } else {
        switch (token->type) {
            case TOKEN_EOF:
                fprintf(file, "(EOF, %zu, %zu, '')\n", token->line + 1, token->column + 1);
                return;
            case TOKEN_IDENTIFIER:
                fputs("(identifier, ", file);
                break;
            case TOKEN_INTEGER:
                fputs("(integer, ", file);
                break;
            case TOKEN_FLOAT:
                fputs("(float, ", file);
                break;
            case TOKEN_STRING:
                fputs("(string, ", file);
                break;
            case TOKEN_SYMBOL:
                fputs("(symbol, ", file);
                break;
            case TOKEN_KEYWORD:
                fputs("(keyword, ", file);
                break;
            case TOKEN_COMMENT:
                fputs("(comment, ", file);
                break;
            case TOKEN_SPECIAL:
                fputs("(special, ", file);
                break;
            default:
                fprintf(file, "(unknown, %zu, %zu, '')\n", token->line + 1, token->column + 1);
                return;
        }
        fprintf(file, "%zu, %zu, '", token->line + 1, token->column + 1);
    }
    if (token->lexeme == NULL) {
        fprintf(file, "(null)'\n");
    } else {
        for (size_t i = 0; i < strlen(token->lexeme); ++i) {
            char c = token->lexeme[i];
            if (c == '\0')
                fputs("\\0", file);
            else if (c == '\n')
                fputs("\\n", file);
            else if (c == '\t')
                fputs("\\t", file);
            else if (c == '\r')
                fputs("\\r", file);
            else
                fputc(c, file);
        }
    }
    if (is_lexer_mode) {
        fputs("'\n", file);
    } else {
        fputs("')\n", file);
    }
}
MemoryBlock* string_memory = NULL;
MemoryBlock* struct_memory = NULL;
static size_t malloc_allocated = 0;
static size_t string_count = 0;
static StringTable* string_table = NULL;
static void free_all_memory(void) {
    MemoryBlock* block = string_memory;
    while (block != NULL) {
        MemoryBlock* next = block->next;
        free(block->data);
        free(block);
        block = next;
    }
    string_memory = NULL;
    block = struct_memory;
    while (block != NULL) {
        MemoryBlock* next = block->next;
        free(block->data);
        free(block);
        block = next;
    }
    struct_memory = NULL;
}
static MemoryBlock* create_memory_block(size_t size) {
    MemoryBlock* block = malloc(sizeof(MemoryBlock));
    if (block == NULL) {
        fprintf(stderr, "[lib Fatal] at <create_memory_block>: Cannot allocate memory\n");
        free_all_memory();
        abort();
    }
    malloc_allocated += sizeof(MemoryBlock);
    block->size = size;
    block->used = 0;
    block->data = malloc(size);
    if (block->data == NULL) {
        fprintf(stderr, "[lib Fatal] at <create_memory_block>: Cannot allocate memory\n");
        free(block);
        free_all_memory();
        abort();
    }
    malloc_allocated += size;
    block->next = NULL;
    return block;
}
static void increase_memory(MemoryBlock** block, size_t additional_size) {
    MemoryBlock* new_block = create_memory_block((*block)->size + additional_size);
    new_block->next = *block;
    *block = new_block;
}
static StringTable* create_string_table(size_t capacity) {
    StringTable* table = create_struct(StringTable);
    table->capacity = capacity;
    table->count = 0;
    table->buckets = calloc(capacity, sizeof(StringNode*));
    return table;
}
// FNV-1a hash function
static size_t hash(const char* str, size_t len) {
    size_t hash_value = 2166136261;
    for (size_t i = 0; i < len; i++) {
        hash_value ^= (unsigned char)str[i];
        hash_value *= 16777619;
    }
    return hash_value;
}
static string create_string_check(const char* str, size_t len, bool check) {
    size_t hash_value = hash(str, len);
    size_t index = hash_value % string_table->capacity;
    if (check) {
        StringNode* current = string_table->buckets[index];
        while (current != NULL) {
            if (current->size == len && current->hash == hash_value && strncmp(current->value, str, len) == 0)
                return current->value;
            current = current->next;
        }
    }
    StringNode* node = create_struct(StringNode);
    node->size = len;
    node->hash = hash_value;
    node->next = string_table->buckets[index];
    node->value = (string)alloc_memory(len + 1, false);
    memcpy(node->value, str, len);
    node->value[len] = '\0';
    string_table->buckets[index] = node;
    string_table->count++;
    string_count++;
    return node->value;
}
static void init_constant(void);
void init(void) {
    if (string_memory == NULL)
        string_memory = create_memory_block(DEFAULT_MEMORY_SIZE);
    if (struct_memory == NULL)
        struct_memory = create_memory_block(DEFAULT_MEMORY_SIZE);
    if (string_table == NULL)
        string_table = create_string_table(1024);
    init_constant();
}
string create_string(const char* str, size_t len) {
    return create_string_check(str, len, true);
}
pointer alloc_memory(size_t size, bool is_struct) {
    if (size >= DEFAULT_MEMORY_SIZE) {
        pointer ptr = malloc(size);
        if (ptr == NULL) {
            fprintf(stderr, "[lib Fatal] at <alloc_memory>: Cannot allocate memory\n");
            free(ptr);
            free_all_memory();
            abort();
        }
        malloc_allocated += size;
        return ptr;
    }
    MemoryBlock* block = string_memory;
    if (is_struct) {
        block = struct_memory;
        size = (size + ALIGN_SIZE - 1) & ~(ALIGN_SIZE - 1);
    }
    while (block != NULL) {
        if (block->size - block->used >= size) {
            pointer ptr = (void*)(block->data + block->used);
            if (is_struct)
                assert((size_t)ptr % ALIGN_SIZE == 0);
            if (block->size - block->used >= size) {
                block->used += size;
                return ptr;
            }
        }
        block = block->next;
    }
    if (is_struct)
        increase_memory(&struct_memory, size);
    else
        increase_memory(&string_memory, size);
    return alloc_memory(size, is_struct);
}
string string_splice(string format, ...) {
    va_list args;
    va_start(args, format);
    int length = vsnprintf(NULL, 0, format, args);
    va_end(args);
    if (length <= 0) {
        fprintf(stderr, "[lib Error] at <string_splice>: Failed to format string\n");
        return NULL;
    }
    char* name = malloc((size_t)length + 1);
    if (name == NULL) {
        fprintf(stderr, "[lib Fatal] at <string_splice>: Cannot allocate memory\n");
        free_all_memory();
        abort();
    }
    va_start(args, format);
    vsnprintf(name, (size_t)length + 1, format, args);
    va_end(args);
    string result = create_string(name, (size_t)length);
    free(name);
    return result;
}
string get_info(void) {
    size_t used_memory_count = 0;
    size_t total_memory_count = 0;
    size_t memory_block_count = 0;
    MemoryBlock* block = struct_memory;
    while (block != NULL) {
        used_memory_count += block->used;
        total_memory_count += block->size;
        ++memory_block_count;
        block = block->next;
    }
    string struct_info = string_splice("struct memory: [used/total: %zu/%zu, blocks: %zu]", used_memory_count, total_memory_count, memory_block_count);
    used_memory_count = 0;
    total_memory_count = 0;
    memory_block_count = 0;
    block = string_memory;
    while (block != NULL) {
        used_memory_count += block->used;
        total_memory_count += block->size;
        ++memory_block_count;
        block = block->next;
    }
    string string_info = string_splice("string memory: [used/total: %zu/%zu, blocks: %zu]", used_memory_count, total_memory_count, memory_block_count);
    return string_splice("platform: %d, malloc allocated: %zu, %s, %s", PLATFORM, malloc_allocated, string_info, struct_info);
}
static const char* keywordStrings[keywordCount] = {"import", "from", "func", "class", "method", "self", "if", "elif", "else", "while", "for", "true", "false", "return", "break", "continue", "int", "float", "string", "bool", "void", "var", "pointer", "const"};
string keywordList[keywordCount] = {0};
static const char* symbolStrings[symbolCount] = {"(", ")", "{", "}", ",", "!", ".", "[", "]", ";", "_", "+", "-", "*", "/", "%", "<", ">", "=", "==", "!=", "<=", ">=", "+=", "-=", "*=", "/=", "%=", "&&", "||"};
string symbolList[symbolCount] = {0};
static const char* specialStrings[specialCount] = {"$init", "$to_int", "$to_float", "$to_string", "$to_bool", "$add", "$sub", "$mul", "$div", "$mod", "$eq", "$ne", "$lt", "$ge", "$gt", "$le", "$and", "$or", "$not", "$neg"};
string specialList[specialCount] = {0};
string KEYWORD_IMPORT = NULL;
string KEYWORD_FROM = NULL;
string KEYWORD_FUNC = NULL;
string KEYWORD_CLASS = NULL;
string KEYWORD_METHOD = NULL;
string KEYWORD_SELF = NULL;
string KEYWORD_IF = NULL;
string KEYWORD_ELIF = NULL;
string KEYWORD_ELSE = NULL;
string KEYWORD_WHILE = NULL;
string KEYWORD_FOR = NULL;
string KEYWORD_TRUE = NULL;
string KEYWORD_FALSE = NULL;
string KEYWORD_RETURN = NULL;
string KEYWORD_BREAK = NULL;
string KEYWORD_CONTINUE = NULL;
string KEYWORD_INT = NULL;
string KEYWORD_FLOAT = NULL;
string KEYWORD_STRING = NULL;
string KEYWORD_BOOL = NULL;
string KEYWORD_VOID = NULL;
string KEYWORD_VAR = NULL;
string KEYWORD_POINTER = NULL;
string KEYWORD_CONST = NULL;
string SYMBOL_L_PAREN = NULL;
string SYMBOL_R_PAREN = NULL;
string SYMBOL_L_BRACE = NULL;
string SYMBOL_R_BRACE = NULL;
string SYMBOL_COMMA = NULL;
string SYMBOL_NOT = NULL;
string SYMBOL_DOT = NULL;
string SYMBOL_L_BRACKET = NULL;
string SYMBOL_R_BRACKET = NULL;
string SYMBOL_SEMICOLON = NULL;
string SYMBOL_UNDERLINE = NULL;
string SYMBOL_ADD = NULL;
string SYMBOL_SUB = NULL;
string SYMBOL_MUL = NULL;
string SYMBOL_DIV = NULL;
string SYMBOL_MOD = NULL;
string SYMBOL_LT = NULL;
string SYMBOL_GT = NULL;
string SYMBOL_ASSIGN = NULL;
string SYMBOL_EQ = NULL;
string SYMBOL_NE = NULL;
string SYMBOL_LE = NULL;
string SYMBOL_GE = NULL;
string SYMBOL_ADD_ASSIGN = NULL;
string SYMBOL_SUB_ASSIGN = NULL;
string SYMBOL_MUL_ASSIGN = NULL;
string SYMBOL_DIV_ASSIGN = NULL;
string SYMBOL_MOD_ASSIGN = NULL;
string SYMBOL_AND = NULL;
string SYMBOL_OR = NULL;
string SPECIAL_INIT = NULL;
string SPECIAL_TO_INT = NULL;
string SPECIAL_TO_FLOAT = NULL;
string SPECIAL_TO_STRING = NULL;
string SPECIAL_TO_BOOL = NULL;
string SPECIAL_ADD = NULL;
string SPECIAL_SUB = NULL;
string SPECIAL_MUL = NULL;
string SPECIAL_DIV = NULL;
string SPECIAL_MOD = NULL;
string SPECIAL_EQ = NULL;
string SPECIAL_NE = NULL;
string SPECIAL_LT = NULL;
string SPECIAL_GE = NULL;
string SPECIAL_GT = NULL;
string SPECIAL_LE = NULL;
string SPECIAL_AND = NULL;
string SPECIAL_OR = NULL;
string SPECIAL_NOT = NULL;
string SPECIAL_NEG = NULL;
SymbolTable* global_symbol_table = NULL;
Symbol* symbol_int = NULL;
Symbol* symbol_float = NULL;
Symbol* symbol_string = NULL;
Symbol* symbol_bool = NULL;
Symbol* symbol_void = NULL;
Symbol* symbol_pointer = NULL;
Symbol* symbol_const = NULL;
list(AST*) parsed_files = NULL;
static void init_constant(void) {
    for (size_t i = 0; i < keywordCount; ++i) {
        keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), false);
    }
    KEYWORD_IMPORT = keywordList[0];
    KEYWORD_FROM = keywordList[1];
    KEYWORD_FUNC = keywordList[2];
    KEYWORD_CLASS = keywordList[3];
    KEYWORD_METHOD = keywordList[4];
    KEYWORD_SELF = keywordList[5];
    KEYWORD_IF = keywordList[6];
    KEYWORD_ELIF = keywordList[7];
    KEYWORD_ELSE = keywordList[8];
    KEYWORD_WHILE = keywordList[9];
    KEYWORD_FOR = keywordList[10];
    KEYWORD_TRUE = keywordList[11];
    KEYWORD_FALSE = keywordList[12];
    KEYWORD_RETURN = keywordList[13];
    KEYWORD_BREAK = keywordList[14];
    KEYWORD_CONTINUE = keywordList[15];
    KEYWORD_INT = keywordList[16];
    KEYWORD_FLOAT = keywordList[17];
    KEYWORD_STRING = keywordList[18];
    KEYWORD_BOOL = keywordList[19];
    KEYWORD_VOID = keywordList[20];
    KEYWORD_VAR = keywordList[21];
    KEYWORD_POINTER = keywordList[22];
    KEYWORD_CONST = keywordList[23];
    for (size_t i = 0; i < symbolCount; ++i) {
        symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), false);
    }
    SYMBOL_L_PAREN = symbolList[0];
    SYMBOL_R_PAREN = symbolList[1];
    SYMBOL_L_BRACE = symbolList[2];
    SYMBOL_R_BRACE = symbolList[3];
    SYMBOL_COMMA = symbolList[4];
    SYMBOL_NOT = symbolList[5];
    SYMBOL_DOT = symbolList[6];
    SYMBOL_L_BRACKET = symbolList[7];
    SYMBOL_R_BRACKET = symbolList[8];
    SYMBOL_SEMICOLON = symbolList[9];
    SYMBOL_UNDERLINE = symbolList[10];
    SYMBOL_ADD = symbolList[11];
    SYMBOL_SUB = symbolList[12];
    SYMBOL_MUL = symbolList[13];
    SYMBOL_DIV = symbolList[14];
    SYMBOL_MOD = symbolList[15];
    SYMBOL_LT = symbolList[16];
    SYMBOL_GT = symbolList[17];
    SYMBOL_ASSIGN = symbolList[18];
    SYMBOL_EQ = symbolList[19];
    SYMBOL_NE = symbolList[20];
    SYMBOL_LE = symbolList[21];
    SYMBOL_GE = symbolList[22];
    SYMBOL_ADD_ASSIGN = symbolList[23];
    SYMBOL_SUB_ASSIGN = symbolList[24];
    SYMBOL_MUL_ASSIGN = symbolList[25];
    SYMBOL_DIV_ASSIGN = symbolList[26];
    SYMBOL_MOD_ASSIGN = symbolList[27];
    SYMBOL_AND = symbolList[28];
    SYMBOL_OR = symbolList[29];
    for (size_t i = 0; i < specialCount; ++i) {
        specialList[i] = create_string_check(specialStrings[i], strlen(specialStrings[i]), false);
    }
    SPECIAL_INIT = specialList[0];
    SPECIAL_TO_INT = specialList[1];
    SPECIAL_TO_FLOAT = specialList[2];
    SPECIAL_TO_STRING = specialList[3];
    SPECIAL_TO_BOOL = specialList[4];
    SPECIAL_ADD = specialList[5];
    SPECIAL_SUB = specialList[6];
    SPECIAL_MUL = specialList[7];
    SPECIAL_DIV = specialList[8];
    SPECIAL_MOD = specialList[9];
    SPECIAL_EQ = specialList[10];
    SPECIAL_NE = specialList[11];
    SPECIAL_LT = specialList[12];
    SPECIAL_GE = specialList[13];
    SPECIAL_GT = specialList[14];
    SPECIAL_LE = specialList[15];
    SPECIAL_AND = specialList[16];
    SPECIAL_OR = specialList[17];
    SPECIAL_NOT = specialList[18];
    SPECIAL_NEG = specialList[19];
    parsed_files = list_create();
}
List* list_create(void) {
    List* self = create_struct(List);
    self->head = NULL;
    self->tail = NULL;
    return self;
}
void list_append(List* self, pointer value) {
    if (self == NULL) {
        fprintf(stderr, "[lib Fatal] at <list_append>: List is NULL\n");
        abort();
    }
    ListNode* node = create_struct(ListNode);
    node->data = value;
    node->next = NULL;
    if (self->tail == NULL) {
        self->head = node;
        self->tail = node;
    } else {
        self->tail->next = node;
        self->tail = node;
    }
}
pointer list_pop_front(List* self) {
    if (list_empty(self)) {
        return NULL;
    }
    pointer value = self->head->data;
    self->head = self->head->next;
    if (self->head == NULL) {
        self->tail = NULL;
    }
    return value;
}
bool is_special(string str) {
    for (size_t i = 0; i < specialCount; ++i) {
        if (str == specialList[i]) {
            return true;
        }
    }
    return false;
}
typedef enum OutputFlags {
    OUTPUT_NONE = 0,
    OUTPUT_RESULT = 1,        // -o
    OUTPUT_IR = 2,            // -i
    OUTPUT_AST = 4,           // -a
    OUTPUT_TOKENS = 8,        // -l
    OUTPUT_SYMBOL_TABLE = 16  // -s
} OutputFlags;
typedef struct Args {
    File* source_path;
    File* output_path;
    OutputFlags output_flags;
} Args;
static Args* parse_args(int argc, char* argv[]) {
    Args* args = create_struct(Args);
    memset(args, 0, sizeof(Args));
    for (int i = 1; i < argc; ++i) {
        if (argv[i][0] == '-') {
            if (argv[i][1] == 'o') {
                args->output_flags |= OUTPUT_RESULT;
            } else if (argv[i][1] == 'i') {
                args->output_flags |= OUTPUT_IR;
            } else if (argv[i][1] == 'a') {
                args->output_flags |= OUTPUT_AST;
            } else if (argv[i][1] == 'l') {
                args->output_flags |= OUTPUT_TOKENS;
            } else if (argv[i][1] == 's') {
                args->output_flags |= OUTPUT_SYMBOL_TABLE;
            } else if (argv[i][1] == 'h') {
                printf("Usage: %s <source_file> [output_file] [options]\n", argv[0]);
                printf("Options:\n");
                printf("  -o  Output compile result\n");
                printf("  -i  Output IR\n");
                printf("  -a  Output AST\n");
                printf("  -l  Output tokens\n");
                printf("  -s  Output symbol table\n");
                printf("  -h  Show this help message\n");
                exit(0);
            }
        } else {
            if (args->source_path == NULL) {
                args->source_path = create_file(create_string(argv[i], strlen(argv[i])));
            } else if (args->output_path == NULL) {
                args->output_path = create_file(create_string(argv[i], strlen(argv[i])));
            } else {
                fprintf(stderr, "[Error] Unexpected argument: %s\n", argv[i]);
            }
        }
    }
    if (args->source_path == NULL) {
        fprintf(stderr, "[Error] No source file provided\n");
        exit(1);
    } else if (args->output_path == NULL) {
        args->output_path = create_file(args->source_path->path);
    }
    return args;
}
int main(int argc, char* argv[]) {
    init();
    init_symbol();
    Args* args = parse_args(argc, argv);
    Lexer* lexer = NULL;
    if (args->output_flags != OUTPUT_NONE) {
        lexer = create_lexer(args->source_path);
    }
    if (args->output_flags & OUTPUT_TOKENS) {
        Lexer* copy_lexer = create_struct(Lexer);
        memcpy(copy_lexer, lexer, sizeof(Lexer));
        output_tokens(copy_lexer, args->output_path);
    }
    AST* ast = NULL;
    if (args->output_flags & OUTPUT_AST) {
        Parser* parser = create_parser(lexer);
        ast = parse_code(parser);
        ast = analyzer(ast);
        if (ast != NULL) {
            list_append(parsed_files, (pointer)ast);
            FILE* ast_file = fopen(change_extension(args->output_path, ".ast"), "w");
            if (ast_file == NULL) {
                fprintf(stderr, "[Error] Failed to open AST output file\n");
                exit(1);
            }
            print_ast(ast, ast_file);
            fprintf(ast_file, "\n%s\n", get_info());
            fclose(ast_file);
        }
    }
    if (args->output_flags & OUTPUT_IR) {
        // TODO: IR
    }
    if (args->output_flags & OUTPUT_RESULT) {
        // TODO: compile result
    }
    if (args->output_flags & OUTPUT_SYMBOL_TABLE) {
        FILE* sym_file = fopen(change_extension(args->output_path, ".sym"), "w");
        if (sym_file == NULL) {
            fprintf(stderr, "[Error] Failed to open symbol table output file\n");
            exit(1);
        }
        print_symbol_table(global_symbol_table, sym_file);
        fprintf(sym_file, "\n%s\n", get_info());
        fclose(sym_file);
    }
    return 0;
}
static void print_function(Function* function, FILE* out, size_t indent);
static void print_class(Class* class, FILE* out, size_t indent);
static void print_import(Import* import, FILE* out, size_t indent);
static void print_statement(Statement* statement, FILE* out, size_t indent);
static void print_method(Method* method, FILE* out, size_t indent);
static void print_if(If* if_, FILE* out, size_t indent);
static void print_for(For* for_, FILE* out, size_t indent);
static void print_while(While* while_, FILE* out, size_t indent);
static void print_expression(Expression* expression, FILE* out, size_t indent);
static void print_variable(Variable* variable, FILE* out, size_t indent);
static void print_primary(Primary* primary, FILE* out, size_t indent);
static void print_variable_access(VariableAccess* variable_access, FILE* out, size_t indent);
static void print_symbol(Symbol* symbol, FILE* out, size_t indent);
static string operator_string(OperatorType op);
void print_ast(AST* ast, FILE* out) {
    OUT(0, "{\n");
    foreach (CodeMember*, member, ast->members) {
        switch (member->type) {
            case CODE_FUNCTION:
                print_function(member->member.function, out, 1);
                break;
            case CODE_CLASS:
                print_class(member->member.class, out, 1);
                break;
            case CODE_IMPORT:
                print_import(member->member.import, out, 1);
                break;
            default:
                OUT(1, "error: \"Unknown code member type\"\n");
                break;
        }
    }
    OUT(0, "}\n");
}
void print_function(Function* function, FILE* out, size_t indent) {
    OUT(indent, "function: {\n");
    OUT(indent + 1, "name: {\n");
    print_symbol(function->name, out, indent + 2);
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "return_type: %s(%zu)\n", function->type->name, function->type->id);
    OUT(indent + 1, "parameters: {\n");
    foreach (Symbol*, param, function->parameters) {
        OUT(indent + 2, "{\n");
        print_symbol(param, out, indent + 3);
        OUT(indent + 2, "}\n");
    }
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "body: {\n");
    foreach (Statement*, stmt, function->body) {
        print_statement(stmt, out, indent + 2);
    }
    OUT(indent + 1, "}\n");
    OUT(indent, "}\n");
}
void print_class(Class* class, FILE* out, size_t indent) {
    OUT(indent, "class: {\n");
    OUT(indent + 1, "name: {\n");
    print_symbol(class->name, out, indent + 2);
    OUT(indent + 1, "}\n");
    foreach (ClassMember*, member, class->members) {
        if (member->type == CLASS_METHOD) {
            print_method(member->member.method, out, indent + 1);
        } else if (member->type == CLASS_ATTRIBUTE) {
            print_variable(member->member.attribute, out, indent + 1);
        } else {
            OUT(indent + 1, "error: \"Unknown class member type\"\n");
        }
    }
    OUT(indent, "}\n");
}
void print_import(Import* import, FILE* out, size_t indent) {
    OUT(indent, "import: {\n");
    OUT(indent + 1, "name: {\n");
    print_symbol(import->name, out, indent + 2);
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "path: \"%s\"\n", import->path);
    OUT(indent, "}\n");
}
void print_statement(Statement* statement, FILE* out, size_t indent) {
    switch (statement->type) {
        case STATEMENT_DECLARE:
            print_variable(statement->statement.declare, out, indent);
            break;
        case STATEMENT_DECLARE_LIST:
            fprintf(stderr, "[output Warning] at <print_statement>: Cannot exist declare list in statement. This should have been split into multiple declare statements in the parsing stage.\n");
            foreach (Variable*, var, statement->statement.declare_list) {
                print_variable(var, out, indent);
            }
            break;
        case STATEMENT_IF:
            print_if(statement->statement.if_, out, indent);
            break;
        case STATEMENT_FOR:
            print_for(statement->statement.for_, out, indent);
            break;
        case STATEMENT_WHILE:
            print_while(statement->statement.while_, out, indent);
            break;
        case STATEMENT_BREAK:
            OUT(indent, "break: null\n");
            break;
        case STATEMENT_CONTINUE:
            OUT(indent, "continue: null\n");
            break;
        case STATEMENT_RETURN:
            if (statement->statement.return_ == NULL) {
                OUT(indent, "return: null\n");
            } else {
                OUT(indent, "return: {\n");
                print_expression(statement->statement.return_, out, indent + 1);
                OUT(indent, "}\n");
            }
            break;
        case STATEMENT_EXPRESSION:
            OUT(indent, "expression: {\n");
            print_expression(statement->statement.return_, out, indent + 1);
            OUT(indent, "}\n");
            break;
        default:
            OUT(indent, "error: \"Unknown statement type\"\n");
            break;
    }
}
void print_method(Method* method, FILE* out, size_t indent) {
    OUT(indent, "method: {\n");
    OUT(indent + 1, "name: {\n");
    print_symbol(method->name, out, indent + 2);
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "return_type: %s(%zu)\n", method->type->name, method->type->id);
    OUT(indent + 1, "parameters: {\n");
    foreach (Symbol*, param, method->parameters) {
        OUT(indent + 2, "{\n");
        print_symbol(param, out, indent + 3);
        OUT(indent + 2, "}\n");
    }
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "body: {\n");
    foreach (Statement*, stmt, method->body) {
        print_statement(stmt, out, indent + 2);
    }
    OUT(indent + 1, "}\n");
    OUT(indent, "}\n");
}
void print_if(If* if_, FILE* out, size_t indent) {
    OUT(indent, "if: {\n");
    OUT(indent + 1, "condition: {\n");
    print_expression(if_->condition, out, indent + 2);
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "body: {\n");
    foreach (Statement*, stmt0, if_->body) {
        print_statement(stmt0, out, indent + 2);
    }
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "elif_list: {\n");
    foreach (If*, elif, if_->elif_list) {
        OUT(indent + 2, "{\n");
        OUT(indent + 3, "condition: {\n");
        print_expression(elif->condition, out, indent + 4);
        OUT(indent + 3, "}\n");
        OUT(indent + 3, "body: {\n");
        foreach (Statement*, stmt1, elif->body) {
            print_statement(stmt1, out, indent + 4);
        }
        OUT(indent + 3, "}\n");
        OUT(indent + 2, "}\n");
    }
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "else_body: {\n");
    foreach (Statement*, stmt2, if_->else_body) {
        print_statement(stmt2, out, indent + 2);
    }
    OUT(indent + 1, "}\n");
    OUT(indent, "}\n");
}
void print_for(For* for_, FILE* out, size_t indent) {
    OUT(indent, "for: {\n");
    if (for_->init.decl != NULL) {
        OUT(indent + 1, "init: {\n");
        print_variable(for_->init.decl, out, indent + 2);
        OUT(indent + 1, "}\n");
    } else if (for_->init.expr != NULL) {
        OUT(indent + 1, "init: {\n");
        print_expression(for_->init.expr, out, indent + 2);
        OUT(indent + 1, "}\n");
    } else {
        OUT(indent + 1, "init: null\n");
    }
    if (for_->condition != NULL) {
        OUT(indent + 1, "condition: {\n");
        print_expression(for_->condition, out, indent + 2);
        OUT(indent + 1, "}\n");
    } else
        OUT(indent + 1, "condition: null\n");
    if (for_->increment != NULL) {
        OUT(indent + 1, "increment: {\n");
        print_expression(for_->increment, out, indent + 2);
        OUT(indent + 1, "}\n");
    } else {
        OUT(indent + 1, "increment: null\n");
    }
    OUT(indent + 1, "body: {\n");
    foreach (Statement*, stmt, for_->body) {
        print_statement(stmt, out, indent + 2);
    }
    OUT(indent + 1, "}\n");
    OUT(indent, "}\n");
}
void print_while(While* while_, FILE* out, size_t indent) {
    OUT(indent, "while: {\n");
    OUT(indent + 1, "condition: {\n");
    print_expression(while_->condition, out, indent + 2);
    OUT(indent + 1, "}\n");
    OUT(indent + 1, "body: {\n");
    foreach (Statement*, stmt, while_->body) {
        print_statement(stmt, out, indent + 2);
    }
    OUT(indent + 1, "}\n");
    OUT(indent, "}\n");
}
void print_expression(Expression* expression, FILE* out, size_t indent) {
    if (expression->op == OP_NONE) {
        OUT(indent, "primary: {\n");
        print_primary(expression->left.unary, out, indent + 1);
        OUT(indent, "}\n");
    } else {
        OUT(indent, "left: {\n");
        print_expression(expression->left.binary, out, indent + 1);
        OUT(indent, "}\n");
        OUT(indent, "operator: \"%s\"\n", operator_string(expression->op));
        OUT(indent, "right: {\n");
        print_expression(expression->right, out, indent + 1);
        OUT(indent, "}\n");
    }
}
void print_variable(Variable* variable, FILE* out, size_t indent) {
    OUT(indent, "variable: {\n");
    OUT(indent + 1, "name: {\n");
    print_symbol(variable->var, out, indent + 2);
    OUT(indent + 1, "}\n");
    if (variable->initializer != NULL) {
        OUT(indent + 1, "initializer: {\n");
        print_expression(variable->initializer, out, indent + 2);
        OUT(indent + 1, "}\n");
    } else {
        OUT(indent + 1, "initializer: null\n");
    }
    OUT(indent, "}\n");
}
void print_primary(Primary* primary, FILE* out, size_t indent) {
    switch (primary->kind) {
        case PRIMARY_INT:
            OUT(indent, "int literal: %s\n", primary->value.literal);
            break;
        case PRIMARY_FLOAT:
            OUT(indent, "float literal: %s\n", primary->value.literal);
            break;
        case PRIMARY_STRING:
            OUT(indent, "string literal: \"%s\"\n", primary->value.literal);
            break;
        case PRIMARY_BOOL:
            OUT(indent, "bool literal: %s\n", primary->value.literal);
            break;
        case PRIMARY_NOT:
            OUT(indent, "not: {\n");
            print_primary(primary->value.not, out, indent + 1);
            OUT(indent, "}\n");
            break;
        case PRIMARY_NEG:
            OUT(indent, "neg: {\n");
            print_primary(primary->value.neg, out, indent + 1);
            OUT(indent, "}\n");
            break;
        case PRIMARY_EXPR:
            OUT(indent, "exp: {\n");
            print_expression(primary->value.exp, out, indent + 1);
            OUT(indent, "}\n");
            break;
        case PRIMARY_VAR_ACCESS:
            print_variable_access(primary->value.var_access, out, indent);
            break;
        default:
            OUT(indent, "error: \"Unknown primary type\"\n");
            break;
    }
}
void print_variable_access(VariableAccess* variable_access, FILE* out, size_t indent) {
    if (variable_access->base != NULL) {
        OUT(indent, "base: {\n");
        print_variable_access(variable_access->base, out, indent + 1);
        OUT(indent, "}\n");
    }
    switch (variable_access->kind) {
        case VAR_ACCESS_VAR:
            OUT(indent, "var: {\n");
            print_symbol(variable_access->access.var, out, indent + 1);
            OUT(indent, "}\n");
            break;
        case VAR_ACCESS_CALL:
            OUT(indent, "call: {\n");
            int arg_index = 0;
            foreach (Expression*, arg, variable_access->access.args) {
                OUT(indent + 1, "arg[%d]: {\n", arg_index++);
                print_expression(arg, out, indent + 2);
                OUT(indent + 1, "}\n");
            }
            OUT(indent, "}\n");
            break;
        case VAR_ACCESS_ATTRIBUTE:
            OUT(indent, "attribute: {\n");
            print_symbol(variable_access->access.attribute, out, indent + 1);
            OUT(indent, "}\n");
            break;
        case VAR_ACCESS_INDEX:
            OUT(indent, "index: {\n");
            print_expression(variable_access->access.index, out, indent + 1);
            OUT(indent, "}\n");
            break;
        default:
            OUT(indent, "error: \"Unknown variable access type\"\n");
            break;
    }
}
void print_symbol(Symbol* symbol, FILE* out, size_t indent) {
    OUT(indent, "name: \"%s(%zu)\"\n", symbol->name, symbol->id);
    switch (symbol->kind) {
        case SYMBOL_TYPE:
            OUT(indent, "kind: \"type\"\n");
            break;
        case SYMBOL_VARIABLE:
            OUT(indent, "kind: \"variable\"\n");
            break;
        case SYMBOL_FUNCTION:
            OUT(indent, "kind: \"function\"\n");
            break;
        case SYMBOL_CLASS:
            OUT(indent, "kind: \"class\"\n");
            break;
        case SYMBOL_METHOD:
            OUT(indent, "kind: \"method\"\n");
            break;
        case SYMBOL_ATTRIBUTE:
            OUT(indent, "kind: \"attribute\"\n");
            break;
        case SYMBOL_PARAMETER:
            OUT(indent, "kind: \"parameter\"\n");
            break;
        default:
            OUT(indent, "kind: \"unknown\"\n");
            break;
    }
    if (symbol->type != NULL) {
        OUT(indent, "type: \"%s(%zu)\"\n", symbol->type->name, symbol->type->id);
    } else {
        OUT(indent, "type: null\n");
    }
    if (symbol->kind == SYMBOL_VARIABLE || symbol->kind == SYMBOL_PARAMETER || symbol->kind == SYMBOL_ATTRIBUTE) {
        OUT(indent, "offset: %zu\n", symbol->info.offset);
    } else {
        OUT(indent, "offset: null\n");
    }
}
string operator_string(OperatorType op) {
    switch (op) {
        case OP_ADD:
            return "+";
        case OP_SUB:
            return "-";
        case OP_MUL:
            return "*";
        case OP_DIV:
            return "/";
        case OP_MOD:
            return "%";
        case OP_ASSIGN:
            return "=";
        case OP_EQ:
            return "==";
        case OP_NE:
            return "!=";
        case OP_LT:
            return "<";
        case OP_GT:
            return ">";
        case OP_LE:
            return "<=";
        case OP_GE:
            return ">=";
        case OP_ADD_ASSIGN:
            return "+=";
        case OP_SUB_ASSIGN:
            return "-=";
        case OP_MUL_ASSIGN:
            return "*=";
        case OP_DIV_ASSIGN:
            return "/=";
        case OP_MOD_ASSIGN:
            return "%=";
        case OP_AND:
            return "&&";
        case OP_OR:
            return "||";
        case OP_NEG:
            return "-";
        case OP_NOT:
            return "!";
        case OP_NONE:
            return "(none)";
        default:
            return "(unknown operator)";
    }
}
static void print_symbol_table_recursive(SymbolTable* table, FILE* out, size_t indent) {
    switch (table->type) {
        case SYMBOL_TABLE_GLOBAL:
            OUT(indent, "SymbolTable (type: global): {\n");
            break;
        case SYMBOL_TABLE_FUNCTION:
            OUT(indent, "SymbolTable (type: function): {\n");
            break;
        case SYMBOL_TABLE_CLASS:
            OUT(indent, "SymbolTable (type: class): {\n");
            break;
        case SYMBOL_TABLE_METHOD:
            OUT(indent, "SymbolTable (type: method): {\n");
            break;
        case SYMBOL_TABLE_BLOCK:
            OUT(indent, "SymbolTable (type: block): {\n");
            break;
        default:
            OUT(indent, "SymbolTable (type: unknown): {\n");
            break;
    }
    if (!list_empty(table->symbols)) {
        OUT(indent + 1, "symbols:\n");
        foreach (Symbol*, symbol, table->symbols) {
            OUT(indent + 1, "{\n");
            print_symbol(symbol, out, indent + 2);
            OUT(indent + 1, "}\n");
        }
    }
    if (!list_empty(table->children)) {
        OUT(indent + 1, "sub-tables:\n");
        foreach (SymbolTable*, child, table->children) {
            print_symbol_table_recursive(child, out, indent + 1);
        }
    }
    OUT(indent, "}\n");
}
void print_symbol_table(SymbolTable* table, FILE* out) {
    print_symbol_table_recursive(table, out, 0);
}
#define parser_error(message, token)                                                                                                  \
    fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, message); \
    output_one_token(token, stderr, false)
Parser* create_parser(Lexer* lexer) {
    lexer->skip_comment = true;
    Parser* parser = create_struct(Parser);
    parser->lexer = lexer;
    parser->import_files = list_create();
    parser->file = lexer->source_path;
    return parser;
}
static CodeMember* create_code_member(CodeMemberType type, pointer member);
static Import* parse_import(Parser* parser, SymbolTable* table, AST* ast);
static Class* parse_class(Parser* parser, SymbolTable* table);
static Function* parse_function(Parser* parser, SymbolTable* table);
AST* parse_code(Parser* parser) {
    AST* ast = create_struct(AST);
    ast->members = list_create();
    ast->file = parser->file;
    Token* token = get_next_token(parser->lexer);
    ast->table = create_symbol_table(SYMBOL_TABLE_GLOBAL, global_symbol_table);
    while (token != NULL && token->type != TOKEN_EOF) {
        if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_IMPORT) {
            list_append(ast->members, (pointer)create_code_member(CODE_IMPORT, (pointer)parse_import(parser, ast->table, ast)));
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_CLASS) {
            list_append(ast->members, (pointer)create_code_member(CODE_CLASS, (pointer)parse_class(parser, ast->table)));
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_FUNC) {
            list_append(ast->members, (pointer)create_code_member(CODE_FUNCTION, (pointer)parse_function(parser, ast->table)));
        } else {
            parser_error("Unexpected token", token);
        }
        token = get_next_token(parser->lexer);
    }
    return ast;
}
CodeMember* create_code_member(CodeMemberType type, pointer member) {
    CodeMember* code_member = create_struct(CodeMember);
    code_member->type = type;
    switch (type) {
        case CODE_FUNCTION:
            code_member->member.function = (Function*)member;
            break;
        case CODE_CLASS:
            code_member->member.class = (Class*)member;
            break;
        case CODE_IMPORT:
            code_member->member.import = (Import*)member;
            break;
        default:
            code_member->member.class = NULL;
            break;
    }
    return code_member;
}
static Symbol* from_file_import(string name, string path) {
    File* file = create_file(path);
    AST* ast = NULL;
    foreach (AST*, item, parsed_files) {
        if (item != NULL && strcmp(file_full_path(item->file), file_full_path(file)) == 0) {
            ast = item;
            break;
        }
    }
    if (ast == NULL) {
        ast = parse_code(create_parser(create_lexer(file)));
        list_append(parsed_files, (pointer)ast);
    }
    return search_symbol(ast->table, name, false, 0, NULL);
}
Import* parse_import(Parser* parser, SymbolTable* table, AST* ast) {
    Import* import = create_struct(Import);
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER) {
        parser_error("Expected identifier after 'import'", token);
        return NULL;
    }
    string name = token->lexeme;
    token = get_next_token(parser->lexer);
    if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_SEMICOLON) {
        import->path = file_full_path(create_file(string_splice("%s/%s.tc", std_path, name)));
    } else {
        if (token->type != TOKEN_KEYWORD || token->lexeme != KEYWORD_FROM) {
            parser_error("Expected 'from' after import name", token);
            return NULL;
        }
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_STRING) {
            parser_error("Expected string literal after 'from'", token);
            return NULL;
        }
        import->path = file_full_path(create_file(string_splice("%s/%s", file_dir_path(parser->file), token->lexeme)));
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
            parser_error("Expected ';' after import path", token);
            return NULL;
        }
    }
    import->name = from_file_import(name, import->path);
    if (import->name == NULL) {
        parser_error("Failed to import module", token);
        import->name = create_symbol(name, NULL, SYMBOL_VARIABLE, NULL, table);
    } else {
        list_append(table->symbols, (pointer)import->name);
        if (import->name->kind == SYMBOL_CLASS) {
            list_append(ast->members, (pointer)create_code_member(CODE_CLASS, (pointer)import->name->info.class));
        } else if (import->name->kind == SYMBOL_FUNCTION) {
            list_append(ast->members, (pointer)create_code_member(CODE_FUNCTION, (pointer)import->name->info.function));
        }
    }
    return import;
}
static Method* parse_method(Parser* parser, SymbolTable* table);
static list(Variable*) parse_variable(Parser* parser, SymbolTable* table, SymbolType kind);
static ClassMember* create_class_member(ClassMemberType type, pointer member);
Class* parse_class(Parser* parser, SymbolTable* table) {
    Class* class = create_struct(Class);
    parser->current_class = class;
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER) {
        parser_error("Expected identifier after 'class'", token);
        parser->current_class = NULL;
        return NULL;
    }
    class->name = create_symbol(token->lexeme, NULL, SYMBOL_CLASS, (pointer)class, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        parser_error("Expected '{' after class name", token);
        parser->current_class = NULL;
        return NULL;
    }
    SymbolTable* class_table = create_symbol_table(SYMBOL_TABLE_CLASS, table);
    class->table = class_table;
    class->members = list_create();
    while (true) {
        token = get_next_token(parser->lexer);
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_R_BRACE) {
            break;
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_METHOD) {
            list_append(class->members, (pointer)create_class_member(CLASS_METHOD, (pointer)parse_method(parser, class_table)));
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_VAR) {
            list(Variable*) vars = parse_variable(parser, class_table, SYMBOL_ATTRIBUTE);
            while (!list_empty(vars)) {
                list_append(class->members, (pointer)create_class_member(CLASS_ATTRIBUTE, list_pop_front(vars)));
            }
        } else {
            parser_error("Unexpected token in class body", token);
        }
    }
    parser->current_class = NULL;
    return class;
}
ClassMember* create_class_member(ClassMemberType type, pointer member) {
    ClassMember* class_member = create_struct(ClassMember);
    class_member->type = type;
    switch (type) {
        case CLASS_METHOD:
            class_member->member.method = (Method*)member;
            break;
        case CLASS_ATTRIBUTE:
            class_member->member.attribute = (Variable*)member;
            break;
        default:
            class_member->member.method = NULL;
            break;
    }
    return class_member;
}
#define is_builtin_type(token) (token->type == TOKEN_KEYWORD && (token->lexeme == KEYWORD_INT || token->lexeme == KEYWORD_FLOAT || token->lexeme == KEYWORD_STRING || token->lexeme == KEYWORD_BOOL || token->lexeme == KEYWORD_VOID || token->lexeme == KEYWORD_POINTER || token->lexeme == KEYWORD_CONST))
static Symbol* parse_type(Parser* parser, SymbolTable* table);
static Statement* parse_statement(Parser* parser, SymbolTable* table);
static bool parse_body(Parser* parser, SymbolTable* table, list(Statement*) body);
Function* parse_function(Parser* parser, SymbolTable* table) {
    Function* function = create_struct(Function);
    function->body = list_create();
    function->parameters = list_create();
    parser->current_function = function;
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
        parser_error("Expected identifier or type after 'func'", token);
        parser->current_function = NULL;
        return NULL;
    }
    function->type = parse_type(parser, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER) {
        parser_error("Expected identifier after function return type", token);
        parser->current_function = NULL;
        return NULL;
    }
    function->name = create_symbol(token->lexeme, function->type, SYMBOL_FUNCTION, (pointer)function, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        parser_error("Expected '(' after function name", token);
        parser->current_function = NULL;
        return NULL;
    }
    token = get_next_token(parser->lexer);
    SymbolTable* function_table = create_symbol_table(SYMBOL_TABLE_FUNCTION, table);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
            parser_error("Unexpected token in parameter list", token);
            parser->current_function = NULL;
            return NULL;
        }
        Symbol* param_type = parse_type(parser, table);
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_IDENTIFIER) {
            parser_error("Expected identifier in parameter list", token);
            parser->current_function = NULL;
            return NULL;
        }
        list_append(function->parameters, (pointer)create_symbol(token->lexeme, param_type, SYMBOL_PARAMETER, NULL, function_table));
        token = get_next_token(parser->lexer);
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_COMMA) {
            token = get_next_token(parser->lexer);
        } else if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
            parser_error("Expected ',' or ')' in parameter list", token);
            parser->current_function = NULL;
            return NULL;
        }
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        parser_error("Expected '{' to start function body", token);
        parser->current_function = NULL;
        return NULL;
    }
    SymbolTable* block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, function_table);
    bool result = parse_body(parser, block_table, function->body);
    parser->current_function = NULL;
    if (!result) return NULL;
    return function;
}
Method* parse_method(Parser* parser, SymbolTable* table) {
    Method* method = create_struct(Method);
    method->body = list_create();
    method->parameters = list_create();
    parser->current_method = method;
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
        parser_error("Expected identifier or type after 'method'", token);
        parser->current_method = NULL;
        return NULL;
    }
    method->type = parse_type(parser, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && token->type != TOKEN_SPECIAL) {
        parser_error("Expected identifier after method return type", token);
        parser->current_method = NULL;
        return NULL;
    }
    method->name = create_symbol(token->lexeme, method->type, SYMBOL_METHOD, (pointer)method, table);
    if (token->type == TOKEN_SPECIAL) {
        if (!is_special(token->lexeme)) {
            parser_error("Invalid special method", token);
            parser->current_method = NULL;
            return NULL;
        }
        method->special = true;
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        parser_error("Expected '(' after method name", token);
        parser->current_method = NULL;
        return NULL;
    }
    token = get_next_token(parser->lexer);
    SymbolTable* method_table = create_symbol_table(SYMBOL_TABLE_METHOD, table);
    if (token->type != TOKEN_KEYWORD || token->lexeme != KEYWORD_SELF) {
        parser_error("Expected 'self' as the first parameter", token);
        parser->current_method = NULL;
        return NULL;
    }
    list_append(method->parameters, (pointer)create_symbol(KEYWORD_SELF, parser->current_class->name, SYMBOL_PARAMETER, NULL, method_table));
    token = get_next_token(parser->lexer);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_COMMA) {
            token = get_next_token(parser->lexer);
        } else if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
            parser_error("Expected ',' or ')' in parameter list", token);
            parser->current_method = NULL;
            return NULL;
        }
        if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
            parser_error("Unexpected token in parameter list", token);
            parser->current_method = NULL;
            return NULL;
        }
        Symbol* param_type = parse_type(parser, table);
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_IDENTIFIER) {
            parser_error("Expected identifier in parameter list", token);
            parser->current_method = NULL;
            return NULL;
        }
        list_append(method->parameters, (pointer)create_symbol(token->lexeme, param_type, SYMBOL_PARAMETER, NULL, method_table));
        token = get_next_token(parser->lexer);
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        parser_error("Expected '{' to start method body", token);
        parser->current_method = NULL;
        return NULL;
    }
    SymbolTable* block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, method_table);
    bool result = parse_body(parser, block_table, method->body);
    parser->current_method = NULL;
    if (!result) return NULL;
    return method;
}
static Expression* parse_expression_prec(Parser* parser, int min_precedence, SymbolTable* table);
#define parse_expression(parser, table) parse_expression_prec(parser, 1, table)
list(Variable*) parse_variable(Parser* parser, SymbolTable* table, SymbolType kind) {
    assert(kind == SYMBOL_VARIABLE || kind == SYMBOL_ATTRIBUTE);
    list(Variable*) vars = list_create();
    Token* token = get_current_token(parser->lexer);
    if (token->type != TOKEN_KEYWORD || token->lexeme != KEYWORD_VAR) {
        parser_error("Expected 'var' at the beginning of variable declaration", token);
        return vars;
    }
    get_next_token(parser->lexer);  // consume 'var'
    Symbol* type = parse_type(parser, table);
    while ((token = get_next_token(parser->lexer))->type == TOKEN_IDENTIFIER) {
        Variable* var = create_struct(Variable);
        var->var = create_symbol(token->lexeme, type, kind, NULL, table);
        token = get_next_token(parser->lexer);
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_ASSIGN) {
            get_next_token(parser->lexer);  // consume '='
            var->initializer = parse_expression(parser, table);
            list_append(vars, (pointer)var);
            token = get_next_token(parser->lexer);
        }
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_COMMA) {
            continue;
        } else if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_SEMICOLON) {
            break;
        } else {
            parser_error("Expected ',' or ';' after variable declaration", token);
            break;
        }
    }
    return vars;
}
Symbol* parse_type(Parser* parser, SymbolTable* table) {
    Symbol* type;
    Token* token = get_current_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
        parser_error("Expected type", token);
        return NULL;
    }
    if (token->type == TOKEN_KEYWORD) {
        if (token->lexeme == KEYWORD_INT) {
            type = symbol_int;
        } else if (token->lexeme == KEYWORD_FLOAT) {
            type = symbol_float;
        } else if (token->lexeme == KEYWORD_STRING) {
            type = symbol_string;
        } else if (token->lexeme == KEYWORD_BOOL) {
            type = symbol_bool;
        } else if (token->lexeme == KEYWORD_VOID) {
            type = symbol_void;
        } else if (token->lexeme == KEYWORD_POINTER) {
            type = symbol_pointer;
        } else if (token->lexeme == KEYWORD_CONST) {
            type = symbol_const;
        } else {
            parser_error("Unknown built-in type", token);
            return NULL;
        }
    } else if (token->type == TOKEN_IDENTIFIER) {
        type = search_symbol(table, token->lexeme, true, SYMBOL_CLASS, NULL);
    } else {
        parser_error("Unexpected token when parsing type", token);
        return NULL;
    }
    token = peek_next_token(parser->lexer);
    if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_LT) {
        get_next_token(parser->lexer);  // consume '<'
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_IDENTIFIER && !is_builtin_type(token)) {
            parser_error("Expected type in container type", token);
            return NULL;
        }
        Symbol* element_type = parse_type(parser, table);
        if (element_type == NULL) {
            return NULL;
        }
        type->type = element_type;
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_GT) {
            parser_error("Expected '>' after container type", token);
            return NULL;
        }
    }
    return type;
}
static If* parse_if(Parser* parser, SymbolTable* table);
static For* parse_for(Parser* parser, SymbolTable* table);
static While* parse_while(Parser* parser, SymbolTable* table);
Statement* parse_statement(Parser* parser, SymbolTable* table) {
    Statement* stmt = create_struct(Statement);
    Token* token = get_current_token(parser->lexer);
    bool check_semicolon = true;
    if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_IF) {
        stmt->type = STATEMENT_IF;
        stmt->statement.if_ = parse_if(parser, table);
        check_semicolon = false;
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_FOR) {
        stmt->type = STATEMENT_FOR;
        stmt->statement.for_ = parse_for(parser, table);
        check_semicolon = false;
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_WHILE) {
        stmt->type = STATEMENT_WHILE;
        stmt->statement.while_ = parse_while(parser, table);
        check_semicolon = false;
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_RETURN) {
        stmt->type = STATEMENT_RETURN;
        token = get_next_token(parser->lexer);  // consume 'return'
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_SEMICOLON) {
            stmt->statement.return_ = NULL;
            check_semicolon = false;
        } else {
            stmt->statement.return_ = parse_expression(parser, table);
        }
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_BREAK) {
        stmt->type = STATEMENT_BREAK;
        stmt->statement.break_ = NULL;
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_CONTINUE) {
        stmt->type = STATEMENT_CONTINUE;
        stmt->statement.continue_ = NULL;
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_VAR) {
        stmt->type = STATEMENT_DECLARE_LIST;
        stmt->statement.declare_list = parse_variable(parser, table, SYMBOL_VARIABLE);
        check_semicolon = false;
    } else {
        stmt->type = STATEMENT_EXPRESSION;
        stmt->statement.expression = parse_expression(parser, table);
    }
    if (check_semicolon) {
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
            parser_error("Expected ';' after statement", token);
            return NULL;
        }
    }
    return stmt;
}
If* parse_if(Parser* parser, SymbolTable* table) {
    If* if_ = create_struct(If);
    if_->body = list_create();
    if_->elif_list = list_create();
    if_->else_body = list_create();
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        parser_error("Expected '(' after 'if'", token);
        return NULL;
    }
    get_next_token(parser->lexer);  // consume '('
    if_->condition = parse_expression(parser, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        parser_error("Expected ')' after if condition", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        parser_error("Expected '{' to start if body", token);
        return NULL;
    }
    SymbolTable* block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, table);
    bool result = parse_body(parser, block_table, if_->body);
    if (!result) return NULL;
    token = peek_next_token(parser->lexer);
    while (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_ELIF) {
        If* elif = create_struct(If);
        elif->body = list_create();
        elif->elif_list = NULL;
        elif->else_body = NULL;
        get_next_token(parser->lexer);  // consume 'elif'
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
            parser_error("Expected '(' after 'elif'", token);
            return NULL;
        }
        elif->condition = parse_expression(parser, table);
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
            parser_error("Expected ')' after elif condition", token);
            return NULL;
        }
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
            parser_error("Expected '{' to start elif body", token);
            return NULL;
        }
        SymbolTable* elif_block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, table);
        result = parse_body(parser, elif_block_table, elif->body);
        if (!result) return NULL;
        list_append(if_->elif_list, (pointer)elif);
        token = peek_next_token(parser->lexer);
    }
    if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_ELSE) {
        get_next_token(parser->lexer);  // consume 'else'
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
            parser_error("Expected '{' to start else body", token);
            return NULL;
        }
        SymbolTable* else_block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, table);
        result = parse_body(parser, else_block_table, if_->else_body);
        if (!result) return NULL;
    }
    return if_;
}
For* parse_for(Parser* parser, SymbolTable* table) {
    For* for_ = create_struct(For);
    for_->init.decl = NULL;
    for_->body = list_create();
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        parser_error("Expected '(' after 'for'", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    SymbolTable* for_table = create_symbol_table(SYMBOL_TABLE_BLOCK, table);
    if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_VAR) {
        list(Variable*) vars = parse_variable(parser, for_table, SYMBOL_VARIABLE);
        if (vars == NULL || vars->head == NULL || vars->head != vars->tail) {
            parser_error("Expected exactly one variable declaration in for loop initializer", token);
            return NULL;
        }
        for_->init.decl = (Variable*)vars->head->data;
        for_->is_decl = true;
        token = get_next_token(parser->lexer);
    } else if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
        for_->init.expr = parse_expression(parser, for_table);
        if (for_->init.expr == NULL) {
            parser_error("Expected expression in for loop initializer", token);
            return NULL;
        }
        for_->is_decl = false;
        token = get_next_token(parser->lexer);
    }
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
        for_->condition = parse_expression(parser, for_table);
        if (for_->condition == NULL) {
            parser_error("Expected expression in for loop condition", token);
            return NULL;
        }
        token = get_next_token(parser->lexer);
    }
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
        parser_error("Expected ';' after for loop condition", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        for_->increment = parse_expression(parser, for_table);
        if (for_->increment == NULL) {
            parser_error("Expected expression in for loop increment", token);
            return NULL;
        }
        token = get_next_token(parser->lexer);
    }
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        parser_error("Expected ')' after for loop increment", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        parser_error("Expected '{' to start for loop body", token);
        return NULL;
    }
    SymbolTable* block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, for_table);
    bool result = parse_body(parser, block_table, for_->body);
    if (!result) return NULL;
    return for_;
}
While* parse_while(Parser* parser, SymbolTable* table) {
    While* while_ = create_struct(While);
    while_->body = list_create();
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        parser_error("Expected '(' after 'while'", token);
        return NULL;
    }
    get_next_token(parser->lexer);
    while_->condition = parse_expression(parser, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        parser_error("Expected ')' after while condition", token);
        return NULL;
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        parser_error("Expected '{' to start while body", token);
        return NULL;
    }
    SymbolTable* block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, table);
    bool result = parse_body(parser, block_table, while_->body);
    if (!result) return NULL;
    return while_;
}
static Primary* parse_primary(Parser* parser, SymbolTable* table);
static int operator_precedence(OperatorType op) {
    switch (op) {
        case OP_ASSIGN:      // =
        case OP_ADD_ASSIGN:  // +=
        case OP_SUB_ASSIGN:  // -=
        case OP_MUL_ASSIGN:  // *=
        case OP_DIV_ASSIGN:  // /=
        case OP_MOD_ASSIGN:  // %=
            return 1;
        case OP_AND:  // &&
        case OP_OR:   // ||
            return 2;
        case OP_EQ:  // ==
        case OP_NE:  // !=
        case OP_LT:  // <
        case OP_GT:  // >
        case OP_LE:  // <=
        case OP_GE:  // >=
            return 3;
        case OP_ADD:  // +
        case OP_SUB:  // -
            return 4;
        case OP_MUL:  // *
        case OP_DIV:  // /
        case OP_MOD:  // %
            return 5;
        case OP_NOT:  // !
        case OP_NEG:  // -
        case OP_NONE:
        default:
            return 0;
    }
}
static OperatorType operator(string lexeme) {
    if (lexeme == SYMBOL_ADD)
        return OP_ADD;
    else if (lexeme == SYMBOL_SUB)
        return OP_SUB;
    else if (lexeme == SYMBOL_MUL)
        return OP_MUL;
    else if (lexeme == SYMBOL_DIV)
        return OP_DIV;
    else if (lexeme == SYMBOL_MOD)
        return OP_MOD;
    else if (lexeme == SYMBOL_ASSIGN)
        return OP_ASSIGN;
    else if (lexeme == SYMBOL_EQ)
        return OP_EQ;
    else if (lexeme == SYMBOL_NE)
        return OP_NE;
    else if (lexeme == SYMBOL_LT)
        return OP_LT;
    else if (lexeme == SYMBOL_GT)
        return OP_GT;
    else if (lexeme == SYMBOL_LE)
        return OP_LE;
    else if (lexeme == SYMBOL_GE)
        return OP_GE;
    else if (lexeme == SYMBOL_ADD_ASSIGN)
        return OP_ADD_ASSIGN;
    else if (lexeme == SYMBOL_SUB_ASSIGN)
        return OP_SUB_ASSIGN;
    else if (lexeme == SYMBOL_MUL_ASSIGN)
        return OP_MUL_ASSIGN;
    else if (lexeme == SYMBOL_DIV_ASSIGN)
        return OP_DIV_ASSIGN;
    else if (lexeme == SYMBOL_MOD_ASSIGN)
        return OP_MOD_ASSIGN;
    else if (lexeme == SYMBOL_AND)
        return OP_AND;
    else if (lexeme == SYMBOL_OR)
        return OP_OR;
    else
        return OP_NONE;
}
#define is_right_associative(op) (op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN)
Expression* parse_expression_prec(Parser* parser, int minp, SymbolTable* table) {
    // parse first operand
    Expression* left = create_struct(Expression);
    left->type = NULL;
    left->left.unary = parse_primary(parser, table);
    if (left->left.unary == NULL) {
        parser_error("Expected expression", get_current_token(parser->lexer));
        return NULL;
    }
    left->right = NULL;
    left->op = OP_NONE;
    // check if the operator exists and its precedence
    OperatorType op = OP_NONE;
    int p = 0;
    Token* token = peek_next_token(parser->lexer);
    while (token->type == TOKEN_SYMBOL && (op = operator(token->lexeme)) != OP_NONE && (p = operator_precedence(op)) >= minp) {
        get_next_token(parser->lexer);  // consume operator
        token = get_next_token(parser->lexer);
        // parse scond operand
        Expression* expr = create_struct(Expression);
        expr->type = NULL;
        expr->right = parse_expression_prec(parser, p + (is_right_associative(op) ? 0 : 1), table);
        if (expr->right == NULL) {
            parser_error("Expected expression after operator", token);
            return NULL;
        }
        // create new expression node
        expr->left.binary = left;
        expr->op = op;
        left = expr;
        token = peek_next_token(parser->lexer);
    }
    return left;
}
static VariableAccess* parse_variable_access(Parser* parser, SymbolTable* table);
Primary* parse_primary(Parser* parser, SymbolTable* table) {
    Primary* primary = create_struct(Primary);
    primary->type = NULL;
    Token* token = get_current_token(parser->lexer);
    if (token->type == TOKEN_INTEGER) {
        primary->value.literal = token->lexeme;
        primary->kind = PRIMARY_INT;
    } else if (token->type == TOKEN_FLOAT) {
        primary->value.literal = token->lexeme;
        primary->kind = PRIMARY_FLOAT;
    } else if (token->type == TOKEN_STRING) {
        primary->value.literal = token->lexeme;
        primary->kind = PRIMARY_STRING;
    } else if (token->type == TOKEN_KEYWORD && (token->lexeme == KEYWORD_TRUE || token->lexeme == KEYWORD_FALSE)) {
        primary->value.literal = token->lexeme;
        primary->kind = PRIMARY_BOOL;
    } else if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_NOT) {
        get_next_token(parser->lexer);  // consume '!'
        primary->value.not = parse_primary(parser, table);
        if (primary->value.not == NULL) {
            parser_error("Expected expression after '!'", token);
            return NULL;
        }
        primary->kind = PRIMARY_NOT;
    } else if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_SUB) {
        get_next_token(parser->lexer);  // consume '-'
        primary->value.neg = parse_primary(parser, table);
        if (primary->value.neg == NULL) {
            parser_error("Expected expression after '-'", token);
            return NULL;
        }
        primary->kind = PRIMARY_NEG;
    } else if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_L_PAREN) {
        get_next_token(parser->lexer);  // consume '('
        primary->value.exp = parse_expression(parser, table);
        if (primary->value.exp == NULL) {
            parser_error("Expected expression after '('", token);
            return NULL;
        }
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
            parser_error("Expected ')' after expression", token);
            return NULL;
        }
    } else if (token->type == TOKEN_IDENTIFIER || (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_SELF)) {
        primary->value.var_access = parse_variable_access(parser, table);
        if (primary->value.var_access == NULL) {
            parser_error("Expected variable access", token);
            return NULL;
        }
        primary->kind = PRIMARY_VAR_ACCESS;
    } else {
        parser_error("Unexpected token in expression", token);
        return NULL;
    }
    return primary;
}
VariableAccess* parse_variable_access(Parser* parser, SymbolTable* table) {
    VariableAccess* var = create_struct(VariableAccess);
    var->type = NULL;
    var->base = NULL;
    Token* token = get_current_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && !(token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_SELF)) {
        parser_error("Expected identifier or 'self' in variable access", token);
        return NULL;
    }
    var->access.var = search_symbol(table, token->lexeme, false, 0, NULL);
    if (var->access.var == NULL) {
        parser_error("Undefined variable", token);
        return NULL;
    }
    var->kind = VAR_ACCESS_VAR;
    token = peek_next_token(parser->lexer);
    while (token->type == TOKEN_SYMBOL && (token->lexeme == SYMBOL_DOT || token->lexeme == SYMBOL_L_BRACKET || token->lexeme == SYMBOL_L_PAREN)) {
        VariableAccess* access = create_struct(VariableAccess);
        access->type = NULL;
        access->base = var;
        if (token->lexeme == SYMBOL_DOT) {
            access->kind = VAR_ACCESS_ATTRIBUTE;
            get_next_token(parser->lexer);  // consume '.'
            token = get_next_token(parser->lexer);
            if (token->type != TOKEN_IDENTIFIER) {
                parser_error("Expected identifier after '.'", token);
                return NULL;
            }
            Symbol* type = access->base->access.var->type;
            if (type == NULL || type->kind != SYMBOL_CLASS) {
                parser_error("Cannot access attribute of non-class type", token);
                return NULL;
            }
            access->access.attribute = search_symbol(type->info.class->table, token->lexeme, false, 0, NULL);
            if (access->access.attribute == NULL) {
                parser_error("Undefined attribute", token);
                return NULL;
            }
        } else if (token->lexeme == SYMBOL_L_BRACKET) {
            access->kind = VAR_ACCESS_INDEX;
            get_next_token(parser->lexer);  // consume '['
            get_next_token(parser->lexer);
            access->access.index = parse_expression(parser, table);
            if (access->access.index == NULL) {
                parser_error("Expected expression in index access", token);
                return NULL;
            }
            token = get_next_token(parser->lexer);
            if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_BRACKET) {
                parser_error("Expected ']' after index expression", token);
                return NULL;
            }
        } else if (token->lexeme == SYMBOL_L_PAREN) {
            access->kind = VAR_ACCESS_CALL;
            access->access.args = list_create();
            get_next_token(parser->lexer);  // consume '('
            token = get_next_token(parser->lexer);
            while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
                Expression* arg = parse_expression(parser, table);
                if (arg == NULL) {
                    parser_error("Expected expression in function call", token);
                    return NULL;
                }
                list_append(access->access.args, (pointer)arg);
                token = get_next_token(parser->lexer);
                if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_COMMA) {
                    token = get_next_token(parser->lexer);
                } else if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
                    parser_error("Expected ',' or ')' in function call", token);
                    return NULL;
                }
            }
        }
        var = access;
        token = peek_next_token(parser->lexer);
    }
    return var;
}
bool parse_body(Parser* parser, SymbolTable* table, list(Statement*) body) {
    Token* token = get_next_token(parser->lexer);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_BRACE) {
        Statement* stmt = parse_statement(parser, table);
        if (stmt == NULL) {
            parser_error("Unexpected token in body", token);
            return false;
        }
        if (stmt->type == STATEMENT_DECLARE_LIST) {
            list(Variable*) vars = stmt->statement.declare_list;
            while (!list_empty(vars)) {
                Variable* var = (Variable*)list_pop_front(vars);
                Statement* decl_stmt = create_struct(Statement);
                decl_stmt->type = STATEMENT_DECLARE;
                decl_stmt->statement.declare = var;
                list_append(body, (pointer)decl_stmt);
            }
        } else {
            list_append(body, (pointer)stmt);
        }
        token = get_next_token(parser->lexer);
    }
    return true;
}
Symbol* create_symbol(string name, Symbol* type, SymbolType kind, pointer info, SymbolTable* table) {
    static size_t symbol_count = 0;
    Symbol* symbol = search_symbol(table, name, true, kind, type);
    if (symbol != NULL) {
        if (symbol->kind == kind && symbol->type == type) {
            return symbol;
        } else if (symbol->table == table) {
            fprintf(stderr, "[symbol_table Error] at <create_symbol> Symbol '%s' already exists in the current scope\n", name);
            return NULL;
        } else {
            fprintf(stderr, "[symbol_table Warning] at <create_symbol> Symbol '%s' already exists in an outer scope, but with a different type or kind. Creating a new symbol in the current scope.\n", name);
        }
    }
    symbol = create_struct(Symbol);
    symbol->name = name;
    symbol->type = type;
    symbol->kind = kind;
    symbol->id = symbol_count++;
    switch (kind) {
        case SYMBOL_FUNCTION:
            symbol->info.function = (Function*)info;
            break;
        case SYMBOL_METHOD:
            symbol->info.method = (Method*)info;
            break;
        case SYMBOL_CLASS:
            symbol->info.class = (Class*)info;
            break;
        case SYMBOL_VARIABLE:
        case SYMBOL_ATTRIBUTE:
        case SYMBOL_PARAMETER:
            symbol->info.offset = (size_t)info;
            break;
        case SYMBOL_TYPE:
            symbol->info.size = (size_t)info;
            break;
        default:
            fprintf(stderr, "[symbol_table Warning] at <create_symbol> Unknown symbol kind '%u' for symbol '%s'\n", kind, name);
            break;
    }
    symbol->table = table;
    if (table != NULL)
        list_append(table->symbols, (pointer)symbol);
    return symbol;
}
SymbolTable* create_symbol_table(SymbolTableType type, SymbolTable* parent) {
    SymbolTable* table = create_struct(SymbolTable);
    table->parent = parent;
    table->type = type;
    table->symbols = list_create();
    table->children = list_create();
    if (parent != NULL)
        list_append(parent->children, (pointer)table);
    return table;
}
void init_symbol(void) {
    global_symbol_table = create_symbol_table(SYMBOL_TABLE_GLOBAL, NULL);
    symbol_int = create_symbol(KEYWORD_INT, NULL, SYMBOL_TYPE, (pointer)pointer_size, global_symbol_table);
    symbol_float = create_symbol(KEYWORD_FLOAT, NULL, SYMBOL_TYPE, (pointer)pointer_size, global_symbol_table);
    symbol_string = create_symbol(KEYWORD_STRING, NULL, SYMBOL_TYPE, (pointer)pointer_size, global_symbol_table);
    symbol_bool = create_symbol(KEYWORD_BOOL, NULL, SYMBOL_TYPE, (pointer)1, global_symbol_table);
    symbol_void = create_symbol(KEYWORD_VOID, NULL, SYMBOL_TYPE, (pointer)1, global_symbol_table);
    symbol_pointer = create_symbol(KEYWORD_POINTER, NULL, SYMBOL_TYPE, (pointer)pointer_size, global_symbol_table);
    symbol_const = create_symbol(KEYWORD_CONST, NULL, SYMBOL_TYPE, (pointer)pointer_size, global_symbol_table);
}
Symbol* search_symbol(SymbolTable* table, string name, bool compare_kind, SymbolType compare_kind_value, Symbol* compare_type) {
    for (int stage = 0; stage < 3; stage++) {
        for (SymbolTable* current = table; current != NULL; current = current->parent) {
            for (ListNode* node = current->symbols->head; node != NULL; node = node->next) {
                Symbol* symbol = (Symbol*)node->data;
                if (symbol->name != name) continue;
                bool match = false;
                switch (stage) {
                    case 0:
                        match = (!compare_kind || symbol->kind == compare_kind_value) && (compare_type == NULL || symbol->type == compare_type);
                        break;
                    case 1:
                        match = (compare_type == NULL || symbol->type == compare_type);
                        break;
                    case 2:
                        match = true;
                        break;
                    default:
                        break;
                }
                if (match) return symbol;
            }
        }
        if (stage == 0 && !compare_kind && compare_type == NULL)
            break;
        if (stage == 1 && compare_type == NULL)
            break;
    }
    return NULL;
}
