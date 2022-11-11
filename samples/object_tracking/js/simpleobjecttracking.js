var World = {
    loaded: false,

    init: function initFn() {
        World.createOverlays();
        World.createTracker();
    },

    createOverlays: function createOverlaysFn() {
        this.banner = new AR.ImageResource("assets/mark2.png", {
            onError: World.onError
        });
        World.bannerOverlay = new AR.ImageDrawable(this.banner, 0.16, {
            translate: {
                x: 0.22,
                y: 0.16
            },
        });
        World.nameTag = new AR.Label("Analysing...", 0.045, {
            translate: {
                x: 0.23,
                y: 0.208
            },
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
            onError: World.onError
        });
    },

    objectRecognized: function objectRecognizedFn(target) {
        AR.platform.sendJSONObject({
            "name": target.replaceAll(/[^a-z^\s]/ig, '')
        });
        console.log(target);
        World.nameTag.text = target.replaceAll(/[^a-z^\s]/ig, '');
        World.bannerOverlay.onClick = function() {
            AR.platform.sendJSONObject({
                "name": target.replaceAll(/[^a-z^\s]/ig, ''), 
                "clicked": true
            });
        };
    },

    onError: function onErrorFn(error) {
        alert(error);
    }
};

World.init();