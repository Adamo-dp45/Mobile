import { Card } from "@/components/Card";
import { PokemonSpec } from "@/components/pokemon/PokemonSpec";
import { PokemonStat } from "@/components/pokemon/PokemonStat";
import { PokemonType } from "@/components/pokemon/PokemonType";
import { RootView } from "@/components/RootView";
import { Row } from "@/components/Row";
import { ThemeText } from "@/components/ThemeText";
import { Colors } from "@/constants/Colors";
import { basePokemonStats, formatSize, formatWeight, getPokemonArtwork } from "@/functions/pokemon";
import { useFetchQuery } from "@/hooks/useFetchQuery";
import { useThemeColors } from "@/hooks/useThemeColors";
import { Audio } from "expo-av";
import { router, useLocalSearchParams } from "expo-router";
import { useRef, useState } from "react";
import { Image, Pressable, StyleSheet, View } from "react-native";
import PagerView from 'react-native-pager-view';
/*
    - 'router.back' pour revenir en arrière
*/
export default function pokemon() {
    const params = useLocalSearchParams() as {id: string} /*
        - Permet de récupérer les paramètres passés dans l'url
    */
    const [id, setId] = useState(parseInt(params.id, 10))
    const offset = useRef(1)
    const pager = useRef<PagerView>(null)
    const onPageSelected = (e: {nativeEvent: {position: number}}) => {
        offset.current = e.nativeEvent.position - 1
    }
    const onPageScrollStateChanged = (e: {nativeEvent: {pageScrollState: string}}) => {
        if(e.nativeEvent.pageScrollState !== 'idle') {
            return /*
                - Pour éviter d'aller à 0
            */
        }
        if(offset.current === -1 && id === 2) {
            return
        }
        if(offset.current === 1 && id === 150) {
            return
        }
        if(offset.current !== 0) {
            setId(id + offset.current)
            offset.current = 0
            pager.current?.setPageWithoutAnimation(1)
        }
    }

    const onPrevious = () => {
        pager.current?.setPage(2 + offset.current) /*
            - '2' le dernier élément de notre pager
        */
    }
    const onNext = () => {
        pager.current?.setPage(0)
    }

    return <PagerView
        initialPage={1}
        onPageSelected={onPageSelected}
        onPageScrollStateChanged={onPageScrollStateChanged}
        style={{flex: 1}}
        ref={pager}
    >
        <PokemonView key={id - 1} id={Math.max(id - 1, 1)} onPrevious={onPrevious} onNext={onNext} />
        <PokemonView key={id} id={id} onPrevious={onPrevious} onNext={onNext} />
        <PokemonView key={id + 1} id={Math.min(id + 1, 151)} onPrevious={onPrevious} onNext={onNext} />
    </PagerView>
} /*
    - On.. pour le swipp
*/

type Props = {
    id: number,
    onPrevious: () => void,
    onNext: () => void
}

