// Sluzba pre cyklicke zobrazovanie udajov (teplota, datum).

#ifndef VIEWS_H
#define VIEWS_H

namespace Views {

// Volane stavovym strojom pri vstupe/vystupe z VIEW rezimu.
void enter();
void exit();

// Zrusi stav viewov bez aktualizacie displeja (napr. pri prechode do ineho rezimu).
void reset();

bool isAnyViewShown();
void hideViews();
void showNextViewOrHide();
void onSecondTick();

} // namespace Views

#endif // VIEWS_H
