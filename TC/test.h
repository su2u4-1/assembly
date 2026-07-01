#define assert(expr) ((void)(expr))
#define bool _Bool
#define true 1
#define false 0
typedef struct stdio_file_handle FILE;
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
#define va_start(ap, last) __builtin_va_start(ap, last)
#define va_end(ap) __builtin_va_end(ap)
#define va_arg(ap, type) __builtin_va_arg(ap, type)
int vsnprintf(char* str, size_t size, const char* format, va_list ap);
void abort(void) __attribute__((noreturn));
void* malloc(size_t Size);
void* calloc(size_t NumOfElements, size_t SizeOfElements);
void free(void* Memory);
#define NULL ((void*)0)
int strcmp(const char* a, const char* b);
void* memcpy(void* a, const void* b, size_t c);
int strncmp(const char* a, const char* b, size_t c);
void* memset(void* a, int, size_t b);
size_t strlen(const char* a);
#define SEEK_END 2
#define SEEK_SET 0
void exit(int) __attribute__((noreturn));

// TODO: let std_path be determined by the environment
#if defined(_WIN32) || defined(_WIN64) || defined(__CYGWIN__)
#ifdef _MSC_VER
#define PLATFORM 1  // MSVC
#define std_path "D:/TC/std/"
#else
#define PLATFORM 2  // MinGW
#define std_path "D:/TC/std/"
#endif
#elif defined(__linux__) || defined(__gnu_linux__)
#define PLATFORM 3  // LINUX
#define std_path "/home/su2u4/code/TC/std/"
#elif defined(__APPLE__) && defined(__MACH__)
#define PLATFORM 4  // MACOS
#define std_path "NOT SUPPORTED"
#else
#define PLATFORM 0  // UNKNOWN
#define std_path "NOT SUPPORTED"
#endif

// TODO: let pointer_size be determined by the environment
#define pointer_size 4

#if PLATFORM == 1
char* _getcwd(char*, int);
#elif PLATFORM == 2 || PLATFORM == 3 || PLATFORM == 4
char* getcwd(char*, int);
#endif

typedef char* string;
typedef size_t* pointer;

#define DEFAULT_MEMORY_SIZE 1024
#define ALIGN_SIZE ((size_t)__SIZEOF_POINTER__)

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
#define create_struct(T) (T*)alloc_memory(sizeof(T), true)
string create_string(const char* str, size_t len);
pointer alloc_memory(size_t size, bool is_struct);
#if defined(__clang__)
__attribute__((format(printf, 1, 2)))
#elif defined(__GNUC__)
__attribute__((format(gnu_printf, 1, 2)))
#endif
string string_splice(string format, ...);
string get_info(void);

#define keywordCount 24
#define symbolCount 30
#define specialCount 20
extern string keywordList[keywordCount];
extern string symbolList[symbolCount];
extern string specialList[specialCount];

extern string KEYWORD_IMPORT;     // keyword `import`
extern string KEYWORD_FROM;       // keyword `from`
extern string KEYWORD_FUNC;       // keyword `func`
extern string KEYWORD_CLASS;      // keyword `class`
extern string KEYWORD_METHOD;     // keyword `method`
extern string KEYWORD_SELF;       // keyword `self`
extern string KEYWORD_IF;         // keyword `if`
extern string KEYWORD_ELIF;       // keyword `elif`
extern string KEYWORD_ELSE;       // keyword `else`
extern string KEYWORD_WHILE;      // keyword `while`
extern string KEYWORD_FOR;        // keyword `for`
extern string KEYWORD_TRUE;       // keyword `true`
extern string KEYWORD_FALSE;      // keyword `false`
extern string KEYWORD_RETURN;     // keyword `return`
extern string KEYWORD_BREAK;      // keyword `break`
extern string KEYWORD_CONTINUE;   // keyword `continue`
extern string KEYWORD_INT;        // keyword `int`
extern string KEYWORD_FLOAT;      // keyword `float`
extern string KEYWORD_STRING;     // keyword `string`
extern string KEYWORD_BOOL;       // keyword `bool`
extern string KEYWORD_VOID;       // keyword `void`
extern string KEYWORD_VAR;        // keyword `var`
extern string KEYWORD_POINTER;    // keyword `pointer`
extern string KEYWORD_CONST;      // keyword `const`
extern string SYMBOL_L_PAREN;     // symbol `(`
extern string SYMBOL_R_PAREN;     // symbol `)`
extern string SYMBOL_L_BRACE;     // symbol `{`
extern string SYMBOL_R_BRACE;     // symbol `}`
extern string SYMBOL_COMMA;       // symbol `,`
extern string SYMBOL_NOT;         // symbol `!`
extern string SYMBOL_DOT;         // symbol `.`
extern string SYMBOL_L_BRACKET;   // symbol `[`
extern string SYMBOL_R_BRACKET;   // symbol `]`
extern string SYMBOL_SEMICOLON;   // symbol `;`
extern string SYMBOL_UNDERLINE;   // symbol `_`
extern string SYMBOL_ADD;         // symbol `+`
extern string SYMBOL_SUB;         // symbol `-`
extern string SYMBOL_MUL;         // symbol `*`
extern string SYMBOL_DIV;         // symbol `/`
extern string SYMBOL_MOD;         // symbol `%`
extern string SYMBOL_LT;          // symbol `<`
extern string SYMBOL_GT;          // symbol `>`
extern string SYMBOL_ASSIGN;      // symbol `=`
extern string SYMBOL_EQ;          // symbol `==`
extern string SYMBOL_NE;          // symbol `!=`
extern string SYMBOL_LE;          // symbol `<=`
extern string SYMBOL_GE;          // symbol `>=`
extern string SYMBOL_ADD_ASSIGN;  // symbol `+=`
extern string SYMBOL_SUB_ASSIGN;  // symbol `-=`
extern string SYMBOL_MUL_ASSIGN;  // symbol `*=`
extern string SYMBOL_DIV_ASSIGN;  // symbol `/=`
extern string SYMBOL_MOD_ASSIGN;  // symbol `%=`
extern string SYMBOL_AND;         // symbol `&&`
extern string SYMBOL_OR;          // symbol `||`
extern string SPECIAL_INIT;       // special method `$init`
extern string SPECIAL_TO_INT;     // special method `$to_int`
extern string SPECIAL_TO_FLOAT;   // special method `$to_float`
extern string SPECIAL_TO_STRING;  // special method `$to_string`
extern string SPECIAL_TO_BOOL;    // special method `$to_bool`
extern string SPECIAL_ADD;        // special method `$add`
extern string SPECIAL_SUB;        // special method `$sub`
extern string SPECIAL_MUL;        // special method `$mul`
extern string SPECIAL_DIV;        // special method `$div`
extern string SPECIAL_MOD;        // special method `$mod`
extern string SPECIAL_EQ;         // special method `$eq`
extern string SPECIAL_NE;         // special method `$ne`
extern string SPECIAL_LT;         // special method `$lt`
extern string SPECIAL_GE;         // special method `$ge`
extern string SPECIAL_GT;         // special method `$gt`
extern string SPECIAL_LE;         // special method `$le`
extern string SPECIAL_AND;        // special method `$and`
extern string SPECIAL_OR;         // special method `$or`
extern string SPECIAL_NOT;        // special method `$not`
extern string SPECIAL_NEG;        // special method `$neg`

