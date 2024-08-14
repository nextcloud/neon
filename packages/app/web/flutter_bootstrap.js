{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
    onEntrypointLoaded: async function(engineInitializer) {
        const appRunner = await engineInitializer.initializeEngine({
            useColorEmoji: true,
        });

        await appRunner.runApp();
    }
});
