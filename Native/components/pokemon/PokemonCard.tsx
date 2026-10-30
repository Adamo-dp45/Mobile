import { getPokemonArtwork } from "@/functions/pokemon"
import { useThemeColors } from "@/hooks/useThemeColors"
import { Link } from "expo-router"
import { Image, Pressable, StyleSheet, View, ViewStyle } from "react-native"
import { Card } from "../Card"
import { ThemeText } from "../ThemeText"

type Props = {
    style?: ViewStyle,
    id: number,
    name: string
}

export function PokemonCard({style, id, name}: Props) {
    const colors = useThemeColors()
    /*
        - 'padStart' permet de rajouter 0 initiaux, ici avec 3 caractères
        - 'Link' - 'asChild' permet d'indiquer que c'est le 'Pressable' qui reçoit le lien
        - 'Pressable'
            - 'android_ripple' permet d'avoir un effet d'android
                - 'foreground' pour qu'il soit au dessus sinon la couleur de fond de notre élément va le caché
    */
    return <Link href={{pathname: '/pokemon/[id]', params: {id: id}}} asChild>
        <Pressable android_ripple={{color: colors.grayLight, foreground: true}} style={style}>
            <Card style={[styles.card]}>
                <ThemeText style={styles.id} variant="caption" color="grayMedium">#{id.toString().padStart(3, '0')}</ThemeText>
                <Image
                    source={{uri: getPokemonArtwork(id)}}
                    style={{width: 72, height: 72}}
                />
                <ThemeText>{name}</ThemeText>
                <View style={[styles.shadow, {backgroundColor: colors.grayBackground}]} />
            </Card>
        </Pressable>
    </Link>
}

const styles = StyleSheet.create({
    card: {
        alignItems: 'center',
        padding: 4
    },
    id: {
        alignSelf: 'flex-end'
    },
    shadow: {
        position: 'absolute',
        bottom: 0,
        right: 0,
        left: 0,
        height: 44,
        borderRadius: 7,
        zIndex: -1
    }
})