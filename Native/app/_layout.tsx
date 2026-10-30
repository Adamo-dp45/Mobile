import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { Stack } from "expo-router";
/*
    - 'Stack' permet d'indiquer le type de navigation qu'on vas utiliser
*/
const queryClient = new QueryClient()

export default function RootLayout() {
    return <QueryClientProvider client={queryClient}>
        <Stack screenOptions={{
            headerShown: false, /*
                - 'false' pour désactiver la barre de navigation
            */
        }} />
    </QueryClientProvider>;
}