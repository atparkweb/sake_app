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

Repo.insert_all(Sake.Designation, [
  %{
    name: "Junmai",
    polish_ratio_remain: 0.0,
    short_description: "Pure rice, 50% or less of rice remaining.",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Junmai Daiginjō",
    polish_ratio_remain: 0.5,
    short_description: "Pure rice, 50% or less of rice remaining.",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Daiginjō",
    polish_ratio_remain: 0.5,
    short_description: "Distilled alcohol added. 50% or less of rice remaining.",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Junmai Ginjō",
    polish_ratio_remain: 0.6,
    short_description: "Pure rice, 60% or less of rice remaining.",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Ginjō",
    polish_ratio_remain: 0.6,
    short_description: "Distilled alcohol added. 60% or less of rice remaining.",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Tokubetsu Junmai",
    polish_ratio_remain: 0.6,
    short_description: "Pure rice, 60% or less of rice remaining. Special brewing method.",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Tokubetsu Honjōzō",
    polish_ratio_remain: 0.7,
    short_description: "Distilled alcohol added, 70% or less of rice remaining. Special brewing method.",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Honjōzō",
    polish_ratio_remain: 0.7,
    short_description: "Distilled alcohol added. 60% or less of rice remaining.",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
])

Repo.insert_all(Sake.Type, [
  %{
    name: "Nama",
    name_kanji: "生",
    short_description: "",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Akai",
    name_kanji: "",
    short_description: "",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Taru",
    name_kanji: "",
    short_description: "",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Sparkling",
    name_kanji: "",
    short_description: "",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Kinapaku-iri",
    name_kanji: "",
    short_description: "",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Arabashiri",
    name_kanji: "",
    short_description: "",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Genshu",
    name_kanji: "",
    short_description: "",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Namachozo",
    name_kanji: "",
    short_description: "",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Koshu",
    name_kanji: "",
    short_description: "",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Yamahai",
    name_kanji: "",
    short_description: "",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Kimoto",
    name_kanji: "",
    short_description: "",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
  %{
    name: "Nigori",
    name_kanji: "",
    short_description: "",
    long_description: "",
    inserted_at: DateTime.truncate(Timex.now, :second),
    updated_at: DateTime.truncate(Timex.now, :second)
  },
])
