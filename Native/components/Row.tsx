import { View, ViewProps, ViewStyle } from "react-native"

type Props = ViewProps & {
    gap?: number
}

/**
 * Pour représenter des éléments qui vont être allignés horizontalement
 */
export function Row({style, gap, ...rest}: Props) {
    return <View style={[rowStyle, style, gap ? {gap: gap} : undefined]} {...rest} />
}

const rowStyle = {
    flex: 0, // Pour que ça prenne le minimum de largeur possible
    flexDirection: 'row',
    alignItems: 'center'
} satisfies ViewStyle