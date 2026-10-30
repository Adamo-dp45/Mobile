import { Card } from "@/components/Card";
import { PokemonCard } from "@/components/pokemon/PokemonCard";
import { Row } from "@/components/Row";
import { SearchBar } from "@/components/SearchBar";
import { SortButton } from "@/components/SortButton";
import { ThemeText } from "@/components/ThemeText";
import { getPokemonId } from "@/functions/pokemon";
import { useInfiniteFetchQuery } from "@/hooks/useFetchQuery";
import { useThemeColors } from "@/hooks/useThemeColors";
import { useState } from "react";
import { ActivityIndicator, FlatList, Image, StyleSheet, View } from "react-native";
import { SafeAreaView } from "react-native-safe-area-context";
/*
    - 'SafeAreaView' si on n'utilise pas la barre de navigation, l'utiliser sinon nos textes seront en haut
    - 'FlatList' permet de créer une liste d'éléments avec plein de foncionnalités comme le scrool
        - La propriété 'data' les données qui vont représentés la liste
        - !! 'renderItem' permet de rendre chaque élément
        - !! 'numColumns' le nombre d'éléments par colonne
        - !! 'keyExtractor' pour rendre l'élément qui sert de clé
        - !! 'key'..
        - !! 'columnWrapperStyle' permet de rajouter un style au niveau des colonnes
        - !! 'contentContainerStyle' pour l'espacement vertical
        - !! 'ListFooterComponent' permet d'indiquer un composant qui va se charger en fin de liste, utile pour un chargement
        - !! 'onEndReached' permet de détecter quand la fin d'une liste est atteint
    - 'ActivityIndicator' permet d'affiché un spinner qui a un style différent en fonction du système d'exploitation
    - 'Image' pour afficher une image
        - 'source' pour définir la source d'une image local, 'uri' pour une image distante
        - 'resizeMode' permet de définir comment l'image va s'adapter à son conteneur
    - 'Link' permet de créer un lien mais avec une propriété texte
        - L'attribut 'replace' !! remplacer la pile au lieu de créer une nouvelle entré donc on ne pourra pas revenir en arrière
    - 'Pressable' permet de mettre le lien sur l'enfant, indique qu'on peut pressé dessus et à des évènements
    - 'TextInput' permet de créer un champ de type text
*/
export default function Index() {
    const colors = useThemeColors()
    /*
        const pokemons = Array.from({length: 35}, (_, k) => ({
            name: 'Pokémon name',
            id: k + 1
        }))

        const {data, isFetching} = useFetchQuery('/pokemon?limit=21') -- 'isFetching' si on n'est en train de fetché
        const pokemons = data?.results ?? []
    */
    const {data, isFetching, fetchNextPage} = useInfiniteFetchQuery('/pokemon?limit=21') /*
        - Pour utiliser la pagination infinie, 'fetchNextPage' permet de récupérer la page suivante
    */
    const pokemons = data?.pages.flatMap(page => page.results.map(r => ({name: r.name, id: getPokemonId(r.url)}))) ?? [] /*
        - '.pages' contient l'ensemble des pages qu'on aura chargé, 'flatMap()' pour avoir les résultats à plat
        - 'map' pour éviter de faire le 'getPokemonId' à chaque fois
    */
    const [search, setSearch] = useState('') /*
        - Pour la recherche vu qu'on ne veut pas contacter l'api pour la faire on vas faire un filtre sur la listes des pokémons
    */
    // 'const filteredPokemons = search ? pokemons.filter(p => p.name.includes(search.toLowerCase()) || getPokemonId(p.url).toString() === search) : pokemons'
    const [sortKey, setSortKey] = useState<'id' | 'name'>('id') /*
        - Pour gérer le tri dans notre cas
    */
    const filteredPokemons = [
        ...(search
            ? pokemons.filter(p => p.name.includes(search.toLowerCase()) || p.id.toString() === search)
            : pokemons
        )
    ].sort((a, b) => (a[sortKey] < b[sortKey] ? -1 : 1)) /*
        - 'toLowerCase()' pour avoir en miniscule
    */

    return (
        <SafeAreaView
            style={[styles.container, {backgroundColor: colors.tint}]}
        > {/* Ou.. '<RootView..></RootView..>' plus générique */}
            {/*
                <Text style={styles.container}>Edit app/index.tsx to edit this screen.</Text>
                <Link href={{pathname: 'pokemon/[id]', params: {id: 3}}}>Pokemon 3</Link>
            */}
            <View style={styles.header}> {/* Ou.. composant 'Row' */}
                <Image 
                    source={require("@/assets/images/favicon.png")}
                    width={24}
                    height={24}
                    resizeMode="contain"
                />
                <ThemeText variant="headline" color="grayLight">Pokédex</ThemeText>
            </View>
            <Row gap={16} style={styles.form}>
                <SearchBar value={search} onChange={setSearch} />
                <SortButton value={sortKey} onChange={setSortKey} /> 
            </Row>
            <Card style={styles.body}>
                <FlatList 
                    data={filteredPokemons}
                    numColumns={3}
                    columnWrapperStyle={styles.gridGap}
                    contentContainerStyle={[styles.gridGap, styles.list]}
                    ListFooterComponent={
                        isFetching ? <ActivityIndicator color={colors.tint} /> : null
                    }
                    onEndReached={search ? undefined : () => fetchNextPage()} /*
                        - Si on a une recherche on ne fait rien
                    */
                    renderItem={({item}) => (<PokemonCard 
                        id={item.id}
                        name={item.name}
                        style={{flex: 1/3}}
                    />)} keyExtractor={(item) => item.id.toString()}>
                    {/*
                        renderItem={({item}) => (<PokemonCard 
                            id={item.id}
                            name={item.name}
                            style={{flex: 1/3}}
                        />)} keyExtractor={(item) => item.id.toString()}
                    */}
                </FlatList>
            </Card>
        </SafeAreaView>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1, // '1' l'élément va prendre 100% de l'espace qui est alloué, '1/2' prend la moitié, si on ne mais rien il prendre une hauteur minimum
        padding: 4, // On ne met pas en '.px' dans le cas du mobile
        /*
            justifyContent: "center",
            alignItems: "center",
            backgroundColor: "#ffae00ff"
        */
    },
    header: {
        flexDirection: 'row',
        alignItems: 'center',
        gap: 16, /*
            - Si on.. 'Row' on peut se passer de 'flexDirection', 'alignItems' et 'gap'
        */
        paddingHorizontal: 12,
        paddingBottom: 8
    },
    body: {
        flex: 1,
        marginTop: 16
    },
    gridGap: {
        gap: 8
    },
    list: {
        padding: 12
    },
    form: {
        paddingHorizontal: 12
    }
})