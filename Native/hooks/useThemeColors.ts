import { Colors } from "@/constants/Colors";
import { useColorScheme } from "react-native";

/**
 * Permet de renvoyer la couleur selon le thème choisi par l'utilisateur
 */
export function useThemeColors() {
    const theme = useColorScheme() ?? 'light' /*
        - 'useColorScheme' va donner une valeur entre 'light' ou 'dark'
    */
    return Colors[theme]
}