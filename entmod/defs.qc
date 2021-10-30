
enum { 
    ENTMOD_MODE_NONE, 
    ENTMOD_MODE_MOVING
};

typedef struct {
    float active;

    float mode;
    entity selectedEntity;


    vector moverStartOrigin;
    vector moveeStartOrigin;
} entmod_t;

entmod_t entmod;


void() Entmod_HandleCommand;

float() Entmod_HandleImpulse;
float() Entmod_PlayerPreThink;
float() Entmod_PlayerPostThink;
float() Entmod_PlayerAttack;

