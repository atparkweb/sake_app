# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     SakeApp.Repo.insert!(%SakeApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias SakeApp.{Repo, Geography, Sake}

Repo.insert_all(Geography.Region, [
      %{
  name: "Hokkaidō",
  name_kanji: "北海道",
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Tōhoku",
  name_kanji: "東北",
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Kantō",
  name_kanji: "関東",
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Chūbu",
  name_kanji: "中部",
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Kansai",
  name_kanji: "関西",
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Chūgoku",
  name_kanji: "中国",
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Shikoku",
  name_kanji: "四国",
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Kyūshū",
  name_kanji: "九州",
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Okinawa",
  name_kanji: "沖縄県",
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      }
])

%{id: tohoku} = Repo.get_by!(Geography.Region, name: "Tōhoku")
%{id: hokkaido} = Repo.get_by!(Geography.Region, name: "Hokkaidō")
%{id: kanto} = Repo.get_by!(Geography.Region, name: "Kantō")
%{id: chubu} = Repo.get_by!(Geography.Region, name: "Chūbu")
%{id: kansai} = Repo.get_by!(Geography.Region, name: "Kansai")
%{id: chugoku} = Repo.get_by!(Geography.Region, name: "Chūgoku")
%{id: shikoku} = Repo.get_by!(Geography.Region, name: "Shikoku")
%{id: kyuushuu} = Repo.get_by!(Geography.Region, name: "Kyūshū")
%{id: okinawa} = Repo.get_by!(Geography.Region, name: "Okinawa")

Repo.insert_all(Geography.Prefecture, [
      %{
  name: "Hokkaidō",
  name_kanji: "北海道",
  region: hokkaido,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Aomori",
  name_kanji: "青森県",
  region: tohoku,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Akita",
  name_kanji: "秋田県",
  region: tohoku,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Iwate",
  name_kanji: "岩手県",
  region: tohoku,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Yamagata",
  name_kanji: "山形県",
  region: tohoku,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Miyagi",
  name_kanji: "宮城県",
  region: tohoku,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Fukushima",
  name_kanji: "福島県",
  region: tohoku,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Niigata",
  name_kanji: "新潟県",
  region: chubu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Gunma",
  name_kanji: "群馬県",
  region: chubu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Nagano",
  name_kanji: "長野県",
  region: chubu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Yamanashi",
  name_kanji: "山梨県",
  region: chubu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Toyama",
  name_kanji: "富山県",
  region: chubu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Ishikawa",
  name_kanji: "石川県",
  region: chubu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Fukui",
  name_kanji: "福井県",
  region: chubu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Gifu",
  name_kanji: "岐阜県",
  region: chubu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Aichi",
  name_kanji: "愛知県",
  region: chubu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Shizuoka",
  name_kanji: "静岡県",
  region: chubu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Tochigi",
  name_kanji: "栃木県",
  region: kanto,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Ibaraki",
  name_kanji: "茨城県",
  region: kanto,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Saitama",
  name_kanji: "埼玉県",
  region: kanto,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Tōkyō",
  name_kanji: "東京都",
  region: kanto,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Chiba",
  name_kanji: "千葉県",
  region: kanto,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Kanagawa",
  name_kanji: "神奈川県",
  region: kanto,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Mie",
  name_kanji: "三重県",
  region: kansai,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Wakayama",
  name_kanji: "和歌山県",
  region: kansai,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Nara",
  name_kanji: "奈良県",
  region: kansai,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Ōsaka",
  name_kanji: "大阪府",
  region: kansai,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Kyōto",
  name_kanji: "京都府",
  region: kansai,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Shiga",
  name_kanji: "滋賀県",
  region: kansai,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Hyōgo",
  name_kanji: "兵庫県",
  region: kansai,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Tottori",
  name_kanji: "鳥取県",
  region: chugoku,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Okayama",
  name_kanji: "岡山県",
  region: chugoku,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Hiroshima",
  name_kanji: "広島県",
  region: chugoku,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Shimane",
  name_kanji: "島根県",
  region: chugoku,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Yamaguchi",
  name_kanji: "山口県",
  region: chugoku,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Kagawa",
  name_kanji: "香川県",
  region: shikoku,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Tokushima",
  name_kanji: "徳島県",
  region: shikoku,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Ehime",
  name_kanji: "愛媛県",
  region: shikoku,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Kōchi",
  name_kanji: "高知県",
  region: shikoku,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Fukuoka",
  name_kanji: "福岡県",
  region: kyuushuu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Ōita",
  name_kanji: "大分県",
  region: kyuushuu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Saga",
  name_kanji: "佐賀県",
  region: kyuushuu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Nagasaki",
  name_kanji: "長崎県",
  region: kyuushuu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Kumamoto",
  name_kanji: "熊本県",
  region: kyuushuu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Miyazaki",
  name_kanji: "宮崎県",
  region: kyuushuu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Kagoshima",
  name_kanji: "鹿児島県",
  region: kyuushuu,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
  name: "Okinawa",
  name_kanji: "沖縄県",
  region: okinawa,
  inserted_at: DateTime.truncate(Timex.now, :second),
  updated_at: DateTime.truncate(Timex.now, :second)
      }
])

