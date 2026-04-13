/** @file views.h
 *  Sluzba ktora riesi pravidelne zobrazovanie roznych udajov.
 */

#ifndef VIEWS_H
#define VIEWS_H

#include <stdint.h>

#define TOTAL_VIEWS        2
#define VIEW_SHOW_DURATION 10   // TODO: Toto by malo byt nastavenie — sekund pred navratom na cas
#define NO_VIEW            -1
#define VIEW_INDEX         int8_t

namespace Views {

bool      isAnyViewShown();

void      showView(VIEW_INDEX view_index);
void      showNextViewOrHide();

void      hideViews();

// Vola sa raz za sekundu z onNewSecond().
void      secondlyViewHandler();

// ─── Render funkcie (registrovane aj v VIEWS[]) ───────────────────────────
void      displayTemperature();
void      displayDate();

} // namespace Views

#endif // VIEWS_H