#define list(T) List*
#define list_empty(self) (self == NULL || self->head == NULL)
#define foreach(type, item, list)                                                        \
    for (List* _foreach_list = (list); !list_empty(_foreach_list); _foreach_list = NULL) \
        for (ListNode* _node = _foreach_list->head; _node != NULL; _node = _node->next)  \
            for (type item = (type)_node->data; item != NULL; item = NULL)

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
extern list(AST*) parsed_files;

bool is_special(string str);

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
    list(CodeMember*) members;
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
    list(Symbol*) parameters;
    list(Statement*) body;
};

struct Method {
    Symbol* name;
    Symbol* type;
    list(Symbol*) parameters;
    list(Statement*) body;
    bool special;
    /*
    initialization: $init
    type conversion: $to_int, $to_float, $to_string, $to_bool
    operator overloading: $add, $sub, ...
     */
};

struct Class {
    Symbol* name;
    list(ClassMember*) members;
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
        list(Variable*) declare_list;  // DECLARE_LIST
        Variable* declare;             // DECLARE
        If* if_;                       // IF
        For* for_;                     // FOR
        While* while_;                 // WHILE
        void* break_;                  // BREAK
        void* continue_;               // CONTINUE
        Expression* return_;           // RETURN
        Expression* expression;        // EXPRESSION
    } statement;
    StatementType type;
};

struct If {
    Expression* condition;
    list(Statement*) body;
    list(If*) elif_list;  // elif only has condition and body, not elif_list and else_body
    list(Statement*) else_body;
};

struct For {
    union {
        Variable* decl;
        Expression* expr;
    } init;
    Expression* condition;
    Expression* increment;
    list(Statement*) body;
    bool is_decl;  // true if init is decl, false if init is expr
};

struct While {
    Expression* condition;
    list(Statement*) body;
};

struct Expression {
    union {
        Expression* binary;  // binary expression
        Primary* unary;      // unary expression
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
        string literal;              // literal value, including integer, float, string, "true", "false"
        Expression* exp;             // parenthesized expression
        Primary* neg;                // negative number
        Primary * not;               // logical not
        VariableAccess* var_access;  // variable access
    } value;
    Symbol* type;
    PrimaryType kind;
};

struct VariableAccess {
    VariableAccess* base;  // if kind == VAR_ACCESS_VAR, base = NULL;
    union {
        Symbol* var;             // simple variable access
        list(Expression*) args;  // function or method call
        Symbol* attribute;       // attribute or method access
        Expression* index;       // container access
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
    bool skip_comment;
} Lexer;

Token* get_next_token(Lexer* lexer);
Token* peek_next_token(Lexer* lexer);
Token* get_current_token(Lexer* lexer);
Lexer* create_lexer(File* source_path);
void output_tokens(Lexer* lexer, File* output_path);
void output_one_token(Token* token, FILE* file, bool is_lexer_mode);

#define OUT(indent, format, ...) fprintf(out, "%*s" format, ((int)indent) * 4, "", ##__VA_ARGS__)

void print_ast(AST* ast, FILE* out);
void remove_trailing_comma(FILE* out);
void print_symbol_table(SymbolTable* table, FILE* out);

typedef struct Parser {
    Lexer* lexer;
    list(AST*) import_files;
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
    /*
    attribute, parameter, variable: type
    function, method: return type
    type/class (if is container): element type
    type/class (otherwise): NULL
    */
    Symbol* type;
    SymbolType kind;
    size_t id;
    union {
        Function* function;  // for function
        Method* method;      // for method
        Class* class;        // for class
        size_t offset;       // for variable, attribute, parameter
        size_t size;         // for type
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
    list(Symbol*) symbols;
    list(SymbolTable*) children;
};

Symbol* create_symbol(string name, Symbol* type, SymbolType kind, pointer info, SymbolTable* table);
SymbolTable* create_symbol_table(SymbolTableType type, SymbolTable* parent);
Symbol* search_symbol(SymbolTable* table, string name, bool compare_kind, SymbolType compare_kind_value, Symbol* compare_type);
void init_symbol(void);