%{id: akita} = Repo.get_by!(Geography.Prefecture, name: "Akita")
%{id: niigata} = Repo.get_by!(Geography.Prefecture, name: "Niigata")
%{id: hyogo} = Repo.get_by!(Geography.Prefecture, name: "Hyōgo")
%{id: okayama} = Repo.get_by!(Geography.Prefecture, name: "Okayama")
%{id: yamagata} = Repo.get_by!(Geography.Prefecture, name: "Yamagata")
%{id: nagano} = Repo.get_by!(Geography.Prefecture, name: "Nagano")

Repo.insert_all(Sake.Brewery, [
  %{
    name: "Azakura",
    name_kanji: "阿櫻",
    prefecture: akita,
    description: "",
    address: "",
    site_url: "http://azakura.co.jp",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Saiya",
    name_kanji: "齋彌",
    prefecture: akita,
    description: "",
    address: "",
    site_url: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Yamamoto",
    name_kanji: "山本",
    prefecture: akita,
    description: "",
    address: "",
    site_url: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Kuribayashi",
    name_kanji: "栗林",
    prefecture: akita,
    description: "",
    address: "",
    site_url: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Hokusetsu",
    name_kanji: "北雪",
    prefecture: niigata,
    description: "",
    address: "",
    site_url: "https://sake-hokusetsu.com",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Dewazakura",
    name_kanji: "出羽桜",
    prefecture: yamagata,
    description: "",
    address: "",
    site_url: "https://www.dewazakura.co.jp/",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  }
])

Repo.insert_all(Sake.Rice, [
  %{
    name: "Yamadanishiki",
    name_kanji: "山田錦",
    prefecture: hyogo,
    description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Omachi",
    name_kanji: "雄町",
    prefecture: okayama,
    description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Komachi",
    name_kanji: "小町",
    prefecture: akita,
    description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Gohyaku Mangoku",
    name_kanji: "五百万石",
    prefecture: niigata,
    description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Koshi Tanrei",
    name_kanji: "越淡麗",
    prefecture: niigata,
    description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Miyama Nishiki",
    name_kanji: "美山錦",
    prefecture: nagano,
    description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  }
])

Repo.insert_all(Sake.Grade, [
      %{
	name: "Daiginjo",
	max_polish_remain: 0.5,
	description: "Daiginjo description",
	inserted_at: DateTime.truncate(Timex.now, :second),
	updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
	name: "Ginjo",
	max_polish_remain: 0.6,
	description: "Ginjo description",
	inserted_at: DateTime.truncate(Timex.now, :second),
	updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
	name: "Honjozo",
	max_polish_remain: 0.7,
	description: "Honjozo description",
	inserted_at: DateTime.truncate(Timex.now, :second),
	updated_at: DateTime.truncate(Timex.now, :second)
      },
      %{
	name: "Unspecified",
	max_polish_remain: 1.0,
	description: "Honjozo description",
	inserted_at: DateTime.truncate(Timex.now, :second),
	updated_at: DateTime.truncate(Timex.now, :second)
      }
    ]);

%{ id: komachi } = Repo.get_by!(Sake.Rice, name: "Komachi")
%{ id: azakura_brewery } = Repo.get_by!(Sake.Brewery, name: "Azakura")
%{ id: daiginjo } = Repo.get_by!(Sake.Grade, name: "Daiginjo")

Repo.insert_all(Sake.Product, [
  %{
    name: "Kanjikomi",
    brand: "Azakura",
    brand_kanji: "阿櫻",
    prefecture: akita,
    brewery: azakura_brewery,
    abv: 0.16,
    long_description: "",
    short_description: "",
    tasting_notes: "Rich, Dry",
    product_rice: komachi,
    grade: daiginjo,
    genshu: false,
    junmai: true,
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  }
])
