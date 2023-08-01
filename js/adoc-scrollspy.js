(function () {
  // AsciiDoc scrollspy V1.1
  // based on
  // https://codepen.io/zchee/pen/ogzvZZ

  //get the vertical position of all headlines in document
  let section = document.querySelectorAll('h1, h2, h3, h4, h5');
  let sections = {};
  let i = 0;

  Array.prototype.forEach.call(section, function (e) {
    // check if a toc entry exists for this element
    const ref = decodeURIComponent(e.id);
    const tocEntry = getTocLinkElement(ref);
    if (tocEntry !== null) {
      sections[ref] = e.offsetTop;
    }
  });

  function getTocLinkElement(ref) {
    const targetSelector = '#toc a[href*="' + ref + '"]';
    return document.querySelector(targetSelector);
  }

  // https://stackoverflow.com/questions/487073/how-to-check-if-element-is-visible-after-scrolling/488073#488073
  function isScrolledIntoView(el, completlyVisible = true) {
    const rect = el.getBoundingClientRect();
    const elemTop = rect.top;
    const elemBottom = rect.bottom;
    let isVisible = false;
    if (completlyVisible === true) {
      // Only completely visible elements return true:
      isVisible = elemTop >= 0 && elemBottom <= window.innerHeight;
    } else {
      // Partially visible elements return true:
      isVisible = elemTop < window.innerHeight && elemBottom >= 0;
    }
    return isVisible;
  }

  window.onscroll = function () {
    // only scroll toc entries if toc is visible (non mobile view)
    let tocEntry = document.querySelector('#toc');
    if (isScrolledIntoView(tocEntry, false) !== false) {
      const scrollPosition =
        document.documentElement.scrollTop || document.body.scrollTop;

      //check which section is currently active in view
      //by checking all headline positions with the view-port
      //the position of the sections is supposed to be sorted
      //the active position is the last one which is less than
      // the scroll position
      let activeSection = '';
      for (i in sections) {
        //80 is aprox the height of the navbar in pixels
        //this affects the position when a section is seen as active
        if (sections[i] - 80 <= scrollPosition) {
          activeSection = i;
        }
      }
      if (activeSection != '') {
        //get the new active toc entry
        tocEntry = getTocLinkElement(activeSection);
        if (tocEntry) {
          //remove class "active" from old entries
          const activeSelector = '#toc a.active';
          const active = document.querySelector(activeSelector);
          if (active) {
            active.classList.remove('active');
          }
          //set new toc entry as active
          tocEntry.classList.add('active');
        }
        //console.debug("tocEntry-pos: "+ tocEntry.offsetTop + " - "+ isScrolledIntoView(tocEntry));
        if (isScrolledIntoView(tocEntry) === false) {
          tocEntry.scrollIntoView(true);
        }
      }
    }
  };
})();
