import { useThemeColors } from "@/hooks/useThemeColors";
import { useEffect } from "react";
import { ViewProps, ViewStyle } from "react-native";
import Animated, { Easing, interpolateColor, ReduceMotion, useAnimatedStyle, useSharedValue, withTiming } from "react-native-reanimated";
import { SafeAreaView } from "react-native-safe-area-context";

type Props = ViewProps & {
    backgroundColor?: string
}

export function RootView({style, backgroundColor, ...rest}: Props) {
    const colors = useThemeColors()
    const progress = useSharedValue(0)
    const animatedStyle = useAnimatedStyle(() => { /*
            - Permet de générer un style qui dépend d'une valeur qui est partagé par react native
        */
        return {
            backgroundColor: interpolateColor(
                progress.value,
                [0, 1],
                [colors.tint, backgroundColor ?? colors.tint] // On commence par le 1er et on termine par le 2ème
            )
        }
    }, [backgroundColor]) /*
        - Vu qu'il attend aussi un tableau de dépendance
    */
    useEffect(() => {
        if(backgroundColor) {
            progress.value = 0
            progress.value = withTiming(1, {
                duration: 700,
                easing: Easing.out(Easing.quad),
                reduceMotion: ReduceMotion.System
            })
        }
    }, [backgroundColor])

    if(!backgroundColor) {
        return <SafeAreaView style={[rootStyle, {backgroundColor: colors.tint}, style]} {...rest} />
    }
    return <Animated.View style={[{flex: 1}, animatedStyle, style]}>
        <SafeAreaView style={rootStyle} {...rest} />
    </Animated.View>
}

const rootStyle = {
    flex: 1,
    padding: 4
} satisfies ViewStyle