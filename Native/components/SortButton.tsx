import { Shadows } from "@/constants/Shadows"
import { useThemeColors } from "@/hooks/useThemeColors"
import { useRef, useState } from "react"
import { Dimensions, Image, Modal, Pressable, StyleSheet, View } from "react-native"
import { Card } from "./Card"
import { Radio } from "./Radio"
import { Row } from "./Row"
import { ThemeText } from "./ThemeText"
/*
    - 'Modal'
        - 'transparent' pour ne pas avoir de couleur de fond
        - 'visible' !! piloter l'état
        - 'onRequestClose' !! que si on appuie la touche retour la modal disparaît
        - 'animationType' !! une animation d'apparition, 'slide'..
    - 'Dimensions' permet d'obtenir la taille d'une fenêtre
*/
type Props = {
    value: "id" | "name",
    onChange: (v: "id" | "name") => void
}

const Options = [
    {label: "Number", value: "id"},
    {label: "Name", value: "name"}
] as const // On.. pour ne pas qu'il rale au niveau de 'onPress' de 'Pressable'

export function SortButton({value, onChange}: Props) {
    const colors = useThemeColors()
    const [isModalVisible, setModalVisibility] = useState(false)

    const buttonRef = useRef<View>(null) /*
        - Pour placer la modal
    */
    const [position, setPosition] = useState<null | {top: number, right: number}>(null)

    const onButtonPress = () => {
        buttonRef.current?.measureInWindow((x, y, width, height) => {
            setPosition({
                top: y + height,
                right: Dimensions.get("window").width - x - width
            })
            setModalVisibility(true)
        }) /*
            - 'measureInWindow()' permet de mésurer la position de l'élément dans la fenêtre
        */
    }
    const onClose = () => {
        setModalVisibility(false)
    }

    return (
        <>
            <Pressable onPress={onButtonPress}> {/* () => onChange(value === "id" ? "name" : "id") */}
                <View ref={buttonRef} style={[styles.button, {backgroundColor: colors.grayWhite}]}>
                    <Image 
                        source={
                            value === "id" ?
                            require("@/assets/images/favicon.png") :
                            require("@/assets/images/favicon.png")
                        }
                        width={16}
                        height={16}
                    />
                </View>
            </Pressable>
            <Modal
                transparent
                visible={isModalVisible}
                onRequestClose={onClose}
                animationType="fade"
            >
                <Pressable style={styles.backdrop} onPress={onClose} />
                <View style={[styles.popup, {backgroundColor: colors.tint, ...position}]}> {/*
                        - '...position' pour utiliser les propriétés de postion ce qui fais que 'styles.popup' doit être en absolue
                    */}
                    <ThemeText style={styles.title} variant="subtitle2" color="grayWhite">
                        Sort by :
                    </ThemeText>
                    <Card style={styles.card}>
                        {Options.map(o => 
                            <Pressable onPress={() => onChange(o.value)} key={o.value}>
                                <Row gap={8}>
                                    <Radio checked={o.value === value} />
                                    <ThemeText>{o.label}</ThemeText>
                                </Row>
                            </Pressable>
                        )}
                    </Card>
                </View>
            </Modal>
        </>
    )
}

const styles = StyleSheet.create({
    button: {
        width: 32,
        height: 32,
        borderRadius: 32,
        flex: 0,
        alignItems: "center",
        justifyContent: "center"
    },
    backdrop: {
        flex: 1,
        backgroundColor: "rgba(0, 0, 0, 0.3)"
    },
    popup: {
        padding: 4,
        paddingTop: 16,
        gap: 16,
        borderRadius: 12,
        position: 'absolute',
        width: 113,
        ...Shadows.dp2
    },
    title: {
        paddingLeft: 20
    },
    card: {
        paddingVertical: 16,
        paddingHorizontal: 20,
        gap: 16
    }
})