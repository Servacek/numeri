function openTab(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}

let currentIndex = 0;
let items = [];

function setupLightbox() {
  items = Array.from(document.querySelectorAll('#galleryContainer img, #galleryContainer video'));

  items.forEach((item, index) => {
    item.addEventListener('click', () => openLightbox(index));
  });
}

function openLightbox(index) {
  currentIndex = index;
  const lightbox = document.getElementById('lightbox');
  const content = document.getElementById('lightbox-content');

  if(items[index].tagName === 'VIDEO') {
    const video = document.createElement('video');
    video.src = items[index].querySelector('source').src;
    video.controls = true;
    video.autoplay = true;
    video.id = "lightbox-content";
    document.getElementById('lightbox').replaceChild(video, content);
  } else {
    const img = document.createElement('img');
    img.src = items[index].src;
    img.id = "lightbox-content";
    document.getElementById('lightbox').replaceChild(img, content);
  }

  lightbox.style.display = 'flex';
}

function closeLightbox() {
  document.getElementById('lightbox').style.display = 'none';
}

function showNext() {
  openLightbox((currentIndex + 1) % items.length);
}

function showPrev() {
  openLightbox((currentIndex - 1 + items.length) % items.length);
}

document.getElementById('lightbox-close').onclick = closeLightbox;
document.getElementById('lightbox-next').onclick = showNext;
document.getElementById('lightbox-prev').onclick = showPrev;

/* Swipe gesture support */
let startX = 0;
document.getElementById('lightbox').addEventListener('touchstart', e => {
  startX = e.touches[0].clientX;
});

document.getElementById('lightbox').addEventListener('touchend', e => {
  let endX = e.changedTouches[0].clientX;
  if(startX - endX > 50) showNext();      // swipe left
  if(endX - startX > 50) showPrev();      // swipe right
});
