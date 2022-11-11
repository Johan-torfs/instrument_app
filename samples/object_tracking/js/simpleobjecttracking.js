var World = {
    loaded: false,

    init: function initFn() {
        World.createOverlays();
        World.createTracker();
    },

    createOverlays: function createOverlaysFn() {
        this.banner = new AR.ImageResource("assets/banner.jpg", {
            onError: World.onError
        });
        World.bannerOverlay = new AR.ImageDrawable(this.banner, 0.08);
        World.nameTag = new AR.Label("Analysing...", 0.06, {
            zOrder: 2
        });
    },

    createTracker: function createTrackerFn() {
        this.targetCollectionResource = new AR.TargetCollectionResource("assets/tracker.wto", {
            onError: World.onError
        });

        World.tracker = new AR.ObjectTracker(this.targetCollectionResource, {
            onError: World.onError
        });
        World.objectTrackable = new AR.ObjectTrackable(World.tracker, "*", {
            drawables: {
                cam: [World.bannerOverlay, World.nameTag]
            },
            onObjectRecognized: World.objectRecognized,
            onObjectLost: World.objectLost,
            onError: World.onError
        });
    },

    objectRecognized: function objectRecognizedFn(target) {
        AR.platform.sendJSONObject({ //Sends data to flutter, gotta make a receiver too though
            "name": target
        });
        console.log(target);
        World.nameTag.text = target;
        World.nameTag = new AR.Label(target, 0.06, {
            zOrder: 2
        });
        if (World.augmentation !== undefined) {
            World.augmentation.destroy();
        }
        World.bannerOverlay.onClick = function() {
            AR.context.openInBrowser("https://www.google.com");
        };
        World.hideInfoBar();
    },

    onError: function onErrorFn(error) {
        alert(error);
    },

    hideInfoBar: function hideInfoBarFn() {
        document.getElementById("infoBox").style.display = "none";
    },

    showInfoBar: function worldLoadedFn() {
        document.getElementById("infoBox").style.display = "table";
        document.getElementById("loadingMessage").style.display = "none";
    }
};

World.init();