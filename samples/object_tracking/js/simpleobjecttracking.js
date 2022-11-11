var World = {
    loaded: false,

    init: function initFn() {
        World.createOverlays();
        World.createTracker();
    },

    createOverlays: function createOverlaysFn() {
        this.banner = new AR.ImageResource("assets/mark.png", {
            onError: World.onError
        });
        World.bannerOverlay = new AR.ImageDrawable(this.banner, 0.8);
        World.nameTag = new AR.Label("Analysing...", 0.06, {
            /*translate: {
                y: 0.6
            },*/
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
            "name": target
        });
        console.log(target);
        World.nameTag.text = target;
        World.bannerOverlay.onClick = function() {
            AR.platform.sendJSONObject({
                "name": target, 
                "clicked": true
            });
        };
    },

    onError: function onErrorFn(error) {
        alert(error);
    }
};

World.init();