typedef struct FILE FILE;
extern FILE* stderr;
int fprintf(FILE* stream, const char* format, ...);
int printf(const char* format, ...);
FILE* fopen(const char* path, const char* mode);
int fclose(FILE* stream);
int fputs(const char* Str, FILE* File);
int fputc(int Ch, FILE* File);
int fseek(FILE* File, long Offset, int Origin);
long ftell(FILE* File);
typedef unsigned long long size_t;
size_t fread(void* DstBuf, size_t ElementSize, size_t Count, FILE* File);
typedef __builtin_va_list va_list;
int vsnprintf(char* str, size_t size, const char* format, va_list ap);
void abort(void) __attribute__((noreturn));
void* malloc(size_t Size);
void* calloc(size_t NumOfElements, size_t SizeOfElements);
void free(void* Memory);
int strcmp(const char* a, const char* b);
void* memcpy(void* a, const void* b, size_t c);
int strncmp(const char* a, const char* b, size_t c);
void* memset(void* a, int, size_t b);
size_t strlen(const char* a);
void exit(int) __attribute__((noreturn));
char* getcwd(char*, int);
typedef char* string;
typedef size_t* pointer;
typedef struct MemoryBlock MemoryBlock;
struct MemoryBlock {
    size_t size;
    size_t used;
    char* data;
    MemoryBlock* next;
};
typedef struct StringNode StringNode;
struct StringNode {
    size_t size;
    size_t hash;
    StringNode* next;
    string value;
};
typedef struct {
    StringNode** buckets;
    size_t capacity;
    size_t count;
} StringTable;
extern MemoryBlock* string_memory;
extern MemoryBlock* struct_memory;
void init(void);
string create_string(const char* str, size_t len);
pointer alloc_memory(size_t size, _Bool is_struct);
__attribute__((format(gnu_printf, 1, 2)))
string
string_splice(string format, ...);
string get_info(void);
extern string keywordList[24];
extern string symbolList[30];
extern string specialList[20];
extern string KEYWORD_IMPORT;
extern string KEYWORD_FROM;
extern string KEYWORD_FUNC;
extern string KEYWORD_CLASS;
extern string KEYWORD_METHOD;
extern string KEYWORD_SELF;
extern string KEYWORD_IF;
extern string KEYWORD_ELIF;
extern string KEYWORD_ELSE;
extern string KEYWORD_WHILE;
extern string KEYWORD_FOR;
extern string KEYWORD_TRUE;
extern string KEYWORD_FALSE;
extern string KEYWORD_RETURN;
extern string KEYWORD_BREAK;
extern string KEYWORD_CONTINUE;
extern string KEYWORD_INT;
extern string KEYWORD_FLOAT;
extern string KEYWORD_STRING;
extern string KEYWORD_BOOL;
extern string KEYWORD_VOID;
extern string KEYWORD_VAR;
extern string KEYWORD_POINTER;
extern string KEYWORD_CONST;
extern string SYMBOL_L_PAREN;
extern string SYMBOL_R_PAREN;
extern string SYMBOL_L_BRACE;
extern string SYMBOL_R_BRACE;
extern string SYMBOL_COMMA;
extern string SYMBOL_NOT;
extern string SYMBOL_DOT;
extern string SYMBOL_L_BRACKET;
extern string SYMBOL_R_BRACKET;
extern string SYMBOL_SEMICOLON;
extern string SYMBOL_UNDERLINE;
extern string SYMBOL_ADD;
extern string SYMBOL_SUB;
extern string SYMBOL_MUL;
extern string SYMBOL_DIV;
extern string SYMBOL_MOD;
extern string SYMBOL_LT;
extern string SYMBOL_GT;
extern string SYMBOL_ASSIGN;
extern string SYMBOL_EQ;
extern string SYMBOL_NE;
extern string SYMBOL_LE;
extern string SYMBOL_GE;
extern string SYMBOL_ADD_ASSIGN;
extern string SYMBOL_SUB_ASSIGN;
extern string SYMBOL_MUL_ASSIGN;
extern string SYMBOL_DIV_ASSIGN;
extern string SYMBOL_MOD_ASSIGN;
extern string SYMBOL_AND;
extern string SYMBOL_OR;
extern string SPECIAL_INIT;
extern string SPECIAL_TO_INT;
extern string SPECIAL_TO_FLOAT;
extern string SPECIAL_TO_STRING;
extern string SPECIAL_TO_BOOL;
extern string SPECIAL_ADD;
extern string SPECIAL_SUB;
extern string SPECIAL_MUL;
extern string SPECIAL_DIV;
extern string SPECIAL_MOD;
extern string SPECIAL_EQ;
extern string SPECIAL_NE;
extern string SPECIAL_LT;
extern string SPECIAL_GE;
extern string SPECIAL_GT;
extern string SPECIAL_LE;
extern string SPECIAL_AND;
extern string SPECIAL_OR;
extern string SPECIAL_NOT;
extern string SPECIAL_NEG;
typedef struct ListNode {
    pointer data;
    struct ListNode* next;
} ListNode;
typedef struct List {
    ListNode* head;
    ListNode* tail;
} List;
List* list_create(void);
void list_append(List* self, pointer value);
pointer list_pop_front(List* self);
typedef struct Symbol Symbol;
typedef struct SymbolTable SymbolTable;
extern SymbolTable* global_symbol_table;
extern Symbol* symbol_int;
extern Symbol* symbol_float;
extern Symbol* symbol_string;
extern Symbol* symbol_bool;
extern Symbol* symbol_void;
extern Symbol* symbol_pointer;
extern Symbol* symbol_const;
extern List* parsed_files;
_Bool is_special(string str);
typedef struct File {
    string path;
} File;
File* create_file(string path);
string read_source_code(File* file, size_t* size);
string file_full_path(File* file);
string change_extension(File* file, const char* new_extension);
string file_dir_path(File* file);
typedef struct AST {
    File* file;
    List* members;
    SymbolTable* table;
} AST;
typedef enum CodeMemberType {
    CODE_FUNCTION,
    CODE_CLASS,
    CODE_IMPORT,
} CodeMemberType;
typedef enum ClassMemberType {
    CLASS_METHOD,
    CLASS_ATTRIBUTE,
} ClassMemberType;
typedef enum StatementType {
    STATEMENT_DECLARE_LIST,
    STATEMENT_DECLARE,
    STATEMENT_IF,
    STATEMENT_FOR,
    STATEMENT_WHILE,
    STATEMENT_BREAK,
    STATEMENT_CONTINUE,
    STATEMENT_RETURN,
    STATEMENT_EXPRESSION,
} StatementType;
typedef enum OperatorType {
    OP_ADD,
    OP_SUB,
    OP_MUL,
    OP_DIV,
    OP_MOD,
    OP_ASSIGN,
    OP_EQ,
    OP_NE,
    OP_LT,
    OP_GT,
    OP_LE,
    OP_GE,
    OP_ADD_ASSIGN,
    OP_SUB_ASSIGN,
    OP_MUL_ASSIGN,
    OP_DIV_ASSIGN,
    OP_MOD_ASSIGN,
    OP_AND,
    OP_OR,
    OP_NEG,
    OP_NOT,
    OP_NONE,
} OperatorType;
typedef enum VariableAccessType {
    VAR_ACCESS_VAR,
    VAR_ACCESS_CALL,
    VAR_ACCESS_ATTRIBUTE,
    VAR_ACCESS_INDEX,
} VariableAccessType;
typedef enum PrimaryType {
    PRIMARY_INT,
    PRIMARY_FLOAT,
    PRIMARY_STRING,
    PRIMARY_BOOL,
    PRIMARY_EXPR,
    PRIMARY_NEG,
    PRIMARY_NOT,
    PRIMARY_VAR_ACCESS,
} PrimaryType;
typedef struct CodeMember CodeMember;
typedef struct Function Function;
typedef struct Class Class;
typedef struct Import Import;
typedef struct Statement Statement;
typedef struct ClassMember ClassMember;
typedef struct Method Method;
typedef struct If If;
typedef struct For For;
typedef struct While While;
typedef struct Expression Expression;
typedef struct Variable Variable;
typedef struct Primary Primary;
typedef struct VariableAccess VariableAccess;
struct CodeMember {
    union {
        Function* function;
        Class* class;
        Import* import;
    } member;
    CodeMemberType type;
};
struct Function {
    Symbol* name;
    Symbol* type;
    List* parameters;
    List* body;
};
struct Method {
    Symbol* name;
    Symbol* type;
    List* parameters;
    List* body;
    _Bool special;
};
struct Class {
    Symbol* name;
    List* members;
    SymbolTable* table;
};
struct Import {
    Symbol* name;
    string path;
};
struct ClassMember {
    union {
        Method* method;
        Variable* attribute;
    } member;
    ClassMemberType type;
};
struct Statement {
    union {
        List* declare_list;
        Variable* declare;
        If* if_;
        For* for_;
        While* while_;
        void* break_;
        void* continue_;
        Expression* return_;
        Expression* expression;
    } statement;
    StatementType type;
};
struct If {
    Expression* condition;
    List* body;
    List* elif_list;
    List* else_body;
};
struct For {
    union {
        Variable* decl;
        Expression* expr;
    } init;
    Expression* condition;
    Expression* increment;
    List* body;
    _Bool is_decl;
};
struct While {
    Expression* condition;
    List* body;
};
struct Expression {
    union {
        Expression* binary;
        Primary* unary;
    } left;
    Expression* right;
    OperatorType op;
    Symbol* type;
};
struct Variable {
    Symbol* var;
    Expression* initializer;
};
struct Primary {
    union {
        string literal;
        Expression* exp;
        Primary* neg;
        Primary* not;
        VariableAccess* var_access;
    } value;
    Symbol* type;
    PrimaryType kind;
};
struct VariableAccess {
    VariableAccess* base;
    union {
        Symbol* var;
        List* args;
        Symbol* attribute;
        Expression* index;
    } access;
    Symbol* type;
    VariableAccessType kind;
};
AST* analyzer(AST* ast);
typedef enum {
    TOKEN_IDENTIFIER,
    TOKEN_INTEGER,
    TOKEN_FLOAT,
    TOKEN_STRING,
    TOKEN_SYMBOL,
    TOKEN_KEYWORD,
    TOKEN_COMMENT,
    TOKEN_EOF,
    TOKEN_SPECIAL,
} TokenType;
typedef struct Token {
    TokenType type;
    string lexeme;
    size_t line;
    size_t column;
} Token;
typedef struct Lexer {
    File* source_path;
    size_t line;
    size_t column;
    size_t pos;
    size_t size;
    string source_code;
    Token* current_token;
    Token* next_token;
    _Bool skip_comment;
} Lexer;
Token* get_next_token(Lexer* lexer);
Token* peek_next_token(Lexer* lexer);
Token* get_current_token(Lexer* lexer);
Lexer* create_lexer(File* source_path);
void output_tokens(Lexer* lexer, File* output_path);
void output_one_token(Token* token, FILE* file, _Bool is_lexer_mode);
void print_ast(AST* ast, FILE* out);
void remove_trailing_comma(FILE* out);
void print_symbol_table(SymbolTable* table, FILE* out);
typedef struct Parser {
    Lexer* lexer;
    List* import_files;
    File* file;
    Method* current_method;
    Function* current_function;
    Class* current_class;
} Parser;
Parser* create_parser(Lexer* lexer);
AST* parse_code(Parser* parser);
typedef enum SymbolType {
    SYMBOL_TYPE,
    SYMBOL_VARIABLE,
    SYMBOL_FUNCTION,
    SYMBOL_CLASS,
    SYMBOL_METHOD,
    SYMBOL_ATTRIBUTE,
    SYMBOL_PARAMETER,
} SymbolType;
typedef struct Symbol Symbol;
typedef struct Function Function;
typedef struct Method Method;
typedef struct Class Class;
struct Symbol {
    string name;
    Symbol* type;
    SymbolType kind;
    size_t id;
    union {
        Function* function;
        Method* method;
        Class* class;
        size_t offset;
        size_t size;
    } info;
    SymbolTable* table;
};
typedef enum SymbolTableType {
    SYMBOL_TABLE_GLOBAL,
    SYMBOL_TABLE_FUNCTION,
    SYMBOL_TABLE_CLASS,
    SYMBOL_TABLE_METHOD,
    SYMBOL_TABLE_BLOCK,
} SymbolTableType;
typedef struct SymbolTable SymbolTable;
struct SymbolTable {
    SymbolTable* parent;
    SymbolTableType type;
    List* symbols;
    List* children;
};
Symbol* create_symbol(string name, Symbol* type, SymbolType kind, pointer info, SymbolTable* table);
SymbolTable* create_symbol_table(SymbolTableType type, SymbolTable* parent);
Symbol* search_symbol(SymbolTable* table, string name, _Bool compare_kind, SymbolType compare_kind_value, Symbol* compare_type);
void init_symbol(void);
static _Bool has_error = 0;
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
static void analyze_body(List* body);
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
static Symbol* return_type = ((void*)0);
static string file = ((void*)0);
AST* analyzer(AST* ast) {
    ((void)(ast != ((void*)0)));
    ((void)(ast->file != ((void*)0)));
    file = file_full_path(ast->file);
    ((void)(ast->members != ((void*)0)));
    ((void)(ast->table != ((void*)0)));
    has_error = 0;
    for (List* _foreach_list = (global_symbol_table->children); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (SymbolTable* table = (SymbolTable*)_node->data; table != ((void*)0); table = ((void*)0)) {
                fill_symbol_offset(table, 0);
            }
    if (!(ast->members == ((void*)0) || ast->members->head == ((void*)0))) {
        for (List* _foreach_list = (ast->members); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
            for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
                for (CodeMember* member = (CodeMember*)_node->data; member != ((void*)0); member = ((void*)0)) {
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
                            ((void)(0));
                    }
                }
    }
    if (has_error) return ((void*)0);
    return ast;
}
size_t get_type_size(Symbol* type) {
    if (type->kind == SYMBOL_CLASS)
        return 4;
    return type->info.size;
}
void fill_symbol_offset(SymbolTable* table, size_t base_offset) {
    ((void)(table != ((void*)0)));
    size_t offset = base_offset;
    if (table->type == SYMBOL_TABLE_CLASS || table->type == SYMBOL_TABLE_FUNCTION || table->type == SYMBOL_TABLE_METHOD)
        offset = 0;
    for (List* _foreach_list = (table->symbols); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Symbol* symbol = (Symbol*)_node->data; symbol != ((void*)0); symbol = ((void*)0)) {
                if (symbol->kind != SYMBOL_VARIABLE && symbol->kind != SYMBOL_PARAMETER && symbol->kind != SYMBOL_ATTRIBUTE)
                    continue;
                symbol->info.offset = offset;
                ((void)(symbol->type != ((void*)0)));
                ((void)(symbol->type->kind == SYMBOL_TYPE || symbol->type->kind == SYMBOL_CLASS));
                offset += get_type_size(symbol->type);
            }
    for (List* _foreach_list = (table->children); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (SymbolTable* child = (SymbolTable*)_node->data; child != ((void*)0); child = ((void*)0))
                fill_symbol_offset(child, offset);
}
static _Bool is_number_type(Symbol* type) {
    return type == symbol_int || type == symbol_float || type == symbol_bool;
}
static Symbol* types_compatible(Symbol* left, Symbol* right) {
    if (right == ((void*)0) || left == ((void*)0))
        return ((void*)0);
    if (left == right)
        return left;
    if (is_number_type(left) && is_number_type(right)) {
        if (left == symbol_float || right == symbol_float)
            return symbol_float;
        if (left == symbol_int || right == symbol_int)
            return symbol_int;
        return symbol_bool;
    }
    return ((void*)0);
}
static Symbol* find_method(SymbolTable* table, OperatorType op) {
    switch (op) {
        case OP_ADD:
            return search_symbol(table, SPECIAL_ADD, 1, SYMBOL_METHOD, ((void*)0));
        case OP_SUB:
            return search_symbol(table, SPECIAL_SUB, 1, SYMBOL_METHOD, ((void*)0));
        case OP_MUL:
            return search_symbol(table, SPECIAL_MUL, 1, SYMBOL_METHOD, ((void*)0));
        case OP_DIV:
            return search_symbol(table, SPECIAL_DIV, 1, SYMBOL_METHOD, ((void*)0));
        case OP_MOD:
            return search_symbol(table, SPECIAL_MOD, 1, SYMBOL_METHOD, ((void*)0));
        case OP_ASSIGN:
        case OP_ADD_ASSIGN:
        case OP_SUB_ASSIGN:
        case OP_MUL_ASSIGN:
        case OP_DIV_ASSIGN:
        case OP_MOD_ASSIGN:
        case OP_NONE:
            return ((void*)0);
        case OP_EQ:
            return search_symbol(table, SPECIAL_EQ, 1, SYMBOL_METHOD, ((void*)0));
        case OP_NE:
            return search_symbol(table, SPECIAL_NE, 1, SYMBOL_METHOD, ((void*)0));
        case OP_LT:
            return search_symbol(table, SPECIAL_LT, 1, SYMBOL_METHOD, ((void*)0));
        case OP_GE:
            return search_symbol(table, SPECIAL_GE, 1, SYMBOL_METHOD, ((void*)0));
        case OP_GT:
            return search_symbol(table, SPECIAL_GT, 1, SYMBOL_METHOD, ((void*)0));
        case OP_LE:
            return search_symbol(table, SPECIAL_LE, 1, SYMBOL_METHOD, ((void*)0));
        case OP_AND:
            return search_symbol(table, SPECIAL_AND, 1, SYMBOL_METHOD, ((void*)0));
        case OP_OR:
            return search_symbol(table, SPECIAL_OR, 1, SYMBOL_METHOD, ((void*)0));
        case OP_NOT:
            return search_symbol(table, SPECIAL_NOT, 1, SYMBOL_METHOD, ((void*)0));
        case OP_NEG:
            return search_symbol(table, SPECIAL_NEG, 1, SYMBOL_METHOD, ((void*)0));
        default:
            return ((void*)0);
    }
}
static Symbol* method_other_type(Symbol* method) {
    ((void)(method != ((void*)0)));
    ((void)(method->info.method != ((void*)0)));
    ((void)(method->info.method->parameters != ((void*)0)));
    size_t param_count = 0;
    Symbol* second_param = ((void*)0);
    for (List* _foreach_list = (method->info.method->parameters); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Symbol* param = (Symbol*)_node->data; param != ((void*)0); param = ((void*)0)) {
                if (param_count == 0)
                    do {
                        if (!(param->name == KEYWORD_SELF)) {
                            (void)(fprintf(stderr,
                                           "[analyzer Error] at %s: "
                                           "First parameter of method must be 'self'"
                                           "\n",
                                           file)),
                                has_error = 1;
                            return ((void*)0);
                        }
                    } while (0);
                else if (param_count == 1)
                    second_param = param;
                param_count++;
            }
    do {
        if (!(param_count == 2)) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Binary operations method must have exactly two parameters"
                           "\n",
                           file)),
                has_error = 1;
            return ((void*)0);
        }
    } while (0);
    do {
        if (!(second_param != ((void*)0))) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Second parameter of binary operations special method must not be NULL"
                           "\n",
                           file)),
                has_error = 1;
            return ((void*)0);
        }
    } while (0);
    return second_param->type;
}
static VariableAccess* create_variable_access_var(Symbol* symbol) {
    VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess), 1);
    variable_access->base = ((void*)0);
    variable_access->access.var = symbol;
    variable_access->kind = VAR_ACCESS_VAR;
    variable_access->type = ((void*)0);
    return variable_access;
}
static VariableAccess* create_variable_access_attribute(VariableAccess* base, Symbol* attribute) {
    VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess), 1);
    variable_access->base = base;
    variable_access->access.attribute = attribute;
    variable_access->kind = VAR_ACCESS_ATTRIBUTE;
    variable_access->type = ((void*)0);
    return variable_access;
}
static VariableAccess* create_variable_access_call(VariableAccess* base, Expression* argument) {
    VariableAccess* variable_access = (VariableAccess*)alloc_memory(sizeof(VariableAccess), 1);
    variable_access->base = base;
    variable_access->access.args = list_create();
    variable_access->kind = VAR_ACCESS_CALL;
    variable_access->type = ((void*)0);
    list_append(variable_access->access.args, (pointer)argument);
    return variable_access;
}
static Primary* create_primary_var_access(VariableAccess* variable_access) {
    Primary* primary = (Primary*)alloc_memory(sizeof(Primary), 1);
    primary->kind = PRIMARY_VAR_ACCESS;
    primary->value.var_access = variable_access;
    primary->type = ((void*)0);
    return primary;
}
static Expression* create_expression_from_primary(Primary* primary) {
    Expression* expression = (Expression*)alloc_memory(sizeof(Expression), 1);
    expression->left.unary = primary;
    expression->op = OP_NONE;
    expression->right = ((void*)0);
    expression->type = ((void*)0);
    return expression;
}
static Symbol* create_comparison_method(Class* class, string method_name, Symbol* method_1, Symbol* method_2) {
    ((void)(class != ((void*)0)));
    ((void)(class->table != ((void*)0)));
    ((void)(method_name != ((void*)0)));
    ((void)(method_1 != ((void*)0)));
    Method* method = (Method*)alloc_memory(sizeof(Method), 1);
    method->body = list_create();
    method->parameters = list_create();
    method->special = 1;
    method->type = symbol_bool;
    SymbolTable* method_table = create_symbol_table(SYMBOL_TABLE_METHOD, class->table);
    Symbol* self_symbol = create_symbol(KEYWORD_SELF, class->name, SYMBOL_PARAMETER, ((void*)0), method_table);
    Symbol* other_type = method_other_type(method_1);
    if (method_2 != ((void*)0)) {
        Symbol* second_other_type = method_other_type(method_2);
        Symbol* compatible_type = types_compatible(other_type, second_other_type);
        do {
            if (!(compatible_type != ((void*)0))) {
                (void)(fprintf(stderr,
                               "[analyzer Error] at %s: "
                               "The second parameter types of the two comparison methods must be compatible"
                               "\n",
                               file)),
                    has_error = 1;
                return ((void*)0);
            }
        } while (0);
        other_type = compatible_type;
    }
    Symbol* other_symbol = create_symbol(create_string("other", 5), other_type, SYMBOL_PARAMETER, ((void*)0), method_table);
    list_append(method->parameters, (pointer)self_symbol);
    list_append(method->parameters, (pointer)other_symbol);
    VariableAccess* self_access = create_variable_access_var(self_symbol);
    VariableAccess* call_1_base = create_variable_access_attribute(self_access, method_1);
    Expression* other_argument = create_expression_from_primary(create_primary_var_access(create_variable_access_var(other_symbol)));
    VariableAccess* call_1_access = create_variable_access_call(call_1_base, other_argument);
    Expression* return_expression = ((void*)0);
    if (method_2 == ((void*)0)) {
        Primary* call_primary = create_primary_var_access(call_1_access);
        Primary* not_primary = (Primary*)alloc_memory(sizeof(Primary), 1);
        not_primary->kind = PRIMARY_NOT;
        not_primary->value.not = call_primary;
        not_primary->type = ((void*)0);
        return_expression = create_expression_from_primary(not_primary);
    } else {
        VariableAccess* call_2_base = create_variable_access_attribute(create_variable_access_var(self_symbol), method_2);
        Expression* other_argument_2 = create_expression_from_primary(create_primary_var_access(create_variable_access_var(other_symbol)));
        VariableAccess* call_2_access = create_variable_access_call(call_2_base, other_argument_2);
        Expression* left_expression = create_expression_from_primary(create_primary_var_access(call_1_access));
        Expression* right_expression = create_expression_from_primary(create_primary_var_access(call_2_access));
        return_expression = (Expression*)alloc_memory(sizeof(Expression), 1);
        return_expression->left.binary = left_expression;
        return_expression->op = OP_OR;
        return_expression->right = right_expression;
        return_expression->type = ((void*)0);
    }
    Statement* statement = (Statement*)alloc_memory(sizeof(Statement), 1);
    statement->statement.return_ = return_expression;
    statement->type = STATEMENT_RETURN;
    list_append(method->body, (pointer)statement);
    method->name = create_symbol(method_name, method->type, SYMBOL_METHOD, (pointer)method, class->table);
    ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember), 1);
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
    if (!eq && !ne && (!(lt || ge) || !(gt || le))) {
    }
    while (1) {
        Symbol** method_0 = ((void*)0);
        Symbol* method_1 = ((void*)0);
        Symbol* method_2 = ((void*)0);
        string method_name = ((void*)0);
        if (!eq && ne) {
            method_0 = &eq;
            method_1 = ne;
            method_name = SPECIAL_EQ;
        }
        if (!ne && eq) {
            method_0 = &ne;
            method_1 = eq;
            method_name = SPECIAL_NE;
        }
        if (!lt && ge) {
            method_0 = &lt;
            method_1 = ge;
            method_name = SPECIAL_LT;
        }
        if (!ge && lt) {
            method_0 = &ge;
            method_1 = lt;
            method_name = SPECIAL_GE;
        }
        if (!gt && le) {
            method_0 = &gt;
            method_1 = le;
            method_name = SPECIAL_GT;
        }
        if (!le && gt) {
            method_0 = &le;
            method_1 = gt;
            method_name = SPECIAL_LE;
        }
        if (!le && eq && lt) {
            method_0 = &le;
            method_1 = eq;
            method_2 = lt;
            method_name = SPECIAL_LE;
        }
        if (!ge && eq && gt) {
            method_0 = &ge;
            method_1 = eq;
            method_2 = gt;
            method_name = SPECIAL_GE;
        }
        if (!ne && lt && gt) {
            method_0 = &ne;
            method_1 = lt;
            method_2 = gt;
            method_name = SPECIAL_NE;
        }
        if (method_name == ((void*)0))
            break;
        ((void)(method_0 != ((void*)0)));
        *method_0 = create_comparison_method(class, method_name, method_1, method_2);
    }
}
Symbol* calculate_type(Symbol* left, Symbol* right, OperatorType op) {
    ((void)(left != ((void*)0)));
    if (left == symbol_void && right == ((void*)0)) return symbol_void;
    do {
        if (!(left != symbol_void)) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Cannot perform operations on void type"
                           "\n",
                           file)),
                has_error = 1;
            return symbol_void;
        }
    } while (0);
    ((void)(left->kind == SYMBOL_TYPE || left->kind == SYMBOL_CLASS));
    if (right == ((void*)0)) {
        if (op == OP_NONE) return left;
        if (left->kind == SYMBOL_CLASS) {
            Symbol* method = find_method(left->info.class->table, op);
            if (method != ((void*)0)) {
                ((void)(method->info.method != ((void*)0)));
                do {
                    if (!(!(method->info.method->parameters == ((void*)0) || method->info.method->parameters->head == ((void*)0)) && method->info.method->parameters->head == method->info.method->parameters->tail)) {
                        (void)(fprintf(stderr,
                                       "[analyzer Error] at %s: "
                                       "Unary operation special method must have exactly one parameter"
                                       "\n",
                                       file)),
                            has_error = 1;
                        return symbol_void;
                    }
                } while (0);
                do {
                    if (!(((Symbol*)method->info.method->parameters->head->data)->name == KEYWORD_SELF)) {
                        (void)(fprintf(stderr,
                                       "[analyzer Error] at %s: "
                                       "First parameter of method must be 'self'"
                                       "\n",
                                       file)),
                            has_error = 1;
                        return symbol_void;
                    }
                } while (0);
                return method->type;
            }
        }
        if ((left == symbol_int || left == symbol_float) && op == OP_NEG) return left;
        if (op == OP_NOT) return symbol_bool;
        (void)(fprintf(stderr,
                       "[analyzer Error] at %s: "
                       "Invalid unary operation"
                       "\n",
                       file)),
            has_error = 1;
        return symbol_void;
    }
    ((void)(right != ((void*)0)));
    do {
        if (!(right != symbol_void)) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Cannot perform operations on void type"
                           "\n",
                           file)),
                has_error = 1;
            return symbol_void;
        }
    } while (0);
    ((void)(right->kind == SYMBOL_TYPE || right->kind == SYMBOL_CLASS));
    if ((op == OP_AND || op == OP_OR))
        return symbol_bool;
    if ((op == OP_EQ || op == OP_NE) && types_compatible(left, right) != ((void*)0))
        return symbol_bool;
    if ((op == OP_LT || op == OP_GT || op == OP_LE || op == OP_GE) && is_number_type(left) && is_number_type(right))
        return symbol_bool;
    if ((op == OP_ADD || op == OP_SUB || op == OP_MUL || op == OP_DIV || op == OP_MOD) && is_number_type(left) && is_number_type(right))
        return types_compatible(left, right);
    if (op == OP_ASSIGN && types_compatible(left, right) != ((void*)0))
        return left;
    if ((op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN) && is_number_type(left) && types_compatible(left, right) != ((void*)0))
        return left;
    if (left->kind == SYMBOL_CLASS) {
        Symbol* method = find_method(left->info.class->table, op);
        if (method != ((void*)0) && types_compatible(method_other_type(method), right) != ((void*)0))
            return method->type;
    }
    if (right->kind == SYMBOL_CLASS) {
        Symbol* method = find_method(right->info.class->table, op);
        if (method != ((void*)0) && types_compatible(method_other_type(method), left) != ((void*)0))
            return method->type;
    }
    (void)(fprintf(stderr,
                   "[analyzer Error] at %s: "
                   "Invalid binary operation"
                   "\n",
                   file)),
        has_error = 1;
    fprintf(stderr, "[analyzer Warning]: Type mismatch, left: '%s', right: '%s', op: '%u'\n", left->name, right->name, op);
    return symbol_void;
}
void analyze_import(Import* import) {
    ((void)(import != ((void*)0)));
    ((void)(import->path != ((void*)0)));
    FILE* import_file = fopen(import->path, "r");
    do {
        if (!(import_file != ((void*)0))) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Failed to open import file"
                           "\n",
                           file)),
                has_error = 1;
            return;
        }
    } while (0);
    fclose(import_file);
    analyze_symbol(import->name);
    if (import->name->kind == SYMBOL_CLASS)
        ((void)(import->name->info.class != ((void*)0)));
    else if (import->name->kind == SYMBOL_FUNCTION)
        ((void)(import->name->info.function != ((void*)0)));
    else
        (void)(fprintf(stderr,
                       "[analyzer Error] at %s: "
                       "Imported symbol must be a class or function"
                       "\n",
                       file)),
            has_error = 1;
}
void analyze_class(Class* class) {
    ((void)(class != ((void*)0)));
    analyze_symbol(class->name);
    ((void)(class->members != ((void*)0)));
    auto_fill_comparison_method(class);
    if (!(class->members == ((void*)0) || class->members->head == ((void*)0))) {
        for (List* _foreach_list = (class->members); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
            for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
                for (ClassMember* member = (ClassMember*)_node->data; member != ((void*)0); member = ((void*)0)) {
                    switch (member->type) {
                        case CLASS_METHOD:
                            analyze_method(member->member.method);
                            break;
                        case CLASS_ATTRIBUTE:
                            analyze_variable(member->member.attribute);
                            break;
                        default:
                            ((void)(0));
                    }
                }
    }
}
void analyze_function(Function* function) {
    ((void)(function != ((void*)0)));
    analyze_symbol(function->name);
    analyze_type(function->type);
    return_type = function->type;
    ((void)(function->parameters != ((void*)0)));
    if (!(function->parameters == ((void*)0) || function->parameters->head == ((void*)0))) {
        for (List* _foreach_list = (function->parameters); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
            for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
                for (Symbol* symbol = (Symbol*)_node->data; symbol != ((void*)0); symbol = ((void*)0)) {
                    analyze_symbol(symbol);
                    ((void)(symbol->kind == SYMBOL_PARAMETER));
                }
    }
    analyze_body(function->body);
    return_type = ((void*)0);
}
void analyze_method(Method* method) {
    ((void)(method != ((void*)0)));
    analyze_symbol(method->name);
    analyze_type(method->type);
    return_type = method->type;
    do {
        if (!(!(method->parameters == ((void*)0) || method->parameters->head == ((void*)0)))) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Method must have at least one parameter (self)"
                           "\n",
                           file)),
                has_error = 1;
            return;
        }
    } while (0);
    size_t param_count = 0;
    for (List* _foreach_list = (method->parameters); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Symbol* symbol = (Symbol*)_node->data; symbol != ((void*)0); symbol = ((void*)0)) {
                analyze_symbol(symbol);
                ((void)(symbol->kind == SYMBOL_PARAMETER));
                if (param_count == 0)
                    do {
                        if (!(symbol->name == KEYWORD_SELF)) {
                            (void)(fprintf(stderr,
                                           "[analyzer Error] at %s: "
                                           "First parameter of method must be 'self'"
                                           "\n",
                                           file)),
                                has_error = 1;
                            return;
                        }
                    } while (0);
                param_count++;
            }
    analyze_body(method->body);
    return_type = ((void*)0);
}
void analyze_variable(Variable* variable) {
    ((void)(variable != ((void*)0)));
    analyze_symbol(variable->var);
    analyze_type(variable->var->type);
    if (variable->initializer != ((void*)0)) {
        analyze_expression(variable->initializer);
        do {
            if (!(types_compatible(variable->var->type, variable->initializer->type) != ((void*)0))) {
                (void)(fprintf(stderr,
                               "[analyzer Error] at %s: "
                               "Variable initializer type must be compatible with variable type"
                               "\n",
                               file)),
                    has_error = 1;
                ;
            }
        } while (0);
    }
}
static _Bool is_container_type(Symbol* type) {
    return type->name == KEYWORD_CONST || type->name == KEYWORD_POINTER || strcmp(type->name, "arr") == 0 || strcmp(type->name, "list") == 0;
}
void analyze_type(Symbol* type) {
    ((void)(type != ((void*)0)));
    ((void)(type->name != ((void*)0)));
    ((void)(type->kind == SYMBOL_TYPE || type->kind == SYMBOL_CLASS));
    if (type->type != ((void*)0)) {
        do {
            if (!(is_container_type(type))) {
                (void)(fprintf(stderr,
                               "[analyzer Error] at %s: "
                               "Container types must be const, pointer, arr or list"
                               "\n",
                               file)),
                    has_error = 1;
                return;
            }
        } while (0);
        analyze_type(type->type);
    }
    if (type->kind == SYMBOL_CLASS)
        ((void)(type->info.class != ((void*)0)));
}
void analyze_statement(Statement* statement) {
    ((void)(statement != ((void*)0)));
    switch (statement->type) {
        case STATEMENT_DECLARE_LIST:
            do {
                if (!(!(statement->statement.declare_list == ((void*)0) || statement->statement.declare_list->head == ((void*)0)))) {
                    (void)(fprintf(stderr,
                                   "[analyzer Error] at %s: "
                                   "Declare list statement must not be empty"
                                   "\n",
                                   file)),
                        has_error = 1;
                    return;
                }
            } while (0);
            for (List* _foreach_list = (statement->statement.declare_list); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
                for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
                    for (Variable* var = (Variable*)_node->data; var != ((void*)0); var = ((void*)0))
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
            do {
                if (!(loop_depth > 0)) {
                    (void)(fprintf(stderr,
                                   "[analyzer Error] at %s: "
                                   "Break and continue statements must be inside a loop"
                                   "\n",
                                   file)),
                        has_error = 1;
                    return;
                }
            } while (0);
            break;
        case STATEMENT_RETURN:
            if (statement->statement.return_ != ((void*)0))
                analyze_expression(statement->statement.return_);
            do {
                if (!(return_type != ((void*)0))) {
                    (void)(fprintf(stderr,
                                   "[analyzer Error] at %s: "
                                   "Return statement must be inside a function or method"
                                   "\n",
                                   file)),
                        has_error = 1;
                    ;
                }
            } while (0);
            if (statement->statement.return_ == ((void*)0)) {
                do {
                    if (!(return_type == symbol_void)) {
                        (void)(fprintf(stderr,
                                       "[analyzer Error] at %s: "
                                       "Return statement type must be compatible with function or method return type"
                                       "\n",
                                       file)),
                            has_error = 1;
                        ;
                    }
                } while (0);
            } else {
                do {
                    if (!(types_compatible(return_type, statement->statement.return_->type) != ((void*)0))) {
                        (void)(fprintf(stderr,
                                       "[analyzer Error] at %s: "
                                       "Return statement type must be compatible with function or method return type"
                                       "\n",
                                       file)),
                            has_error = 1;
                        ;
                    }
                } while (0);
            }
            break;
        case STATEMENT_EXPRESSION:
            analyze_expression(statement->statement.expression);
            break;
        default:
            ((void)(0));
    }
}
void analyze_body(List* body) {
    ((void)(body != ((void*)0)));
    if ((body == ((void*)0) || body->head == ((void*)0))) return;
    for (List* _foreach_list = (body); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Statement* statement = (Statement*)_node->data; statement != ((void*)0); statement = ((void*)0)) {
                analyze_statement(statement);
            }
}
void analyze_expression(Expression* expression) {
    ((void)(expression != ((void*)0)));
    ((void)(expression->type == ((void*)0)));
    if (expression->op == OP_NONE) {
        ((void)(expression->left.unary != ((void*)0)));
        ((void)(expression->right == ((void*)0)));
        analyze_primary(expression->left.unary);
        expression->type = calculate_type(expression->left.unary->type, ((void*)0), OP_NONE);
    } else {
        ((void)(expression->left.binary != ((void*)0)));
        ((void)(expression->right != ((void*)0)));
        analyze_expression(expression->left.binary);
        analyze_expression(expression->right);
        expression->type = calculate_type(expression->left.binary->type, expression->right->type, expression->op);
    }
    do {
        if (!(expression->type != ((void*)0))) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Expression type must not be NULL"
                           "\n",
                           file)),
                has_error = 1;
            expression->type = symbol_void;
        }
    } while (0);
}
void analyze_if(If* if_) {
    ((void)(if_ != ((void*)0)));
    ((void)(if_->condition != ((void*)0)));
    ((void)(if_->body != ((void*)0)));
    ((void)(if_->elif_list != ((void*)0)));
    ((void)(if_->else_body != ((void*)0)));
    analyze_expression(if_->condition);
    analyze_body(if_->body);
    if (!(if_->elif_list == ((void*)0) || if_->elif_list->head == ((void*)0))) {
        for (List* _foreach_list = (if_->elif_list); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
            for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
                for (If* elif = (If*)_node->data; elif != ((void*)0); elif = ((void*)0)) {
                    ((void)(elif != ((void*)0)));
                    ((void)(elif->condition != ((void*)0)));
                    ((void)(elif->body != ((void*)0)));
                    ((void)(elif->else_body == ((void*)0)));
                    ((void)(elif->elif_list == ((void*)0)));
                    analyze_expression(elif->condition);
                    analyze_body(elif->body);
                }
    }
    if (!(if_->else_body == ((void*)0) || if_->else_body->head == ((void*)0)))
        analyze_body(if_->else_body);
}
void analyze_for(For* for_) {
    ((void)(for_ != ((void*)0)));
    ((void)(loop_depth >= 0));
    ((void)(for_->body != ((void*)0)));
    loop_depth++;
    if (for_->is_decl && for_->init.decl != ((void*)0))
        analyze_variable(for_->init.decl);
    else if (!for_->is_decl && for_->init.expr != ((void*)0))
        analyze_expression(for_->init.expr);
    if (for_->condition != ((void*)0))
        analyze_expression(for_->condition);
    if (for_->increment != ((void*)0))
        analyze_expression(for_->increment);
    analyze_body(for_->body);
    loop_depth--;
    ((void)(loop_depth >= 0));
}
void analyze_while(While* while_) {
    ((void)(while_ != ((void*)0)));
    ((void)(loop_depth >= 0));
    ((void)(while_->condition != ((void*)0)));
    ((void)(while_->body != ((void*)0)));
    loop_depth++;
    analyze_expression(while_->condition);
    analyze_body(while_->body);
    loop_depth--;
    ((void)(loop_depth >= 0));
}
void analyze_primary(Primary* primary) {
    ((void)(primary != ((void*)0)));
    ((void)(primary->type == ((void*)0)));
    switch (primary->kind) {
        case PRIMARY_INT:
            ((void)(primary->value.literal != ((void*)0)));
            primary->type = symbol_int;
            break;
        case PRIMARY_FLOAT:
            ((void)(primary->value.literal != ((void*)0)));
            primary->type = symbol_float;
            break;
        case PRIMARY_STRING:
            ((void)(primary->value.literal != ((void*)0)));
            primary->type = symbol_string;
            break;
        case PRIMARY_BOOL:
            ((void)(primary->value.literal != ((void*)0)));
            primary->type = symbol_bool;
            break;
        case PRIMARY_NOT:
            analyze_primary(primary->value.not);
            primary->type = calculate_type(primary->value.not->type, ((void*)0), OP_NOT);
            break;
        case PRIMARY_NEG:
            analyze_primary(primary->value.neg);
            primary->type = calculate_type(primary->value.neg->type, ((void*)0), OP_NEG);
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
            ((void)(0));
    }
    do {
        if (!(primary->type != ((void*)0))) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Primary expression type could not be determined"
                           "\n",
                           file)),
                has_error = 1;
            primary->type = symbol_void;
        }
    } while (0);
}
static void analyze_var_access_var(VariableAccess* variable_access) {
    ((void)(variable_access->access.var != ((void*)0)));
    analyze_symbol(variable_access->access.var);
    ((void)(variable_access->base == ((void*)0)));
    Symbol* var = variable_access->access.var;
    if (var->kind == SYMBOL_VARIABLE || var->kind == SYMBOL_PARAMETER || var->kind == SYMBOL_ATTRIBUTE)
        variable_access->type = var->type;
    else if (var->kind == SYMBOL_FUNCTION || var->kind == SYMBOL_METHOD || var->kind == SYMBOL_CLASS)
        variable_access->type = var;
    else
        ((void)(0));
}
static void analyze_var_access_call(VariableAccess* variable_access) {
    ((void)(variable_access->base != ((void*)0)));
    ((void)(variable_access->access.args != ((void*)0)));
    do {
        if (!(variable_access->base->type != ((void*)0))) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Base of call has no type"
                           "\n",
                           file)),
                has_error = 1;
            return;
        }
    } while (0);
    size_t arg_count = 0;
    for (List* _foreach_list = (variable_access->access.args); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Expression* arg = (Expression*)_node->data; arg != ((void*)0); arg = ((void*)0)) {
                analyze_expression(arg);
                ++arg_count;
            }
    VariableAccess* base = variable_access->base;
    do {
        if (!((base->kind == VAR_ACCESS_VAR && (base->type->kind == SYMBOL_FUNCTION || base->type->kind == SYMBOL_CLASS)) || (base->kind == VAR_ACCESS_ATTRIBUTE && base->type->kind == SYMBOL_METHOD))) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Base of call must be a function, method or class"
                           "\n",
                           file)),
                has_error = 1;
            return;
        }
    } while (0);
    union {
        Function* function;
        Method* method;
    } callee;
    _Bool is_method = 1;
    if (base->type->kind == SYMBOL_CLASS) {
        Symbol* init_method = search_symbol(base->type->info.class->table, SPECIAL_INIT, 1, SYMBOL_METHOD, ((void*)0));
        do {
            if (!(init_method != ((void*)0))) {
                (void)(fprintf(stderr,
                               "[analyzer Error] at %s: "
                               "Class call must define '$init' special method"
                               "\n",
                               file)),
                    has_error = 1;
                return;
            }
        } while (0);
        ((void)(init_method->info.method != ((void*)0)));
        callee.method = init_method->info.method;
    } else if (base->type->kind == SYMBOL_FUNCTION) {
        ((void)(base->type->info.function != ((void*)0)));
        callee.function = base->type->info.function;
        is_method = 0;
    } else if (base->type->kind == SYMBOL_METHOD) {
        ((void)(base->type->info.method != ((void*)0)));
        callee.method = base->type->info.method;
    } else {
        ((void)(0));
    }
    size_t param_count = 0;
    for (List* _foreach_list = (is_method ? callee.method->parameters : callee.function->parameters); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Symbol* param = (Symbol*)_node->data; param != ((void*)0); param = ((void*)0)) param_count++;
    Symbol** param_types = calloc(((arg_count) > (param_count) ? (arg_count) : (param_count)), sizeof(Symbol*));
    size_t i = 0;
    for (List* _foreach_list = (is_method ? callee.method->parameters : callee.function->parameters); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Symbol* param = (Symbol*)_node->data; param != ((void*)0); param = ((void*)0)) {
                ((void)(param->kind == SYMBOL_PARAMETER));
                param_types[i++] = param->type;
            }
    Symbol* name = is_method ? callee.method->name : callee.function->name;
    size_t compare_count = ((arg_count) < (param_count) ? (arg_count) : (param_count));
    if (is_method) --param_count;
    i = is_method ? 1 : 0;
    for (List* _foreach_list = (variable_access->access.args); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Expression* arg = (Expression*)_node->data; arg != ((void*)0); arg = ((void*)0)) {
                if (i >= compare_count)
                    break;
                Symbol* param_type = param_types[i++];
                ((void)(arg->type != ((void*)0)));
                ((void)(param_type != ((void*)0)));
                do {
                    if (!(types_compatible(arg->type, param_type))) {
                        (void)(fprintf(stderr,
                                       "[analyzer Error] at %s: "
                                       "Argument type must match callee parameter type"
                                       "\n",
                                       file)),
                            has_error = 1;
                        fprintf(stderr, "    Type mismatch in %s call '%s', expected '%s', got '%s'\n", (is_method ? "method" : "function"), name->name, param_type->name, arg->type->name);
                    }
                } while (0);
            }
    do {
        if (!(arg_count == param_count)) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Argument count must match callee parameter count"
                           "\n",
                           file)),
                has_error = 1;
            fprintf(stderr, "    Argument count mismatch in %s call '%s', expected %zu, got %zu\n", (is_method ? "method" : "function"), name->name, param_count, arg_count);
        }
    } while (0);
    if (base->type->kind == SYMBOL_CLASS)
        variable_access->type = base->type;
    else
        variable_access->type = base->type->type;
    free(param_types);
}
static void analyze_var_access_attribute(VariableAccess* variable_access) {
    ((void)(variable_access->base != ((void*)0)));
    ((void)(variable_access->access.attribute != ((void*)0)));
    do {
        if (!(variable_access->base->type != ((void*)0))) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Base of attribute access has no type"
                           "\n",
                           file)),
                has_error = 1;
            return;
        }
    } while (0);
    analyze_symbol(variable_access->access.attribute);
    do {
        if (!(variable_access->base->type->kind == SYMBOL_CLASS)) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Base of attribute access must be a class"
                           "\n",
                           file)),
                has_error = 1;
            return;
        }
    } while (0);
    if (variable_access->access.attribute->kind == SYMBOL_METHOD)
        variable_access->type = variable_access->access.attribute;
    else if (variable_access->access.attribute->kind == SYMBOL_ATTRIBUTE)
        variable_access->type = variable_access->access.attribute->type;
    else
        ((void)(0));
}
static void analyze_var_access_index(VariableAccess* variable_access) {
    ((void)(variable_access->base != ((void*)0)));
    ((void)(variable_access->access.index != ((void*)0)));
    do {
        if (!(variable_access->base->type != ((void*)0))) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Base of index access has no type"
                           "\n",
                           file)),
                has_error = 1;
            return;
        }
    } while (0);
    analyze_expression(variable_access->access.index);
    do {
        if (!(types_compatible(variable_access->access.index->type, symbol_int) == symbol_int)) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Index must be of type int"
                           "\n",
                           file)),
                has_error = 1;
            return;
        }
    } while (0);
    Symbol* type = variable_access->base->type;
    do {
        if (!(is_container_type(type))) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Index access base must be a container type"
                           "\n",
                           file)),
                has_error = 1;
            return;
        }
    } while (0);
    ((void)(type->type != ((void*)0)));
    variable_access->type = type->type;
}
void analyze_variable_access(VariableAccess* variable_access) {
    ((void)(variable_access != ((void*)0)));
    ((void)(variable_access->type == ((void*)0)));
    if (variable_access->base != ((void*)0)) analyze_variable_access(variable_access->base);
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
            ((void)(0));
    }
    do {
        if (!(variable_access->type != ((void*)0))) {
            (void)(fprintf(stderr,
                           "[analyzer Error] at %s: "
                           "Variable access type could not be determined"
                           "\n",
                           file)),
                has_error = 1;
            variable_access->type = symbol_void;
        }
    } while (0);
}
void analyze_symbol(Symbol* symbol) {
    ((void)(symbol != ((void*)0)));
    ((void)(symbol->name != ((void*)0)));
    switch (symbol->kind) {
        case SYMBOL_TYPE:
            if (is_container_type(symbol))
                ((void)(symbol->type != ((void*)0)));
            else
                ((void)(symbol->type == ((void*)0)));
            break;
        case SYMBOL_VARIABLE:
            ((void)(symbol->type != ((void*)0)));
            break;
        case SYMBOL_FUNCTION:
            ((void)(symbol->type != ((void*)0)));
            ((void)(symbol->info.function != ((void*)0)));
            break;
        case SYMBOL_CLASS:
            ((void)(symbol->info.class != ((void*)0)));
            if (is_container_type(symbol))
                ((void)(symbol->type != ((void*)0)));
            else
                ((void)(symbol->type == ((void*)0)));
            break;
        case SYMBOL_METHOD:
            ((void)(symbol->type != ((void*)0)));
            ((void)(symbol->info.method != ((void*)0)));
            break;
        case SYMBOL_ATTRIBUTE:
            ((void)(symbol->type != ((void*)0)));
            break;
        case SYMBOL_PARAMETER:
            ((void)(symbol->type != ((void*)0)));
            break;
        default:
            ((void)(0));
    }
    if (symbol->type != ((void*)0))
        analyze_type(symbol->type);
}
static string get_cwd(void) {
    return getcwd(((void*)0), 0);
}
static string normalization(string path) {
    if (path == ((void*)0) || path[0] == '\0') {
        return ((void*)0);
    }
    string cwd = ((void*)0);
    _Bool path_has_drive = ((path[0] >= 'A' && path[0] <= 'Z') || (path[0] >= 'a' && path[0] <= 'z')) && path[1] == ':';
    _Bool path_is_absolute = path[0] == '/' || path[0] == '\\' || (path_has_drive && (path[2] == '/' || path[2] == '\\'));
    if (!path_is_absolute) {
        cwd = get_cwd();
    }
    const char* sources[2];
    size_t source_count = 0;
    if (cwd != ((void*)0)) {
        sources[source_count++] = cwd;
    }
    sources[source_count++] = path;
    size_t capacity = strlen(path) + (cwd != ((void*)0) ? strlen(cwd) : 0) + 2;
    char* normalized = (char*)alloc_memory(capacity + 1, 0);
    if (normalized == ((void*)0)) {
        if (cwd != ((void*)0)) {
            free(cwd);
        }
        return path;
    }
    size_t* checkpoints = (size_t*)alloc_memory((capacity + 1) * sizeof(size_t), 0);
    if (checkpoints == ((void*)0)) {
        if (cwd != ((void*)0)) {
            free(cwd);
        }
        return path;
    }
    size_t out_len = 0;
    size_t depth = 0;
    size_t prefix_depth = 0;
    _Bool absolute_result = 0;
    for (size_t source_index = 0; source_index < source_count; ++source_index) {
        const char* source = sources[source_index];
        size_t i = 0;
        if (source_index == 0) {
            if (((source[0] >= 'A' && source[0] <= 'Z') || (source[0] >= 'a' && source[0] <= 'z')) && source[1] == ':') {
                normalized[out_len++] = source[0];
                normalized[out_len++] = ':';
                absolute_result = 1;
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
                absolute_result = 1;
                prefix_depth = 1;
                checkpoints[depth++] = out_len;
                while (source[i] == '/' || source[i] == '\\') {
                    ++i;
                }
            }
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
    if (cwd != ((void*)0)) {
        free(cwd);
    }
    return result;
}
File* create_file(string path) {
    File* file = (File*)alloc_memory(sizeof(File), 1);
    file->path = normalization(path);
    return file;
}
string read_source_code(File* file, size_t* size) {
    FILE* open_file = fopen(file->path, "r");
    if (open_file == ((void*)0)) {
        fprintf(stderr, "[fill Error] at <read_source_code> Cannot open file: %s\n", file->path);
        return ((void*)0);
    }
    fseek(open_file, 0, 2);
    *size = (size_t)ftell(open_file);
    fseek(open_file, 0, 0);
    string content = (string)alloc_memory(*size, 0);
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
static _Bool is_keyword(string str) {
    for (size_t i = 0; i < 24; ++i) {
        if (str == keywordList[i]) {
            return 1;
        }
    }
    return 0;
}
static Token* create_token(TokenType type, string lexeme, size_t line, size_t column) {
    Token* token = (Token*)alloc_memory(sizeof(Token), 1);
    token->type = type;
    if (type == TOKEN_IDENTIFIER && is_keyword(lexeme)) {
        token->type = TOKEN_KEYWORD;
    }
    if (type == TOKEN_SPECIAL && !is_special(lexeme)) {
        return ((void*)0);
    }
    token->lexeme = lexeme;
    token->line = line;
    token->column = column;
    return token;
}
static Token* get_token(Lexer* lexer) {
    while (1) {
        char c = lexer->source_code[lexer->pos++];
        lexer->column++;
        if (c == '\0') {
            return create_token(TOKEN_EOF, ((void*)0), lexer->line, lexer->column);
        } else if (c == ' ' || c == '\t' || c == '\r') {
            continue;
        } else if (c == '\n') {
            lexer->line++;
            lexer->column = 0;
            continue;
        } else if (((c) >= 'a' && (c) <= 'z') || ((c) >= 'A' && (c) <= 'Z') || c == '_' || c == '$') {
            _Bool is_special = (c == '$');
            size_t start = lexer->pos - 1;
            size_t column_start = lexer->column - 1;
            do {
                c = lexer->source_code[lexer->pos++];
                lexer->column++;
            } while (((c) >= 'a' && (c) <= 'z') || ((c) >= 'A' && (c) <= 'Z') || ((c) >= '0' && (c) <= '9') || c == '_');
            lexer->pos -= 1;
            lexer->column -= 1;
            string content = create_string(&lexer->source_code[start], lexer->pos - start);
            if (is_special) {
                Token* token = create_token(TOKEN_SPECIAL, content, lexer->line, column_start);
                if (token == ((void*)0)) {
                    fprintf(stderr, "[lexer Error] at %s:%zu:%zu: %s\n", file_full_path(lexer->source_path), lexer->line + 1, column_start + 1, "Invalid special method");
                    return create_token(TOKEN_IDENTIFIER, content, lexer->line, column_start);
                }
                return token;
            }
            return create_token(TOKEN_IDENTIFIER, content, lexer->line, column_start);
        } else if (((c) >= '0' && (c) <= '9')) {
            size_t start = lexer->pos - 1;
            size_t column_start = lexer->column - 1;
            while (((c) >= '0' && (c) <= '9')) {
                c = lexer->source_code[lexer->pos++];
                lexer->column++;
            }
            TokenType type = TOKEN_INTEGER;
            char p = lexer->source_code[lexer->pos];
            if (c == '.' && (((p) >= '0' && (p) <= '9'))) {
                c = lexer->source_code[lexer->pos++];
                lexer->column++;
                while (((c) >= '0' && (c) <= '9')) {
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
                fprintf(stderr, "[lexer Error] at %s:%zu:%zu: %s\n", file_full_path(lexer->source_path), lexer->line + 1, start - 1 + 1, "Unterminated string literal");
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
                    ((void)(c != '\0'));
                }
                if (p == '\0') {
                    if (c == '\0') {
                        lexer->pos -= 1;
                        lexer->column -= 1;
                    }
                    fprintf(stderr, "[lexer Error] at %s:%zu:%zu: %s\n", file_full_path(lexer->source_path), lexer->line + 1, start + 1, "Unterminated comment");
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
                fprintf(stderr, "[lexer Error] at %s:%zu:%zu: %s\n", file_full_path(lexer->source_path), lexer->line + 1, lexer->column - 1 + 1, "Unexpected character");
                return create_token(TOKEN_EOF, ((void*)0), 0, 0);
            }
        }
    }
}
Token* get_next_token(Lexer* lexer) {
    if (lexer->next_token != ((void*)0)) {
        lexer->current_token = lexer->next_token;
    } else {
        do {
            lexer->current_token = get_token(lexer);
        } while (lexer->skip_comment && lexer->current_token->type == TOKEN_COMMENT);
    }
    lexer->next_token = ((void*)0);
    return lexer->current_token;
}
Token* peek_next_token(Lexer* lexer) {
    if (lexer->next_token == ((void*)0)) {
        do {
            lexer->next_token = get_token(lexer);
        } while (lexer->skip_comment && lexer->next_token->type == TOKEN_COMMENT);
    }
    return lexer->next_token;
}
Token* get_current_token(Lexer* lexer) {
    if (lexer->current_token == ((void*)0)) {
        do {
            lexer->current_token = get_token(lexer);
        } while (lexer->skip_comment && lexer->current_token->type == TOKEN_COMMENT);
    }
    return lexer->current_token;
}
Lexer* create_lexer(File* source_path) {
    Lexer* lexer = (Lexer*)alloc_memory(sizeof(Lexer), 1);
    lexer->source_path = source_path;
    lexer->source_code = read_source_code(source_path, &lexer->size);
    lexer->line = 0;
    lexer->column = 0;
    lexer->pos = 0;
    lexer->current_token = ((void*)0);
    lexer->next_token = ((void*)0);
    return lexer;
}
void output_tokens(Lexer* lexer, File* output_path) {
    FILE* file = fopen(change_extension(output_path, ".lex"), "w");
    for (Token* token = get_next_token(lexer); token != ((void*)0); token = get_next_token(lexer)) {
        output_one_token(token, file, 1);
        if (token->type == TOKEN_EOF) break;
    }
    fprintf(file, "\ninfo by lib:\n    %s\n", get_info());
    fclose(file);
}
void output_one_token(Token* token, FILE* file, _Bool is_lexer_mode) {
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
    if (token->lexeme == ((void*)0)) {
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
MemoryBlock* string_memory = ((void*)0);
MemoryBlock* struct_memory = ((void*)0);
static size_t malloc_allocated = 0;
static size_t string_count = 0;
static StringTable* string_table = ((void*)0);
static void free_all_memory(void) {
    MemoryBlock* block = string_memory;
    while (block != ((void*)0)) {
        MemoryBlock* next = block->next;
        free(block->data);
        free(block);
        block = next;
    }
    string_memory = ((void*)0);
    block = struct_memory;
    while (block != ((void*)0)) {
        MemoryBlock* next = block->next;
        free(block->data);
        free(block);
        block = next;
    }
    struct_memory = ((void*)0);
}
static MemoryBlock* create_memory_block(size_t size) {
    MemoryBlock* block = malloc(sizeof(MemoryBlock));
    if (block == ((void*)0)) {
        fprintf(stderr, "[lib Fatal] at <create_memory_block>: Cannot allocate memory\n");
        free_all_memory();
        abort();
    }
    malloc_allocated += sizeof(MemoryBlock);
    block->size = size;
    block->used = 0;
    block->data = malloc(size);
    if (block->data == ((void*)0)) {
        fprintf(stderr, "[lib Fatal] at <create_memory_block>: Cannot allocate memory\n");
        free(block);
        free_all_memory();
        abort();
    }
    malloc_allocated += size;
    block->next = ((void*)0);
    return block;
}
static void increase_memory(MemoryBlock** block, size_t additional_size) {
    MemoryBlock* new_block = create_memory_block((*block)->size + additional_size);
    new_block->next = *block;
    *block = new_block;
}
static StringTable* create_string_table(size_t capacity) {
    StringTable* table = (StringTable*)alloc_memory(sizeof(StringTable), 1);
    table->capacity = capacity;
    table->count = 0;
    table->buckets = calloc(capacity, sizeof(StringNode*));
    return table;
}
static size_t hash(const char* str, size_t len) {
    size_t hash_value = 2166136261;
    for (size_t i = 0; i < len; i++) {
        hash_value ^= (unsigned char)str[i];
        hash_value *= 16777619;
    }
    return hash_value;
}
static string create_string_check(const char* str, size_t len, _Bool check) {
    size_t hash_value = hash(str, len);
    size_t index = hash_value % string_table->capacity;
    if (check) {
        StringNode* current = string_table->buckets[index];
        while (current != ((void*)0)) {
            if (current->size == len && current->hash == hash_value && strncmp(current->value, str, len) == 0)
                return current->value;
            current = current->next;
        }
    }
    StringNode* node = (StringNode*)alloc_memory(sizeof(StringNode), 1);
    node->size = len;
    node->hash = hash_value;
    node->next = string_table->buckets[index];
    node->value = (string)alloc_memory(len + 1, 0);
    memcpy(node->value, str, len);
    node->value[len] = '\0';
    string_table->buckets[index] = node;
    string_table->count++;
    string_count++;
    return node->value;
}
static void init_constant(void);
void init(void) {
    if (string_memory == ((void*)0))
        string_memory = create_memory_block(1024);
    if (struct_memory == ((void*)0))
        struct_memory = create_memory_block(1024);
    if (string_table == ((void*)0))
        string_table = create_string_table(1024);
    init_constant();
}
string create_string(const char* str, size_t len) {
    return create_string_check(str, len, 1);
}
pointer alloc_memory(size_t size, _Bool is_struct) {
    if (size >= 1024) {
        pointer ptr = malloc(size);
        if (ptr == ((void*)0)) {
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
        size = (size + ((size_t)8) - 1) & ~(((size_t)8) - 1);
    }
    while (block != ((void*)0)) {
        if (block->size - block->used >= size) {
            pointer ptr = (void*)(block->data + block->used);
            if (is_struct)
                ((void)((size_t)ptr % ((size_t)8) == 0));
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
    __builtin_va_start(args, format);
    int length = vsnprintf(((void*)0), 0, format, args);
    __builtin_va_end(args);
    if (length <= 0) {
        fprintf(stderr, "[lib Error] at <string_splice>: Failed to format string\n");
        return ((void*)0);
    }
    char* name = malloc((size_t)length + 1);
    if (name == ((void*)0)) {
        fprintf(stderr, "[lib Fatal] at <string_splice>: Cannot allocate memory\n");
        free_all_memory();
        abort();
    }
    __builtin_va_start(args, format);
    vsnprintf(name, (size_t)length + 1, format, args);
    __builtin_va_end(args);
    string result = create_string(name, (size_t)length);
    free(name);
    return result;
}
string get_info(void) {
    size_t used_memory_count = 0;
    size_t total_memory_count = 0;
    size_t memory_block_count = 0;
    MemoryBlock* block = struct_memory;
    while (block != ((void*)0)) {
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
    while (block != ((void*)0)) {
        used_memory_count += block->used;
        total_memory_count += block->size;
        ++memory_block_count;
        block = block->next;
    }
    string string_info = string_splice("string memory: [used/total: %zu/%zu, blocks: %zu]", used_memory_count, total_memory_count, memory_block_count);
    return string_splice("platform: %d, malloc allocated: %zu, %s, %s", 2, malloc_allocated, string_info, struct_info);
}
static const char* keywordStrings[24] = {"import", "from", "func", "class", "method", "self", "if", "elif", "else", "while", "for", "true", "false", "return", "break", "continue", "int", "float", "string", "bool", "void", "var", "pointer", "const"};
string keywordList[24] = {0};
static const char* symbolStrings[30] = {"(", ")", "{", "}", ",", "!", ".", "[", "]", ";", "_", "+", "-", "*", "/", "%", "<", ">", "=", "==", "!=", "<=", ">=", "+=", "-=", "*=", "/=", "%=", "&&", "||"};
string symbolList[30] = {0};
static const char* specialStrings[20] = {"$init", "$to_int", "$to_float", "$to_string", "$to_bool", "$add", "$sub", "$mul", "$div", "$mod", "$eq", "$ne", "$lt", "$ge", "$gt", "$le", "$and", "$or", "$not", "$neg"};
string specialList[20] = {0};
string KEYWORD_IMPORT = ((void*)0);
string KEYWORD_FROM = ((void*)0);
string KEYWORD_FUNC = ((void*)0);
string KEYWORD_CLASS = ((void*)0);
string KEYWORD_METHOD = ((void*)0);
string KEYWORD_SELF = ((void*)0);
string KEYWORD_IF = ((void*)0);
string KEYWORD_ELIF = ((void*)0);
string KEYWORD_ELSE = ((void*)0);
string KEYWORD_WHILE = ((void*)0);
string KEYWORD_FOR = ((void*)0);
string KEYWORD_TRUE = ((void*)0);
string KEYWORD_FALSE = ((void*)0);
string KEYWORD_RETURN = ((void*)0);
string KEYWORD_BREAK = ((void*)0);
string KEYWORD_CONTINUE = ((void*)0);
string KEYWORD_INT = ((void*)0);
string KEYWORD_FLOAT = ((void*)0);
string KEYWORD_STRING = ((void*)0);
string KEYWORD_BOOL = ((void*)0);
string KEYWORD_VOID = ((void*)0);
string KEYWORD_VAR = ((void*)0);
string KEYWORD_POINTER = ((void*)0);
string KEYWORD_CONST = ((void*)0);
string SYMBOL_L_PAREN = ((void*)0);
string SYMBOL_R_PAREN = ((void*)0);
string SYMBOL_L_BRACE = ((void*)0);
string SYMBOL_R_BRACE = ((void*)0);
string SYMBOL_COMMA = ((void*)0);
string SYMBOL_NOT = ((void*)0);
string SYMBOL_DOT = ((void*)0);
string SYMBOL_L_BRACKET = ((void*)0);
string SYMBOL_R_BRACKET = ((void*)0);
string SYMBOL_SEMICOLON = ((void*)0);
string SYMBOL_UNDERLINE = ((void*)0);
string SYMBOL_ADD = ((void*)0);
string SYMBOL_SUB = ((void*)0);
string SYMBOL_MUL = ((void*)0);
string SYMBOL_DIV = ((void*)0);
string SYMBOL_MOD = ((void*)0);
string SYMBOL_LT = ((void*)0);
string SYMBOL_GT = ((void*)0);
string SYMBOL_ASSIGN = ((void*)0);
string SYMBOL_EQ = ((void*)0);
string SYMBOL_NE = ((void*)0);
string SYMBOL_LE = ((void*)0);
string SYMBOL_GE = ((void*)0);
string SYMBOL_ADD_ASSIGN = ((void*)0);
string SYMBOL_SUB_ASSIGN = ((void*)0);
string SYMBOL_MUL_ASSIGN = ((void*)0);
string SYMBOL_DIV_ASSIGN = ((void*)0);
string SYMBOL_MOD_ASSIGN = ((void*)0);
string SYMBOL_AND = ((void*)0);
string SYMBOL_OR = ((void*)0);
string SPECIAL_INIT = ((void*)0);
string SPECIAL_TO_INT = ((void*)0);
string SPECIAL_TO_FLOAT = ((void*)0);
string SPECIAL_TO_STRING = ((void*)0);
string SPECIAL_TO_BOOL = ((void*)0);
string SPECIAL_ADD = ((void*)0);
string SPECIAL_SUB = ((void*)0);
string SPECIAL_MUL = ((void*)0);
string SPECIAL_DIV = ((void*)0);
string SPECIAL_MOD = ((void*)0);
string SPECIAL_EQ = ((void*)0);
string SPECIAL_NE = ((void*)0);
string SPECIAL_LT = ((void*)0);
string SPECIAL_GE = ((void*)0);
string SPECIAL_GT = ((void*)0);
string SPECIAL_LE = ((void*)0);
string SPECIAL_AND = ((void*)0);
string SPECIAL_OR = ((void*)0);
string SPECIAL_NOT = ((void*)0);
string SPECIAL_NEG = ((void*)0);
SymbolTable* global_symbol_table = ((void*)0);
Symbol* symbol_int = ((void*)0);
Symbol* symbol_float = ((void*)0);
Symbol* symbol_string = ((void*)0);
Symbol* symbol_bool = ((void*)0);
Symbol* symbol_void = ((void*)0);
Symbol* symbol_pointer = ((void*)0);
Symbol* symbol_const = ((void*)0);
List* parsed_files = ((void*)0);
static void init_constant(void) {
    for (size_t i = 0; i < 24; ++i) {
        keywordList[i] = create_string_check(keywordStrings[i], strlen(keywordStrings[i]), 0);
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
    for (size_t i = 0; i < 30; ++i) {
        symbolList[i] = create_string_check(symbolStrings[i], strlen(symbolStrings[i]), 0);
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
    for (size_t i = 0; i < 20; ++i) {
        specialList[i] = create_string_check(specialStrings[i], strlen(specialStrings[i]), 0);
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
    List* self = (List*)alloc_memory(sizeof(List), 1);
    self->head = ((void*)0);
    self->tail = ((void*)0);
    return self;
}
void list_append(List* self, pointer value) {
    if (self == ((void*)0)) {
        fprintf(stderr, "[lib Fatal] at <list_append>: List is NULL\n");
        abort();
    }
    ListNode* node = (ListNode*)alloc_memory(sizeof(ListNode), 1);
    node->data = value;
    node->next = ((void*)0);
    if (self->tail == ((void*)0)) {
        self->head = node;
        self->tail = node;
    } else {
        self->tail->next = node;
        self->tail = node;
    }
}
pointer list_pop_front(List* self) {
    if ((self == ((void*)0) || self->head == ((void*)0))) {
        return ((void*)0);
    }
    pointer value = self->head->data;
    self->head = self->head->next;
    if (self->head == ((void*)0)) {
        self->tail = ((void*)0);
    }
    return value;
}
_Bool is_special(string str) {
    for (size_t i = 0; i < 20; ++i) {
        if (str == specialList[i]) {
            return 1;
        }
    }
    return 0;
}
typedef enum OutputFlags {
    OUTPUT_NONE = 0,
    OUTPUT_RESULT = 1,
    OUTPUT_IR = 2,
    OUTPUT_AST = 4,
    OUTPUT_TOKENS = 8,
    OUTPUT_SYMBOL_TABLE = 16
} OutputFlags;
typedef struct Args {
    File* source_path;
    File* output_path;
    OutputFlags output_flags;
} Args;
static Args* parse_args(int argc, char* argv[]) {
    Args* args = (Args*)alloc_memory(sizeof(Args), 1);
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
            if (args->source_path == ((void*)0)) {
                args->source_path = create_file(create_string(argv[i], strlen(argv[i])));
            } else if (args->output_path == ((void*)0)) {
                args->output_path = create_file(create_string(argv[i], strlen(argv[i])));
            } else {
                fprintf(stderr, "[Error] Unexpected argument: %s\n", argv[i]);
            }
        }
    }
    if (args->source_path == ((void*)0)) {
        fprintf(stderr, "[Error] No source file provided\n");
        exit(1);
    } else if (args->output_path == ((void*)0)) {
        args->output_path = create_file(args->source_path->path);
    }
    return args;
}
int main(int argc, char* argv[]) {
    init();
    init_symbol();
    Args* args = parse_args(argc, argv);
    Lexer* lexer = ((void*)0);
    if (args->output_flags != OUTPUT_NONE) {
        lexer = create_lexer(args->source_path);
    }
    if (args->output_flags & OUTPUT_TOKENS) {
        Lexer* copy_lexer = (Lexer*)alloc_memory(sizeof(Lexer), 1);
        memcpy(copy_lexer, lexer, sizeof(Lexer));
        output_tokens(copy_lexer, args->output_path);
    }
    AST* ast = ((void*)0);
    if (args->output_flags & OUTPUT_AST) {
        Parser* parser = create_parser(lexer);
        ast = parse_code(parser);
        ast = analyzer(ast);
        if (ast != ((void*)0)) {
            list_append(parsed_files, (pointer)ast);
            FILE* ast_file = fopen(change_extension(args->output_path, ".ast"), "w");
            if (ast_file == ((void*)0)) {
                fprintf(stderr, "[Error] Failed to open AST output file\n");
                exit(1);
            }
            print_ast(ast, ast_file);
            fprintf(ast_file, "\n%s\n", get_info());
            fclose(ast_file);
        }
    }
    if (args->output_flags & OUTPUT_IR) {
    }
    if (args->output_flags & OUTPUT_RESULT) {
    }
    if (args->output_flags & OUTPUT_SYMBOL_TABLE) {
        FILE* sym_file = fopen(change_extension(args->output_path, ".sym"), "w");
        if (sym_file == ((void*)0)) {
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
    fprintf(out,
            "%*s"
            "{\n",
            ((int)0) * 4, "");
    for (List* _foreach_list = (ast->members); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (CodeMember* member = (CodeMember*)_node->data; member != ((void*)0); member = ((void*)0)) {
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
                        fprintf(out,
                                "%*s"
                                "error: \"Unknown code member type\"\n",
                                ((int)1) * 4, "");
                        break;
                }
            }
    fprintf(out,
            "%*s"
            "}\n",
            ((int)0) * 4, "");
}
void print_function(Function* function, FILE* out, size_t indent) {
    fprintf(out,
            "%*s"
            "function: {\n",
            ((int)indent) * 4, "");
    fprintf(out,
            "%*s"
            "name: {\n",
            ((int)indent + 1) * 4, "");
    print_symbol(function->name, out, indent + 2);
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    fprintf(out,
            "%*s"
            "return_type: %s(%zu)\n",
            ((int)indent + 1) * 4, "", function->type->name, function->type->id);
    fprintf(out,
            "%*s"
            "parameters: {\n",
            ((int)indent + 1) * 4, "");
    for (List* _foreach_list = (function->parameters); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Symbol* param = (Symbol*)_node->data; param != ((void*)0); param = ((void*)0)) {
                fprintf(out,
                        "%*s"
                        "{\n",
                        ((int)indent + 2) * 4, "");
                print_symbol(param, out, indent + 3);
                fprintf(out,
                        "%*s"
                        "}\n",
                        ((int)indent + 2) * 4, "");
            }
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    fprintf(out,
            "%*s"
            "body: {\n",
            ((int)indent + 1) * 4, "");
    for (List* _foreach_list = (function->body); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Statement* stmt = (Statement*)_node->data; stmt != ((void*)0); stmt = ((void*)0)) {
                print_statement(stmt, out, indent + 2);
            }
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent) * 4, "");
}
void print_class(Class* class, FILE* out, size_t indent) {
    fprintf(out,
            "%*s"
            "class: {\n",
            ((int)indent) * 4, "");
    fprintf(out,
            "%*s"
            "name: {\n",
            ((int)indent + 1) * 4, "");
    print_symbol(class->name, out, indent + 2);
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    for (List* _foreach_list = (class->members); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (ClassMember* member = (ClassMember*)_node->data; member != ((void*)0); member = ((void*)0)) {
                if (member->type == CLASS_METHOD) {
                    print_method(member->member.method, out, indent + 1);
                } else if (member->type == CLASS_ATTRIBUTE) {
                    print_variable(member->member.attribute, out, indent + 1);
                } else {
                    fprintf(out,
                            "%*s"
                            "error: \"Unknown class member type\"\n",
                            ((int)indent + 1) * 4, "");
                }
            }
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent) * 4, "");
}
void print_import(Import* import, FILE* out, size_t indent) {
    fprintf(out,
            "%*s"
            "import: {\n",
            ((int)indent) * 4, "");
    fprintf(out,
            "%*s"
            "name: {\n",
            ((int)indent + 1) * 4, "");
    print_symbol(import->name, out, indent + 2);
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    fprintf(out,
            "%*s"
            "path: \"%s\"\n",
            ((int)indent + 1) * 4, "", import->path);
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent) * 4, "");
}
void print_statement(Statement* statement, FILE* out, size_t indent) {
    switch (statement->type) {
        case STATEMENT_DECLARE:
            print_variable(statement->statement.declare, out, indent);
            break;
        case STATEMENT_DECLARE_LIST:
            fprintf(stderr, "[output Warning] at <print_statement>: Cannot exist declare list in statement. This should have been split into multiple declare statements in the parsing stage.\n");
            for (List* _foreach_list = (statement->statement.declare_list); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
                for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
                    for (Variable* var = (Variable*)_node->data; var != ((void*)0); var = ((void*)0)) {
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
            fprintf(out,
                    "%*s"
                    "break: null\n",
                    ((int)indent) * 4, "");
            break;
        case STATEMENT_CONTINUE:
            fprintf(out,
                    "%*s"
                    "continue: null\n",
                    ((int)indent) * 4, "");
            break;
        case STATEMENT_RETURN:
            if (statement->statement.return_ == ((void*)0)) {
                fprintf(out,
                        "%*s"
                        "return: null\n",
                        ((int)indent) * 4, "");
            } else {
                fprintf(out,
                        "%*s"
                        "return: {\n",
                        ((int)indent) * 4, "");
                print_expression(statement->statement.return_, out, indent + 1);
                fprintf(out,
                        "%*s"
                        "}\n",
                        ((int)indent) * 4, "");
            }
            break;
        case STATEMENT_EXPRESSION:
            fprintf(out,
                    "%*s"
                    "expression: {\n",
                    ((int)indent) * 4, "");
            print_expression(statement->statement.return_, out, indent + 1);
            fprintf(out,
                    "%*s"
                    "}\n",
                    ((int)indent) * 4, "");
            break;
        default:
            fprintf(out,
                    "%*s"
                    "error: \"Unknown statement type\"\n",
                    ((int)indent) * 4, "");
            break;
    }
}
void print_method(Method* method, FILE* out, size_t indent) {
    fprintf(out,
            "%*s"
            "method: {\n",
            ((int)indent) * 4, "");
    fprintf(out,
            "%*s"
            "name: {\n",
            ((int)indent + 1) * 4, "");
    print_symbol(method->name, out, indent + 2);
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    fprintf(out,
            "%*s"
            "return_type: %s(%zu)\n",
            ((int)indent + 1) * 4, "", method->type->name, method->type->id);
    fprintf(out,
            "%*s"
            "parameters: {\n",
            ((int)indent + 1) * 4, "");
    for (List* _foreach_list = (method->parameters); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Symbol* param = (Symbol*)_node->data; param != ((void*)0); param = ((void*)0)) {
                fprintf(out,
                        "%*s"
                        "{\n",
                        ((int)indent + 2) * 4, "");
                print_symbol(param, out, indent + 3);
                fprintf(out,
                        "%*s"
                        "}\n",
                        ((int)indent + 2) * 4, "");
            }
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    fprintf(out,
            "%*s"
            "body: {\n",
            ((int)indent + 1) * 4, "");
    for (List* _foreach_list = (method->body); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Statement* stmt = (Statement*)_node->data; stmt != ((void*)0); stmt = ((void*)0)) {
                print_statement(stmt, out, indent + 2);
            }
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent) * 4, "");
}
void print_if(If* if_, FILE* out, size_t indent) {
    fprintf(out,
            "%*s"
            "if: {\n",
            ((int)indent) * 4, "");
    fprintf(out,
            "%*s"
            "condition: {\n",
            ((int)indent + 1) * 4, "");
    print_expression(if_->condition, out, indent + 2);
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    fprintf(out,
            "%*s"
            "body: {\n",
            ((int)indent + 1) * 4, "");
    for (List* _foreach_list = (if_->body); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Statement* stmt0 = (Statement*)_node->data; stmt0 != ((void*)0); stmt0 = ((void*)0)) {
                print_statement(stmt0, out, indent + 2);
            }
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    fprintf(out,
            "%*s"
            "elif_list: {\n",
            ((int)indent + 1) * 4, "");
    for (List* _foreach_list = (if_->elif_list); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (If* elif = (If*)_node->data; elif != ((void*)0); elif = ((void*)0)) {
                fprintf(out,
                        "%*s"
                        "{\n",
                        ((int)indent + 2) * 4, "");
                fprintf(out,
                        "%*s"
                        "condition: {\n",
                        ((int)indent + 3) * 4, "");
                print_expression(elif->condition, out, indent + 4);
                fprintf(out,
                        "%*s"
                        "}\n",
                        ((int)indent + 3) * 4, "");
                fprintf(out,
                        "%*s"
                        "body: {\n",
                        ((int)indent + 3) * 4, "");
                for (List* _foreach_list = (elif->body); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
                    for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
                        for (Statement* stmt1 = (Statement*)_node->data; stmt1 != ((void*)0); stmt1 = ((void*)0)) {
                            print_statement(stmt1, out, indent + 4);
                        }
                fprintf(out,
                        "%*s"
                        "}\n",
                        ((int)indent + 3) * 4, "");
                fprintf(out,
                        "%*s"
                        "}\n",
                        ((int)indent + 2) * 4, "");
            }
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    fprintf(out,
            "%*s"
            "else_body: {\n",
            ((int)indent + 1) * 4, "");
    for (List* _foreach_list = (if_->else_body); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Statement* stmt2 = (Statement*)_node->data; stmt2 != ((void*)0); stmt2 = ((void*)0)) {
                print_statement(stmt2, out, indent + 2);
            }
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent) * 4, "");
}
void print_for(For* for_, FILE* out, size_t indent) {
    fprintf(out,
            "%*s"
            "for: {\n",
            ((int)indent) * 4, "");
    if (for_->init.decl != ((void*)0)) {
        fprintf(out,
                "%*s"
                "init: {\n",
                ((int)indent + 1) * 4, "");
        print_variable(for_->init.decl, out, indent + 2);
        fprintf(out,
                "%*s"
                "}\n",
                ((int)indent + 1) * 4, "");
    } else if (for_->init.expr != ((void*)0)) {
        fprintf(out,
                "%*s"
                "init: {\n",
                ((int)indent + 1) * 4, "");
        print_expression(for_->init.expr, out, indent + 2);
        fprintf(out,
                "%*s"
                "}\n",
                ((int)indent + 1) * 4, "");
    } else {
        fprintf(out,
                "%*s"
                "init: null\n",
                ((int)indent + 1) * 4, "");
    }
    if (for_->condition != ((void*)0)) {
        fprintf(out,
                "%*s"
                "condition: {\n",
                ((int)indent + 1) * 4, "");
        print_expression(for_->condition, out, indent + 2);
        fprintf(out,
                "%*s"
                "}\n",
                ((int)indent + 1) * 4, "");
    } else
        fprintf(out,
                "%*s"
                "condition: null\n",
                ((int)indent + 1) * 4, "");
    if (for_->increment != ((void*)0)) {
        fprintf(out,
                "%*s"
                "increment: {\n",
                ((int)indent + 1) * 4, "");
        print_expression(for_->increment, out, indent + 2);
        fprintf(out,
                "%*s"
                "}\n",
                ((int)indent + 1) * 4, "");
    } else {
        fprintf(out,
                "%*s"
                "increment: null\n",
                ((int)indent + 1) * 4, "");
    }
    fprintf(out,
            "%*s"
            "body: {\n",
            ((int)indent + 1) * 4, "");
    for (List* _foreach_list = (for_->body); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Statement* stmt = (Statement*)_node->data; stmt != ((void*)0); stmt = ((void*)0)) {
                print_statement(stmt, out, indent + 2);
            }
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent) * 4, "");
}
void print_while(While* while_, FILE* out, size_t indent) {
    fprintf(out,
            "%*s"
            "while: {\n",
            ((int)indent) * 4, "");
    fprintf(out,
            "%*s"
            "condition: {\n",
            ((int)indent + 1) * 4, "");
    print_expression(while_->condition, out, indent + 2);
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    fprintf(out,
            "%*s"
            "body: {\n",
            ((int)indent + 1) * 4, "");
    for (List* _foreach_list = (while_->body); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (Statement* stmt = (Statement*)_node->data; stmt != ((void*)0); stmt = ((void*)0)) {
                print_statement(stmt, out, indent + 2);
            }
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent) * 4, "");
}
void print_expression(Expression* expression, FILE* out, size_t indent) {
    if (expression->op == OP_NONE) {
        fprintf(out,
                "%*s"
                "primary: {\n",
                ((int)indent) * 4, "");
        print_primary(expression->left.unary, out, indent + 1);
        fprintf(out,
                "%*s"
                "}\n",
                ((int)indent) * 4, "");
    } else {
        fprintf(out,
                "%*s"
                "left: {\n",
                ((int)indent) * 4, "");
        print_expression(expression->left.binary, out, indent + 1);
        fprintf(out,
                "%*s"
                "}\n",
                ((int)indent) * 4, "");
        fprintf(out,
                "%*s"
                "operator: \"%s\"\n",
                ((int)indent) * 4, "", operator_string(expression->op));
        fprintf(out,
                "%*s"
                "right: {\n",
                ((int)indent) * 4, "");
        print_expression(expression->right, out, indent + 1);
        fprintf(out,
                "%*s"
                "}\n",
                ((int)indent) * 4, "");
    }
}
void print_variable(Variable* variable, FILE* out, size_t indent) {
    fprintf(out,
            "%*s"
            "variable: {\n",
            ((int)indent) * 4, "");
    fprintf(out,
            "%*s"
            "name: {\n",
            ((int)indent + 1) * 4, "");
    print_symbol(variable->var, out, indent + 2);
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent + 1) * 4, "");
    if (variable->initializer != ((void*)0)) {
        fprintf(out,
                "%*s"
                "initializer: {\n",
                ((int)indent + 1) * 4, "");
        print_expression(variable->initializer, out, indent + 2);
        fprintf(out,
                "%*s"
                "}\n",
                ((int)indent + 1) * 4, "");
    } else {
        fprintf(out,
                "%*s"
                "initializer: null\n",
                ((int)indent + 1) * 4, "");
    }
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent) * 4, "");
}
void print_primary(Primary* primary, FILE* out, size_t indent) {
    switch (primary->kind) {
        case PRIMARY_INT:
            fprintf(out,
                    "%*s"
                    "int literal: %s\n",
                    ((int)indent) * 4, "", primary->value.literal);
            break;
        case PRIMARY_FLOAT:
            fprintf(out,
                    "%*s"
                    "float literal: %s\n",
                    ((int)indent) * 4, "", primary->value.literal);
            break;
        case PRIMARY_STRING:
            fprintf(out,
                    "%*s"
                    "string literal: \"%s\"\n",
                    ((int)indent) * 4, "", primary->value.literal);
            break;
        case PRIMARY_BOOL:
            fprintf(out,
                    "%*s"
                    "bool literal: %s\n",
                    ((int)indent) * 4, "", primary->value.literal);
            break;
        case PRIMARY_NOT:
            fprintf(out,
                    "%*s"
                    "not: {\n",
                    ((int)indent) * 4, "");
            print_primary(primary->value.not, out, indent + 1);
            fprintf(out,
                    "%*s"
                    "}\n",
                    ((int)indent) * 4, "");
            break;
        case PRIMARY_NEG:
            fprintf(out,
                    "%*s"
                    "neg: {\n",
                    ((int)indent) * 4, "");
            print_primary(primary->value.neg, out, indent + 1);
            fprintf(out,
                    "%*s"
                    "}\n",
                    ((int)indent) * 4, "");
            break;
        case PRIMARY_EXPR:
            fprintf(out,
                    "%*s"
                    "exp: {\n",
                    ((int)indent) * 4, "");
            print_expression(primary->value.exp, out, indent + 1);
            fprintf(out,
                    "%*s"
                    "}\n",
                    ((int)indent) * 4, "");
            break;
        case PRIMARY_VAR_ACCESS:
            print_variable_access(primary->value.var_access, out, indent);
            break;
        default:
            fprintf(out,
                    "%*s"
                    "error: \"Unknown primary type\"\n",
                    ((int)indent) * 4, "");
            break;
    }
}
void print_variable_access(VariableAccess* variable_access, FILE* out, size_t indent) {
    if (variable_access->base != ((void*)0)) {
        fprintf(out,
                "%*s"
                "base: {\n",
                ((int)indent) * 4, "");
        print_variable_access(variable_access->base, out, indent + 1);
        fprintf(out,
                "%*s"
                "}\n",
                ((int)indent) * 4, "");
    }
    switch (variable_access->kind) {
        case VAR_ACCESS_VAR:
            fprintf(out,
                    "%*s"
                    "var: {\n",
                    ((int)indent) * 4, "");
            print_symbol(variable_access->access.var, out, indent + 1);
            fprintf(out,
                    "%*s"
                    "}\n",
                    ((int)indent) * 4, "");
            break;
        case VAR_ACCESS_CALL:
            fprintf(out,
                    "%*s"
                    "call: {\n",
                    ((int)indent) * 4, "");
            int arg_index = 0;
            for (List* _foreach_list = (variable_access->access.args); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
                for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
                    for (Expression* arg = (Expression*)_node->data; arg != ((void*)0); arg = ((void*)0)) {
                        fprintf(out,
                                "%*s"
                                "arg[%d]: {\n",
                                ((int)indent + 1) * 4, "", arg_index++);
                        print_expression(arg, out, indent + 2);
                        fprintf(out,
                                "%*s"
                                "}\n",
                                ((int)indent + 1) * 4, "");
                    }
            fprintf(out,
                    "%*s"
                    "}\n",
                    ((int)indent) * 4, "");
            break;
        case VAR_ACCESS_ATTRIBUTE:
            fprintf(out,
                    "%*s"
                    "attribute: {\n",
                    ((int)indent) * 4, "");
            print_symbol(variable_access->access.attribute, out, indent + 1);
            fprintf(out,
                    "%*s"
                    "}\n",
                    ((int)indent) * 4, "");
            break;
        case VAR_ACCESS_INDEX:
            fprintf(out,
                    "%*s"
                    "index: {\n",
                    ((int)indent) * 4, "");
            print_expression(variable_access->access.index, out, indent + 1);
            fprintf(out,
                    "%*s"
                    "}\n",
                    ((int)indent) * 4, "");
            break;
        default:
            fprintf(out,
                    "%*s"
                    "error: \"Unknown variable access type\"\n",
                    ((int)indent) * 4, "");
            break;
    }
}
void print_symbol(Symbol* symbol, FILE* out, size_t indent) {
    fprintf(out,
            "%*s"
            "name: \"%s(%zu)\"\n",
            ((int)indent) * 4, "", symbol->name, symbol->id);
    switch (symbol->kind) {
        case SYMBOL_TYPE:
            fprintf(out,
                    "%*s"
                    "kind: \"type\"\n",
                    ((int)indent) * 4, "");
            break;
        case SYMBOL_VARIABLE:
            fprintf(out,
                    "%*s"
                    "kind: \"variable\"\n",
                    ((int)indent) * 4, "");
            break;
        case SYMBOL_FUNCTION:
            fprintf(out,
                    "%*s"
                    "kind: \"function\"\n",
                    ((int)indent) * 4, "");
            break;
        case SYMBOL_CLASS:
            fprintf(out,
                    "%*s"
                    "kind: \"class\"\n",
                    ((int)indent) * 4, "");
            break;
        case SYMBOL_METHOD:
            fprintf(out,
                    "%*s"
                    "kind: \"method\"\n",
                    ((int)indent) * 4, "");
            break;
        case SYMBOL_ATTRIBUTE:
            fprintf(out,
                    "%*s"
                    "kind: \"attribute\"\n",
                    ((int)indent) * 4, "");
            break;
        case SYMBOL_PARAMETER:
            fprintf(out,
                    "%*s"
                    "kind: \"parameter\"\n",
                    ((int)indent) * 4, "");
            break;
        default:
            fprintf(out,
                    "%*s"
                    "kind: \"unknown\"\n",
                    ((int)indent) * 4, "");
            break;
    }
    if (symbol->type != ((void*)0)) {
        fprintf(out,
                "%*s"
                "type: \"%s(%zu)\"\n",
                ((int)indent) * 4, "", symbol->type->name, symbol->type->id);
    } else {
        fprintf(out,
                "%*s"
                "type: null\n",
                ((int)indent) * 4, "");
    }
    if (symbol->kind == SYMBOL_VARIABLE || symbol->kind == SYMBOL_PARAMETER || symbol->kind == SYMBOL_ATTRIBUTE) {
        fprintf(out,
                "%*s"
                "offset: %zu\n",
                ((int)indent) * 4, "", symbol->info.offset);
    } else {
        fprintf(out,
                "%*s"
                "offset: null\n",
                ((int)indent) * 4, "");
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
            fprintf(out,
                    "%*s"
                    "SymbolTable (type: global): {\n",
                    ((int)indent) * 4, "");
            break;
        case SYMBOL_TABLE_FUNCTION:
            fprintf(out,
                    "%*s"
                    "SymbolTable (type: function): {\n",
                    ((int)indent) * 4, "");
            break;
        case SYMBOL_TABLE_CLASS:
            fprintf(out,
                    "%*s"
                    "SymbolTable (type: class): {\n",
                    ((int)indent) * 4, "");
            break;
        case SYMBOL_TABLE_METHOD:
            fprintf(out,
                    "%*s"
                    "SymbolTable (type: method): {\n",
                    ((int)indent) * 4, "");
            break;
        case SYMBOL_TABLE_BLOCK:
            fprintf(out,
                    "%*s"
                    "SymbolTable (type: block): {\n",
                    ((int)indent) * 4, "");
            break;
        default:
            fprintf(out,
                    "%*s"
                    "SymbolTable (type: unknown): {\n",
                    ((int)indent) * 4, "");
            break;
    }
    if (!(table->symbols == ((void*)0) || table->symbols->head == ((void*)0))) {
        fprintf(out,
                "%*s"
                "symbols:\n",
                ((int)indent + 1) * 4, "");
        for (List* _foreach_list = (table->symbols); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
            for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
                for (Symbol* symbol = (Symbol*)_node->data; symbol != ((void*)0); symbol = ((void*)0)) {
                    fprintf(out,
                            "%*s"
                            "{\n",
                            ((int)indent + 1) * 4, "");
                    print_symbol(symbol, out, indent + 2);
                    fprintf(out,
                            "%*s"
                            "}\n",
                            ((int)indent + 1) * 4, "");
                }
    }
    if (!(table->children == ((void*)0) || table->children->head == ((void*)0))) {
        fprintf(out,
                "%*s"
                "sub-tables:\n",
                ((int)indent + 1) * 4, "");
        for (List* _foreach_list = (table->children); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
            for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
                for (SymbolTable* child = (SymbolTable*)_node->data; child != ((void*)0); child = ((void*)0)) {
                    print_symbol_table_recursive(child, out, indent + 1);
                }
    }
    fprintf(out,
            "%*s"
            "}\n",
            ((int)indent) * 4, "");
}
void print_symbol_table(SymbolTable* table, FILE* out) {
    print_symbol_table_recursive(table, out, 0);
}
Parser* create_parser(Lexer* lexer) {
    lexer->skip_comment = 1;
    Parser* parser = (Parser*)alloc_memory(sizeof(Parser), 1);
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
    AST* ast = (AST*)alloc_memory(sizeof(AST), 1);
    ast->members = list_create();
    ast->file = parser->file;
    Token* token = get_next_token(parser->lexer);
    ast->table = create_symbol_table(SYMBOL_TABLE_GLOBAL, global_symbol_table);
    while (token != ((void*)0) && token->type != TOKEN_EOF) {
        if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_IMPORT) {
            list_append(ast->members, (pointer)create_code_member(CODE_IMPORT, (pointer)parse_import(parser, ast->table, ast)));
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_CLASS) {
            list_append(ast->members, (pointer)create_code_member(CODE_CLASS, (pointer)parse_class(parser, ast->table)));
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_FUNC) {
            list_append(ast->members, (pointer)create_code_member(CODE_FUNCTION, (pointer)parse_function(parser, ast->table)));
        } else {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Unexpected token");
            output_one_token(token, stderr, 0);
        }
        token = get_next_token(parser->lexer);
    }
    return ast;
}
CodeMember* create_code_member(CodeMemberType type, pointer member) {
    CodeMember* code_member = (CodeMember*)alloc_memory(sizeof(CodeMember), 1);
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
            code_member->member.class = ((void*)0);
            break;
    }
    return code_member;
}
static Symbol* from_file_import(string name, string path) {
    File* file = create_file(path);
    AST* ast = ((void*)0);
    for (List* _foreach_list = (parsed_files); !(_foreach_list == ((void*)0) || _foreach_list->head == ((void*)0)); _foreach_list = ((void*)0))
        for (ListNode* _node = _foreach_list->head; _node != ((void*)0); _node = _node->next)
            for (AST* item = (AST*)_node->data; item != ((void*)0); item = ((void*)0)) {
                if (item != ((void*)0) && strcmp(file_full_path(item->file), file_full_path(file)) == 0) {
                    ast = item;
                    break;
                }
            }
    if (ast == ((void*)0)) {
        ast = parse_code(create_parser(create_lexer(file)));
        list_append(parsed_files, (pointer)ast);
    }
    return search_symbol(ast->table, name, 0, 0, ((void*)0));
}
Import* parse_import(Parser* parser, SymbolTable* table, AST* ast) {
    Import* import = (Import*)alloc_memory(sizeof(Import), 1);
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected identifier after 'import'");
        output_one_token(token, stderr, 0);
        return ((void*)0);
    }
    string name = token->lexeme;
    token = get_next_token(parser->lexer);
    if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_SEMICOLON) {
        import->path = file_full_path(create_file(string_splice("%s/%s.tc", "D:/TC/std/", name)));
    } else {
        if (token->type != TOKEN_KEYWORD || token->lexeme != KEYWORD_FROM) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected 'from' after import name");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_STRING) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected string literal after 'from'");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        import->path = file_full_path(create_file(string_splice("%s/%s", file_dir_path(parser->file), token->lexeme)));
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected ';' after import path");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
    }
    import->name = from_file_import(name, import->path);
    if (import->name == ((void*)0)) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Failed to import module");
        output_one_token(token, stderr, 0);
        import->name = create_symbol(name, ((void*)0), SYMBOL_VARIABLE, ((void*)0), table);
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
static List* parse_variable(Parser* parser, SymbolTable* table, SymbolType kind);
static ClassMember* create_class_member(ClassMemberType type, pointer member);
Class* parse_class(Parser* parser, SymbolTable* table) {
    Class* class = (Class*)alloc_memory(sizeof(Class), 1);
    parser->current_class = class;
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected identifier after 'class'");
        output_one_token(token, stderr, 0);
        parser->current_class = ((void*)0);
        return ((void*)0);
    }
    class->name = create_symbol(token->lexeme, ((void*)0), SYMBOL_CLASS, (pointer)class, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected '{' after class name");
        output_one_token(token, stderr, 0);
        parser->current_class = ((void*)0);
        return ((void*)0);
    }
    SymbolTable* class_table = create_symbol_table(SYMBOL_TABLE_CLASS, table);
    class->table = class_table;
    class->members = list_create();
    while (1) {
        token = get_next_token(parser->lexer);
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_R_BRACE) {
            break;
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_METHOD) {
            list_append(class->members, (pointer)create_class_member(CLASS_METHOD, (pointer)parse_method(parser, class_table)));
        } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_VAR) {
            List* vars = parse_variable(parser, class_table, SYMBOL_ATTRIBUTE);
            while (!(vars == ((void*)0) || vars->head == ((void*)0))) {
                list_append(class->members, (pointer)create_class_member(CLASS_ATTRIBUTE, list_pop_front(vars)));
            }
        } else {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Unexpected token in class body");
            output_one_token(token, stderr, 0);
        }
    }
    parser->current_class = ((void*)0);
    return class;
}
ClassMember* create_class_member(ClassMemberType type, pointer member) {
    ClassMember* class_member = (ClassMember*)alloc_memory(sizeof(ClassMember), 1);
    class_member->type = type;
    switch (type) {
        case CLASS_METHOD:
            class_member->member.method = (Method*)member;
            break;
        case CLASS_ATTRIBUTE:
            class_member->member.attribute = (Variable*)member;
            break;
        default:
            class_member->member.method = ((void*)0);
            break;
    }
    return class_member;
}
static Symbol* parse_type(Parser* parser, SymbolTable* table);
static Statement* parse_statement(Parser* parser, SymbolTable* table);
static _Bool parse_body(Parser* parser, SymbolTable* table, List* body);
Function* parse_function(Parser* parser, SymbolTable* table) {
    Function* function = (Function*)alloc_memory(sizeof(Function), 1);
    function->body = list_create();
    function->parameters = list_create();
    parser->current_function = function;
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && !(token->type == TOKEN_KEYWORD && (token->lexeme == KEYWORD_INT || token->lexeme == KEYWORD_FLOAT || token->lexeme == KEYWORD_STRING || token->lexeme == KEYWORD_BOOL || token->lexeme == KEYWORD_VOID || token->lexeme == KEYWORD_POINTER || token->lexeme == KEYWORD_CONST))) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected identifier or type after 'func'");
        output_one_token(token, stderr, 0);
        parser->current_function = ((void*)0);
        return ((void*)0);
    }
    function->type = parse_type(parser, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected identifier after function return type");
        output_one_token(token, stderr, 0);
        parser->current_function = ((void*)0);
        return ((void*)0);
    }
    function->name = create_symbol(token->lexeme, function->type, SYMBOL_FUNCTION, (pointer)function, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected '(' after function name");
        output_one_token(token, stderr, 0);
        parser->current_function = ((void*)0);
        return ((void*)0);
    }
    token = get_next_token(parser->lexer);
    SymbolTable* function_table = create_symbol_table(SYMBOL_TABLE_FUNCTION, table);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        if (token->type != TOKEN_IDENTIFIER && !(token->type == TOKEN_KEYWORD && (token->lexeme == KEYWORD_INT || token->lexeme == KEYWORD_FLOAT || token->lexeme == KEYWORD_STRING || token->lexeme == KEYWORD_BOOL || token->lexeme == KEYWORD_VOID || token->lexeme == KEYWORD_POINTER || token->lexeme == KEYWORD_CONST))) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Unexpected token in parameter list");
            output_one_token(token, stderr, 0);
            parser->current_function = ((void*)0);
            return ((void*)0);
        }
        Symbol* param_type = parse_type(parser, table);
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_IDENTIFIER) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected identifier in parameter list");
            output_one_token(token, stderr, 0);
            parser->current_function = ((void*)0);
            return ((void*)0);
        }
        list_append(function->parameters, (pointer)create_symbol(token->lexeme, param_type, SYMBOL_PARAMETER, ((void*)0), function_table));
        token = get_next_token(parser->lexer);
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_COMMA) {
            token = get_next_token(parser->lexer);
        } else if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected ',' or ')' in parameter list");
            output_one_token(token, stderr, 0);
            parser->current_function = ((void*)0);
            return ((void*)0);
        }
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected '{' to start function body");
        output_one_token(token, stderr, 0);
        parser->current_function = ((void*)0);
        return ((void*)0);
    }
    SymbolTable* block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, function_table);
    _Bool result = parse_body(parser, block_table, function->body);
    parser->current_function = ((void*)0);
    if (!result) return ((void*)0);
    return function;
}
Method* parse_method(Parser* parser, SymbolTable* table) {
    Method* method = (Method*)alloc_memory(sizeof(Method), 1);
    method->body = list_create();
    method->parameters = list_create();
    parser->current_method = method;
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && !(token->type == TOKEN_KEYWORD && (token->lexeme == KEYWORD_INT || token->lexeme == KEYWORD_FLOAT || token->lexeme == KEYWORD_STRING || token->lexeme == KEYWORD_BOOL || token->lexeme == KEYWORD_VOID || token->lexeme == KEYWORD_POINTER || token->lexeme == KEYWORD_CONST))) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected identifier or type after 'method'");
        output_one_token(token, stderr, 0);
        parser->current_method = ((void*)0);
        return ((void*)0);
    }
    method->type = parse_type(parser, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && token->type != TOKEN_SPECIAL) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected identifier after method return type");
        output_one_token(token, stderr, 0);
        parser->current_method = ((void*)0);
        return ((void*)0);
    }
    method->name = create_symbol(token->lexeme, method->type, SYMBOL_METHOD, (pointer)method, table);
    if (token->type == TOKEN_SPECIAL) {
        if (!is_special(token->lexeme)) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Invalid special method");
            output_one_token(token, stderr, 0);
            parser->current_method = ((void*)0);
            return ((void*)0);
        }
        method->special = 1;
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected '(' after method name");
        output_one_token(token, stderr, 0);
        parser->current_method = ((void*)0);
        return ((void*)0);
    }
    token = get_next_token(parser->lexer);
    SymbolTable* method_table = create_symbol_table(SYMBOL_TABLE_METHOD, table);
    if (token->type != TOKEN_KEYWORD || token->lexeme != KEYWORD_SELF) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected 'self' as the first parameter");
        output_one_token(token, stderr, 0);
        parser->current_method = ((void*)0);
        return ((void*)0);
    }
    list_append(method->parameters, (pointer)create_symbol(KEYWORD_SELF, parser->current_class->name, SYMBOL_PARAMETER, ((void*)0), method_table));
    token = get_next_token(parser->lexer);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_COMMA) {
            token = get_next_token(parser->lexer);
        } else if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected ',' or ')' in parameter list");
            output_one_token(token, stderr, 0);
            parser->current_method = ((void*)0);
            return ((void*)0);
        }
        if (token->type != TOKEN_IDENTIFIER && !(token->type == TOKEN_KEYWORD && (token->lexeme == KEYWORD_INT || token->lexeme == KEYWORD_FLOAT || token->lexeme == KEYWORD_STRING || token->lexeme == KEYWORD_BOOL || token->lexeme == KEYWORD_VOID || token->lexeme == KEYWORD_POINTER || token->lexeme == KEYWORD_CONST))) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Unexpected token in parameter list");
            output_one_token(token, stderr, 0);
            parser->current_method = ((void*)0);
            return ((void*)0);
        }
        Symbol* param_type = parse_type(parser, table);
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_IDENTIFIER) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected identifier in parameter list");
            output_one_token(token, stderr, 0);
            parser->current_method = ((void*)0);
            return ((void*)0);
        }
        list_append(method->parameters, (pointer)create_symbol(token->lexeme, param_type, SYMBOL_PARAMETER, ((void*)0), method_table));
        token = get_next_token(parser->lexer);
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected '{' to start method body");
        output_one_token(token, stderr, 0);
        parser->current_method = ((void*)0);
        return ((void*)0);
    }
    SymbolTable* block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, method_table);
    _Bool result = parse_body(parser, block_table, method->body);
    parser->current_method = ((void*)0);
    if (!result) return ((void*)0);
    return method;
}
static Expression* parse_expression_prec(Parser* parser, int min_precedence, SymbolTable* table);
List* parse_variable(Parser* parser, SymbolTable* table, SymbolType kind) {
    ((void)(kind == SYMBOL_VARIABLE || kind == SYMBOL_ATTRIBUTE));
    List* vars = list_create();
    Token* token = get_current_token(parser->lexer);
    if (token->type != TOKEN_KEYWORD || token->lexeme != KEYWORD_VAR) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected 'var' at the beginning of variable declaration");
        output_one_token(token, stderr, 0);
        return vars;
    }
    get_next_token(parser->lexer);
    Symbol* type = parse_type(parser, table);
    while ((token = get_next_token(parser->lexer))->type == TOKEN_IDENTIFIER) {
        Variable* var = (Variable*)alloc_memory(sizeof(Variable), 1);
        var->var = create_symbol(token->lexeme, type, kind, ((void*)0), table);
        token = get_next_token(parser->lexer);
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_ASSIGN) {
            get_next_token(parser->lexer);
            var->initializer = parse_expression_prec(parser, 1, table);
            list_append(vars, (pointer)var);
            token = get_next_token(parser->lexer);
        }
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_COMMA) {
            continue;
        } else if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_SEMICOLON) {
            break;
        } else {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected ',' or ';' after variable declaration");
            output_one_token(token, stderr, 0);
            break;
        }
    }
    return vars;
}
Symbol* parse_type(Parser* parser, SymbolTable* table) {
    Symbol* type;
    Token* token = get_current_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && !(token->type == TOKEN_KEYWORD && (token->lexeme == KEYWORD_INT || token->lexeme == KEYWORD_FLOAT || token->lexeme == KEYWORD_STRING || token->lexeme == KEYWORD_BOOL || token->lexeme == KEYWORD_VOID || token->lexeme == KEYWORD_POINTER || token->lexeme == KEYWORD_CONST))) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected type");
        output_one_token(token, stderr, 0);
        return ((void*)0);
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
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Unknown built-in type");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
    } else if (token->type == TOKEN_IDENTIFIER) {
        type = search_symbol(table, token->lexeme, 1, SYMBOL_CLASS, ((void*)0));
    } else {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Unexpected token when parsing type");
        output_one_token(token, stderr, 0);
        return ((void*)0);
    }
    token = peek_next_token(parser->lexer);
    if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_LT) {
        get_next_token(parser->lexer);
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_IDENTIFIER && !(token->type == TOKEN_KEYWORD && (token->lexeme == KEYWORD_INT || token->lexeme == KEYWORD_FLOAT || token->lexeme == KEYWORD_STRING || token->lexeme == KEYWORD_BOOL || token->lexeme == KEYWORD_VOID || token->lexeme == KEYWORD_POINTER || token->lexeme == KEYWORD_CONST))) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected type in container type");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        Symbol* element_type = parse_type(parser, table);
        if (element_type == ((void*)0)) {
            return ((void*)0);
        }
        type->type = element_type;
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_GT) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected '>' after container type");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
    }
    return type;
}
static If* parse_if(Parser* parser, SymbolTable* table);
static For* parse_for(Parser* parser, SymbolTable* table);
static While* parse_while(Parser* parser, SymbolTable* table);
Statement* parse_statement(Parser* parser, SymbolTable* table) {
    Statement* stmt = (Statement*)alloc_memory(sizeof(Statement), 1);
    Token* token = get_current_token(parser->lexer);
    _Bool check_semicolon = 1;
    if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_IF) {
        stmt->type = STATEMENT_IF;
        stmt->statement.if_ = parse_if(parser, table);
        check_semicolon = 0;
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_FOR) {
        stmt->type = STATEMENT_FOR;
        stmt->statement.for_ = parse_for(parser, table);
        check_semicolon = 0;
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_WHILE) {
        stmt->type = STATEMENT_WHILE;
        stmt->statement.while_ = parse_while(parser, table);
        check_semicolon = 0;
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_RETURN) {
        stmt->type = STATEMENT_RETURN;
        token = get_next_token(parser->lexer);
        if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_SEMICOLON) {
            stmt->statement.return_ = ((void*)0);
            check_semicolon = 0;
        } else {
            stmt->statement.return_ = parse_expression_prec(parser, 1, table);
        }
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_BREAK) {
        stmt->type = STATEMENT_BREAK;
        stmt->statement.break_ = ((void*)0);
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_CONTINUE) {
        stmt->type = STATEMENT_CONTINUE;
        stmt->statement.continue_ = ((void*)0);
    } else if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_VAR) {
        stmt->type = STATEMENT_DECLARE_LIST;
        stmt->statement.declare_list = parse_variable(parser, table, SYMBOL_VARIABLE);
        check_semicolon = 0;
    } else {
        stmt->type = STATEMENT_EXPRESSION;
        stmt->statement.expression = parse_expression_prec(parser, 1, table);
    }
    if (check_semicolon) {
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected ';' after statement");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
    }
    return stmt;
}
If* parse_if(Parser* parser, SymbolTable* table) {
    If* if_ = (If*)alloc_memory(sizeof(If), 1);
    if_->body = list_create();
    if_->elif_list = list_create();
    if_->else_body = list_create();
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected '(' after 'if'");
        output_one_token(token, stderr, 0);
        return ((void*)0);
    }
    get_next_token(parser->lexer);
    if_->condition = parse_expression_prec(parser, 1, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected ')' after if condition");
        output_one_token(token, stderr, 0);
        return ((void*)0);
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected '{' to start if body");
        output_one_token(token, stderr, 0);
        return ((void*)0);
    }
    SymbolTable* block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, table);
    _Bool result = parse_body(parser, block_table, if_->body);
    if (!result) return ((void*)0);
    token = peek_next_token(parser->lexer);
    while (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_ELIF) {
        If* elif = (If*)alloc_memory(sizeof(If), 1);
        elif->body = list_create();
        elif->elif_list = ((void*)0);
        elif->else_body = ((void*)0);
        get_next_token(parser->lexer);
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected '(' after 'elif'");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        elif->condition = parse_expression_prec(parser, 1, table);
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected ')' after elif condition");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected '{' to start elif body");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        SymbolTable* elif_block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, table);
        result = parse_body(parser, elif_block_table, elif->body);
        if (!result) return ((void*)0);
        list_append(if_->elif_list, (pointer)elif);
        token = peek_next_token(parser->lexer);
    }
    if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_ELSE) {
        get_next_token(parser->lexer);
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected '{' to start else body");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        SymbolTable* else_block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, table);
        result = parse_body(parser, else_block_table, if_->else_body);
        if (!result) return ((void*)0);
    }
    return if_;
}
For* parse_for(Parser* parser, SymbolTable* table) {
    For* for_ = (For*)alloc_memory(sizeof(For), 1);
    for_->init.decl = ((void*)0);
    for_->body = list_create();
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected '(' after 'for'");
        output_one_token(token, stderr, 0);
        return ((void*)0);
    }
    token = get_next_token(parser->lexer);
    SymbolTable* for_table = create_symbol_table(SYMBOL_TABLE_BLOCK, table);
    if (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_VAR) {
        List* vars = parse_variable(parser, for_table, SYMBOL_VARIABLE);
        if (vars == ((void*)0) || vars->head == ((void*)0) || vars->head != vars->tail) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected exactly one variable declaration in for loop initializer");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        for_->init.decl = (Variable*)vars->head->data;
        for_->is_decl = 1;
        token = get_next_token(parser->lexer);
    } else if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
        for_->init.expr = parse_expression_prec(parser, 1, for_table);
        if (for_->init.expr == ((void*)0)) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected expression in for loop initializer");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        for_->is_decl = 0;
        token = get_next_token(parser->lexer);
    }
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
        for_->condition = parse_expression_prec(parser, 1, for_table);
        if (for_->condition == ((void*)0)) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected expression in for loop condition");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        token = get_next_token(parser->lexer);
    }
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_SEMICOLON) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected ';' after for loop condition");
        output_one_token(token, stderr, 0);
        return ((void*)0);
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        for_->increment = parse_expression_prec(parser, 1, for_table);
        if (for_->increment == ((void*)0)) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected expression in for loop increment");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        token = get_next_token(parser->lexer);
    }
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected ')' after for loop increment");
        output_one_token(token, stderr, 0);
        return ((void*)0);
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected '{' to start for loop body");
        output_one_token(token, stderr, 0);
        return ((void*)0);
    }
    SymbolTable* block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, for_table);
    _Bool result = parse_body(parser, block_table, for_->body);
    if (!result) return ((void*)0);
    return for_;
}
While* parse_while(Parser* parser, SymbolTable* table) {
    While* while_ = (While*)alloc_memory(sizeof(While), 1);
    while_->body = list_create();
    Token* token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_PAREN) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected '(' after 'while'");
        output_one_token(token, stderr, 0);
        return ((void*)0);
    }
    get_next_token(parser->lexer);
    while_->condition = parse_expression_prec(parser, 1, table);
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected ')' after while condition");
        output_one_token(token, stderr, 0);
        return ((void*)0);
    }
    token = get_next_token(parser->lexer);
    if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_L_BRACE) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected '{' to start while body");
        output_one_token(token, stderr, 0);
        return ((void*)0);
    }
    SymbolTable* block_table = create_symbol_table(SYMBOL_TABLE_BLOCK, table);
    _Bool result = parse_body(parser, block_table, while_->body);
    if (!result) return ((void*)0);
    return while_;
}
static Primary* parse_primary(Parser* parser, SymbolTable* table);
static int operator_precedence(OperatorType op) {
    switch (op) {
        case OP_ASSIGN:
        case OP_ADD_ASSIGN:
        case OP_SUB_ASSIGN:
        case OP_MUL_ASSIGN:
        case OP_DIV_ASSIGN:
        case OP_MOD_ASSIGN:
            return 1;
        case OP_AND:
        case OP_OR:
            return 2;
        case OP_EQ:
        case OP_NE:
        case OP_LT:
        case OP_GT:
        case OP_LE:
        case OP_GE:
            return 3;
        case OP_ADD:
        case OP_SUB:
            return 4;
        case OP_MUL:
        case OP_DIV:
        case OP_MOD:
            return 5;
        case OP_NOT:
        case OP_NEG:
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
Expression* parse_expression_prec(Parser* parser, int minp, SymbolTable* table) {
    Expression* left = (Expression*)alloc_memory(sizeof(Expression), 1);
    left->type = ((void*)0);
    left->left.unary = parse_primary(parser, table);
    if (left->left.unary == ((void*)0)) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), get_current_token(parser->lexer)->line + 1, get_current_token(parser->lexer)->column + 1, "Expected expression");
        output_one_token(get_current_token(parser->lexer), stderr, 0);
        return ((void*)0);
    }
    left->right = ((void*)0);
    left->op = OP_NONE;
    OperatorType op = OP_NONE;
    int p = 0;
    Token* token = peek_next_token(parser->lexer);
    while (token->type == TOKEN_SYMBOL && (op = operator(token->lexeme)) != OP_NONE && (p = operator_precedence(op)) >= minp) {
        get_next_token(parser->lexer);
        token = get_next_token(parser->lexer);
        Expression* expr = (Expression*)alloc_memory(sizeof(Expression), 1);
        expr->type = ((void*)0);
        expr->right = parse_expression_prec(parser, p + ((op == OP_ASSIGN || op == OP_ADD_ASSIGN || op == OP_SUB_ASSIGN || op == OP_MUL_ASSIGN || op == OP_DIV_ASSIGN || op == OP_MOD_ASSIGN) ? 0 : 1), table);
        if (expr->right == ((void*)0)) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected expression after operator");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        expr->left.binary = left;
        expr->op = op;
        left = expr;
        token = peek_next_token(parser->lexer);
    }
    return left;
}
static VariableAccess* parse_variable_access(Parser* parser, SymbolTable* table);
Primary* parse_primary(Parser* parser, SymbolTable* table) {
    Primary* primary = (Primary*)alloc_memory(sizeof(Primary), 1);
    primary->type = ((void*)0);
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
        get_next_token(parser->lexer);
        primary->value.not = parse_primary(parser, table);
        if (primary->value.not == ((void*)0)) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected expression after '!'");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        primary->kind = PRIMARY_NOT;
    } else if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_SUB) {
        get_next_token(parser->lexer);
        primary->value.neg = parse_primary(parser, table);
        if (primary->value.neg == ((void*)0)) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected expression after '-'");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        primary->kind = PRIMARY_NEG;
    } else if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_L_PAREN) {
        get_next_token(parser->lexer);
        primary->value.exp = parse_expression_prec(parser, 1, table);
        if (primary->value.exp == ((void*)0)) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected expression after '('");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        token = get_next_token(parser->lexer);
        if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected ')' after expression");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
    } else if (token->type == TOKEN_IDENTIFIER || (token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_SELF)) {
        primary->value.var_access = parse_variable_access(parser, table);
        if (primary->value.var_access == ((void*)0)) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected variable access");
            output_one_token(token, stderr, 0);
            return ((void*)0);
        }
        primary->kind = PRIMARY_VAR_ACCESS;
    } else {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Unexpected token in expression");
        output_one_token(token, stderr, 0);
        return ((void*)0);
    }
    return primary;
}
VariableAccess* parse_variable_access(Parser* parser, SymbolTable* table) {
    VariableAccess* var = (VariableAccess*)alloc_memory(sizeof(VariableAccess), 1);
    var->type = ((void*)0);
    var->base = ((void*)0);
    Token* token = get_current_token(parser->lexer);
    if (token->type != TOKEN_IDENTIFIER && !(token->type == TOKEN_KEYWORD && token->lexeme == KEYWORD_SELF)) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected identifier or 'self' in variable access");
        output_one_token(token, stderr, 0);
        return ((void*)0);
    }
    var->access.var = search_symbol(table, token->lexeme, 0, 0, ((void*)0));
    if (var->access.var == ((void*)0)) {
        fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Undefined variable");
        output_one_token(token, stderr, 0);
        return ((void*)0);
    }
    var->kind = VAR_ACCESS_VAR;
    token = peek_next_token(parser->lexer);
    while (token->type == TOKEN_SYMBOL && (token->lexeme == SYMBOL_DOT || token->lexeme == SYMBOL_L_BRACKET || token->lexeme == SYMBOL_L_PAREN)) {
        VariableAccess* access = (VariableAccess*)alloc_memory(sizeof(VariableAccess), 1);
        access->type = ((void*)0);
        access->base = var;
        if (token->lexeme == SYMBOL_DOT) {
            access->kind = VAR_ACCESS_ATTRIBUTE;
            get_next_token(parser->lexer);
            token = get_next_token(parser->lexer);
            if (token->type != TOKEN_IDENTIFIER) {
                fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected identifier after '.'");
                output_one_token(token, stderr, 0);
                return ((void*)0);
            }
            Symbol* type = access->base->access.var->type;
            if (type == ((void*)0) || type->kind != SYMBOL_CLASS) {
                fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Cannot access attribute of non-class type");
                output_one_token(token, stderr, 0);
                return ((void*)0);
            }
            access->access.attribute = search_symbol(type->info.class->table, token->lexeme, 0, 0, ((void*)0));
            if (access->access.attribute == ((void*)0)) {
                fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Undefined attribute");
                output_one_token(token, stderr, 0);
                return ((void*)0);
            }
        } else if (token->lexeme == SYMBOL_L_BRACKET) {
            access->kind = VAR_ACCESS_INDEX;
            get_next_token(parser->lexer);
            get_next_token(parser->lexer);
            access->access.index = parse_expression_prec(parser, 1, table);
            if (access->access.index == ((void*)0)) {
                fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected expression in index access");
                output_one_token(token, stderr, 0);
                return ((void*)0);
            }
            token = get_next_token(parser->lexer);
            if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_BRACKET) {
                fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected ']' after index expression");
                output_one_token(token, stderr, 0);
                return ((void*)0);
            }
        } else if (token->lexeme == SYMBOL_L_PAREN) {
            access->kind = VAR_ACCESS_CALL;
            access->access.args = list_create();
            get_next_token(parser->lexer);
            token = get_next_token(parser->lexer);
            while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
                Expression* arg = parse_expression_prec(parser, 1, table);
                if (arg == ((void*)0)) {
                    fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected expression in function call");
                    output_one_token(token, stderr, 0);
                    return ((void*)0);
                }
                list_append(access->access.args, (pointer)arg);
                token = get_next_token(parser->lexer);
                if (token->type == TOKEN_SYMBOL && token->lexeme == SYMBOL_COMMA) {
                    token = get_next_token(parser->lexer);
                } else if (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_PAREN) {
                    fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Expected ',' or ')' in function call");
                    output_one_token(token, stderr, 0);
                    return ((void*)0);
                }
            }
        }
        var = access;
        token = peek_next_token(parser->lexer);
    }
    return var;
}
_Bool parse_body(Parser* parser, SymbolTable* table, List* body) {
    Token* token = get_next_token(parser->lexer);
    while (token->type != TOKEN_SYMBOL || token->lexeme != SYMBOL_R_BRACE) {
        Statement* stmt = parse_statement(parser, table);
        if (stmt == ((void*)0)) {
            fprintf(stderr, "[parser Error] at %s:%zu:%zu: %s, ", file_full_path(parser->file), token->line + 1, token->column + 1, "Unexpected token in body");
            output_one_token(token, stderr, 0);
            return 0;
        }
        if (stmt->type == STATEMENT_DECLARE_LIST) {
            List* vars = stmt->statement.declare_list;
            while (!(vars == ((void*)0) || vars->head == ((void*)0))) {
                Variable* var = (Variable*)list_pop_front(vars);
                Statement* decl_stmt = (Statement*)alloc_memory(sizeof(Statement), 1);
                decl_stmt->type = STATEMENT_DECLARE;
                decl_stmt->statement.declare = var;
                list_append(body, (pointer)decl_stmt);
            }
        } else {
            list_append(body, (pointer)stmt);
        }
        token = get_next_token(parser->lexer);
    }
    return 1;
}
Symbol* create_symbol(string name, Symbol* type, SymbolType kind, pointer info, SymbolTable* table) {
    static size_t symbol_count = 0;
    Symbol* symbol = search_symbol(table, name, 1, kind, type);
    if (symbol != ((void*)0)) {
        if (symbol->kind == kind && symbol->type == type) {
            return symbol;
        } else if (symbol->table == table) {
            fprintf(stderr, "[symbol_table Error] at <create_symbol> Symbol '%s' already exists in the current scope\n", name);
            return ((void*)0);
        } else {
            fprintf(stderr, "[symbol_table Warning] at <create_symbol> Symbol '%s' already exists in an outer scope, but with a different type or kind. Creating a new symbol in the current scope.\n", name);
        }
    }
    symbol = (Symbol*)alloc_memory(sizeof(Symbol), 1);
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
    if (table != ((void*)0))
        list_append(table->symbols, (pointer)symbol);
    return symbol;
}
SymbolTable* create_symbol_table(SymbolTableType type, SymbolTable* parent) {
    SymbolTable* table = (SymbolTable*)alloc_memory(sizeof(SymbolTable), 1);
    table->parent = parent;
    table->type = type;
    table->symbols = list_create();
    table->children = list_create();
    if (parent != ((void*)0))
        list_append(parent->children, (pointer)table);
    return table;
}
void init_symbol(void) {
    global_symbol_table = create_symbol_table(SYMBOL_TABLE_GLOBAL, ((void*)0));
    symbol_int = create_symbol(KEYWORD_INT, ((void*)0), SYMBOL_TYPE, (pointer)4, global_symbol_table);
    symbol_float = create_symbol(KEYWORD_FLOAT, ((void*)0), SYMBOL_TYPE, (pointer)4, global_symbol_table);
    symbol_string = create_symbol(KEYWORD_STRING, ((void*)0), SYMBOL_TYPE, (pointer)4, global_symbol_table);
    symbol_bool = create_symbol(KEYWORD_BOOL, ((void*)0), SYMBOL_TYPE, (pointer)1, global_symbol_table);
    symbol_void = create_symbol(KEYWORD_VOID, ((void*)0), SYMBOL_TYPE, (pointer)1, global_symbol_table);
    symbol_pointer = create_symbol(KEYWORD_POINTER, ((void*)0), SYMBOL_TYPE, (pointer)4, global_symbol_table);
    symbol_const = create_symbol(KEYWORD_CONST, ((void*)0), SYMBOL_TYPE, (pointer)4, global_symbol_table);
}
Symbol* search_symbol(SymbolTable* table, string name, _Bool compare_kind, SymbolType compare_kind_value, Symbol* compare_type) {
    for (int stage = 0; stage < 3; stage++) {
        for (SymbolTable* current = table; current != ((void*)0); current = current->parent) {
            for (ListNode* node = current->symbols->head; node != ((void*)0); node = node->next) {
                Symbol* symbol = (Symbol*)node->data;
                if (symbol->name != name) continue;
                _Bool match = 0;
                switch (stage) {
                    case 0:
                        match = (!compare_kind || symbol->kind == compare_kind_value) && (compare_type == ((void*)0) || symbol->type == compare_type);
                        break;
                    case 1:
                        match = (compare_type == ((void*)0) || symbol->type == compare_type);
                        break;
                    case 2:
                        match = 1;
                        break;
                    default:
                        break;
                }
                if (match) return symbol;
            }
        }
        if (stage == 0 && !compare_kind && compare_type == ((void*)0))
            break;
        if (stage == 1 && compare_type == ((void*)0))
            break;
    }
    return ((void*)0);
}
