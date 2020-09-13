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

SakeApp.Repo.insert_all(SakeApp.Geography.Region, [
      %{
	name: "Hokkaidō",
	name_kanji: "北海道",
	inserted_at: Timex.now,
	updated_at: Timex.now
      },
      %{
	name: "Tōhoku",
	name_kanji: "東北",
	inserted_at: Timex.now,
	updated_at: Timex.now
      },
      %{
	name: "Kantō",
	name_kanji: "関東",
	inserted_at: Timex.now,
	updated_at: Timex.now
      },
      %{
	name: "Chūbu",
	name_kanji: "中部",
	inserted_at: Timex.now,
	updated_at: Timex.now
      },
      %{
	name: "Kansai",
	name_kanji: "関西",
	inserted_at: Timex.now,
	updated_at: Timex.now
      },
      %{
	name: "Chūgoku",
	name_kanji: "中国",
	inserted_at: Timex.now,
	updated_at: Timex.now
      },
      %{
	name: "Shikoku",
	name_kanji: "四国",
	inserted_at: Timex.now,
	updated_at: Timex.now
      },
      %{
	name: "Kyūshū",
	name_kanji: "九州",
	inserted_at: Timex.now,
	updated_at: Timex.now
      }
])
