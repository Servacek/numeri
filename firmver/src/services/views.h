// Sluzba pre cyklicke zobrazovanie udajov (teplota, datum).

#ifndef VIEWS_H
#define VIEWS_H

namespace Views {

// Volane stavovym strojom pri vstupe/vystupe z VIEW rezimu.
void enter();
void exit();

void showNextView();
void onSecondTick();

} // namespace Views

#endif // VIEWS_H
