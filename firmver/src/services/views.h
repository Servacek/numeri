/** @file views.h
 *  Sluzba ktora riesi pravidelne zobrazovanie roznych udajov.
 */

#ifndef VIEWS_H
#define VIEWS_H

#include <stdint.h>

#define TOTAL_VIEWS        2
#define NO_VIEW            -1
#define VIEW_INDEX         int8_t

namespace Views {

bool      isAnyViewShown();

void      showView(VIEW_INDEX view_index);
void      showNextViewOrHide();

void      hideViews();

// Funkcie pre zobrazovanie jednotlivych zobrazeni.
void      displayTemperature();
void      displayDate();

} // namespace Views

#endif // VIEWS_H