function PokemonView({id, onPrevious, onNext}: Props) {
    const colors = useThemeColors()
    const {data: pokemon} = useFetchQuery('/pokemon/[id]', {id: id}) /*
        - On.. de remplacer '[id]' par l'id du param, dans 'useFetchQuery'
    */
    const {data: species} = useFetchQuery('/pokemon-species/[id]', {id: id}) 
    const mainType = pokemon?.types?.[0].type.name
    const colorType = mainType ? Colors.type[mainType] : colors.tint
    const types = pokemon?.types ?? []
    const bio = species?.flavor_text_entries?.find(({language}) => language.name === 'en')?.flavor_text.replaceAll("\n", ". ")
    const stats = pokemon?.stats ?? basePokemonStats

    const onImagePress = async () => {
        const cry = pokemon?.cries.latest
        if(!cry) {
            return
        }
        const {sound} = await Audio.Sound.createAsync({
            uri: cry
        }, {shouldPlay: true}) /*
            - 'shouldPlay' permet de précharger le son pour la lecture
        */
        sound.playAsync()
    }
    /*
        const onPreview = () => {
            router.replace({pathname: '/pokemon/[id]', params: {id: Math.max(id - 1, 1)}}) -- 'Math.max' pour éviter d'aller en dessous de 0
        }
        const onNext = () => {
            router.replace({pathname: '/pokemon/[id]', params: {id: Math.min(id - 1, 151)}})
        }
    */
    const isFirst = id === 1
    const isLast = id === 151

    return (
        <RootView backgroundColor={colorType}>
            <View> {/*
                - Le 'View' pour que le 'pokeball' soit positionné relativement à elle
            */}
                <Image
                    style={styles.pokeball}
                    source={require("@/assets/images/favicon.png")}
                    width={208}
                    height={208}
                />
                <Row style={styles.header}>
                    <Pressable onPress={router.back}>
                        <Row gap={8}>
                            <Image
                                source={require("@/assets/images/favicon.png")}
                                width={32}
                                height={32}
                            />
                            <ThemeText color="grayWhite" variant="headline" style={{textTransform: 'capitalize'}}>
                                {pokemon?.name}
                            </ThemeText>
                        </Row>
                    </Pressable>
                    <ThemeText color="grayWhite" variant="subtitle2">
                        #{id.toString().padStart(3, "0")}
                    </ThemeText>
                </Row>
                <Card style={styles.card}>
                    <Row style={styles.imageRow}>
                        {isFirst ? <View style={{width: 24, height: 24}} /> : <Pressable onPress={onPrevious}>
                            <Image source={require("@/assets/images/favicon.png")} width={24} height={24}/>
                        </Pressable>}
                        <Pressable onPress={onImagePress}>
                            <Image
                                style={styles.artwork}
                                source={{uri: getPokemonArtwork(id)}}
                                width={200}
                                height={200}
                            />
                        </Pressable>
                        {isLast ? <View style={{width: 24, height: 24}} /> : <Pressable onPress={onNext}>
                            <Image source={require("@/assets/images/favicon.png")} width={24} height={24}/>
                        </Pressable>}
                    </Row>
                    <Row gap={16} style={{height: 20}}>
                        {types.map(type => <PokemonType name={type.type.name} key={type.type.name} />)}
                    </Row>
                    <ThemeText variant="subtitle1" style={{color: colorType}}>About</ThemeText>
                    <Row>
                        <PokemonSpec
                            style={{borderStyle: 'solid', borderRightWidth: 1, borderColor: colors.grayLight}}
                            title={formatWeight(pokemon?.weight)}
                            description="Weight"
                            image={require('@/assets/images/favicon.png')}
                        />
                        <PokemonSpec
                            style={{borderStyle: 'solid', borderRightWidth: 1, borderColor: colors.grayLight}}
                            title={formatSize(pokemon?.height)}
                            description="Size"
                            image={require('@/assets/images/favicon.png')}
                        />
                        <PokemonSpec title={pokemon?.moves.slice(0, 2).map(m => m.move.name).join("\n")} description="Moves" /> {/*
                            - On 'slice' pour récupérer les 2 premiers..
                        */}
                    </Row>
                    <ThemeText>{bio}</ThemeText>
                    <ThemeText variant="subtitle1" style={{color: colorType}}>Base stats</ThemeText>
                    <View style={{alignSelf: 'stretch'}}>
                        {stats.map(stat => <PokemonStat key={stat.stat.name} name={stat.stat.name} value={stat.base_stat} color={colorType} />)}
                    </View>
                </Card>
            </View>
        </RootView>
    )
}

const styles = StyleSheet.create({
    header: {
        margin: 20,
        justifyContent: 'space-between'
    },
    pokeball: {
        opacity: .1,
        position: 'absolute',
        right: 8,
        top: 8
    },
    imageRow: {
        position: 'absolute',
        top: -140,
        zIndex: 2,
        justifyContent: 'space-between',
        left: 0,
        right: 0,
        paddingHorizontal: 20
    },
    artwork: {},
    card: {
        marginTop: 144,
        paddingHorizontal: 20,
        paddingTop: 60,
        paddingBottom: 20,
        gap: 16,
        alignItems: 'center'
    }
})