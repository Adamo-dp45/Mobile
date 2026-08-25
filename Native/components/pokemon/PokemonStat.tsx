import { useThemeColors } from "@/hooks/useThemeColors";
import { useEffect } from "react";
import { StyleSheet, View, ViewProps } from "react-native";
import Animated, { useAnimatedStyle, useSharedValue, withSpring } from "react-native-reanimated";
import { Row } from "../Row";
import { ThemeText } from "../ThemeText";

type Props = ViewProps & {
    name: string
    value: number
    color: string
}

function statShortName(name: string): string {
    return name
        .replaceAll('special', 'S')
        .replaceAll('-', '')
        .replaceAll('attack', 'ATK')
        .replaceAll('defense', 'DEF')
        .replaceAll('speed', 'SPD')
        .toUpperCase()
}

export function PokemonStat({style, name, value, color, ...rest}: Props) {
    const colors = useThemeColors()
    const sharedValue = useSharedValue(value)
    const barInnerStyle = useAnimatedStyle(() => {
        return {
            flex: sharedValue.value
        }
    })
    const barBackgroundStyle = useAnimatedStyle(() => {
        return {
            flex: 255 - sharedValue.value
        }
    })
    useEffect(() => {
        sharedValue.value = withSpring(value)
    }, [value])

    return <Row gap={8} style={[style, styles.root]}>
        <View style={[styles.name, {borderColor: colors.grayLight}]}>
            <ThemeText variant="subtitle3" style={{color: color}}>{statShortName(name)}</ThemeText>
        </View>
        <View style={styles.number}>
            <ThemeText>{value.toString().padStart(3, '0')}</ThemeText> {/*
                - 'padStart()' au minimum 3 carac et des 0 initiaux si nécéssaire
            */}
        </View>
        <View style={styles.bar}>
            <Animated.View style={[styles.barInner, {backgroundColor: color}, barInnerStyle]} />
            <Animated.View style={[styles.barBackground, {backgroundColor: color}, barBackgroundStyle]} /> {/*
                - '255' vu la valeur du pokemon, 'flex: 255 - value' sans l'animation
            */}
        </View>
    </Row>
}

const styles = StyleSheet.create({
    root: {},
    name: {
        width: 40,
        paddingRight: 8,
        borderRightWidth: 1,
        borderStyle: 'solid'
    },
    number: {
        width: 23
    },
    bar: {
        flex: 1,
        borderRadius: 20,
        height: 4,
        overflow: 'hidden'
    },
    barInner: {},
    barBackground: {
        opacity: .24
    }
})