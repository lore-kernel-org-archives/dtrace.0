Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288BE23C50C
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913597; cv=fail; b=e2E5fbpQODR461fwq60+yAciQ6JTXDVbvt6riIaFRYmuAxYKWmU+KCINKrCZ6Wqu1FMWTcFlFxMbPhwjoNfUoF9bu14YzdTbY/l9bwKPOxBlb/PwyE3rMfblY5f5n61yuEtnhrND+85pEnoqBRU2VNmEc9TOAukPmH9poi/r5Mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913597; c=relaxed/simple;
	bh=1d+n8l10e8Ujs+68X2ZGh9Xlhpvc7mdXm/iah17aXw8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OVOqaLkP3ECn7GiJL1K3Ach+wjOGzgGedpVuQlOoJWRnZoyn5t5tPVFH95yz05xIDQzt24C1mf/bz8/WZm0j6HryNMRuqJnbunLwicaPeNRQKmKnAOpjVNgBdaznLAtrFqPM3aPxCIM47+02iQtVdw8ldDfz0bNSHs4vmZJjpq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oh3unKN9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bO4F++uW; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oh3unKN9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bO4F++uW"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIMshA015603
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=YbO1PH/QSr/0oYvjA1
	xZ7CYr7zrYe6IlcHGnSPSbCOA=; b=oh3unKN9rJSYfV5byKhpaJSDrUWw4lMN1S
	GdrISFzsWrkDu3DbsMMZgbxwRRnRh18UOzvbH4dJEuavqeo3xlom2uhQyxQrTf9V
	G2nY2rQQCpGTXS+VhL35UvVcHOLBkYAEq/swFTn5YPZ8vMflZcKC2vsHVHW649TX
	7CMsP2Gum9f6PtcZA5IrIvpmiCSoHvjQFj9TwAaoCXPc44yWVPSEbMc/XeCr9i5Q
	HkgZKk5E9vOVuFjgEL78hHTr/hlTlC7UKW2n/BlgQNKfaF5y7mpUCsW+UIXEhIDF
	nEM/T6Omu+I2IKqZoi6quHH4QgPd3jSCEJCLi37psnS4ZHteoUlQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49dybn054p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIYDfP023318
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:34 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010018.outbound.protection.outlook.com [52.101.193.18])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49dd8m7f94-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Atx8Epu8rSyT33hiC8QJYOiHVIoyJ1KeJ6XnqR7tLwsqtvxYLOAiXCXYyiyGe7UUAQo2hDJiDhR0ofCIERCLrRzykmgPEoiKnV4nig5nXIpYms0J8TQdCZJZujXVoB7df8T54eS2zztCssc1aTDhVgXuE5xuLJrx/pS/f0YOZkzS7BeiemG8cH7baX9FDq56PI3PM6iiC2Btmp9nqdsEXajL93huV7/ifN7gxvHBjdLdomJsbgZGa7eMOlNWkXv53GB+38HgegjBHcAK2AolP0ybX2/NNizqhniS2H+WrgP4HX3P3r/Oti4/QHYG5hD92Sym+P/OsUTSdcrsExFA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbO1PH/QSr/0oYvjA1xZ7CYr7zrYe6IlcHGnSPSbCOA=;
 b=HHqNH0A4hwG7hQUIH8C1HrtoD5WLn5usun+OW54y0qmjKn4E5BQIHEFh1auFFmkNcOBWIkQ+tINYcZHRp6EltQD6HZU7Y6I/7u3iaGaUi9RDtxnqxHfSgMZ7J+N2U/2ZqeBFHd+M3jB1vVJbvdmQqeqtir/um+XgXChg+Y8JxLqbs3MFlBYX5ivc2PHYxQnhsep9RsWvYinzovUkk0S3PxfLuEzkYNpNERayZpS+4OWD4nCPH/vKjkIv02xEbN3jdepVWINnyhmCr/C/aKLs9PM8bwC+SwroLJJ5W6yMkNxU1SMtzKGaXmyPwPVdkCXN5VZO6LUQKCQJNW9mbAtTFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbO1PH/QSr/0oYvjA1xZ7CYr7zrYe6IlcHGnSPSbCOA=;
 b=bO4F++uWhGF3FWSwWh/ERinSmVlqjDJAknQmyMoMoCutaxVnstIEkXEXKDMT+DhAc+u7GzT8ueyVSUACeE9C0AIP0X78AZxVvycrF8ZsbPx19WZVttNBOU05ojV5D+LMHCM89A2+h/jD/J0UAS12OlRk4rQYirHxhvQurkbbyTY=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by BN0PR10MB4856.namprd10.prod.outlook.com (2603:10b6:408:12b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 19:06:29 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:29 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 20/20] doc: Add rawfbt provider documentation
Date: Fri, 26 Sep 2025 15:05:57 -0400
Message-Id: <20250926190557.8485-20-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0068.namprd05.prod.outlook.com
 (2603:10b6:a03:332::13) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|BN0PR10MB4856:EE_
X-MS-Office365-Filtering-Correlation-Id: 34bbdb9f-e190-48c7-5447-08ddfd2fcc46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aDj4fnlMfhas2Okzd7rolGX9mrna+KLMVm1VnqauZBOHi+cvWCvp2A94A2n8?=
 =?us-ascii?Q?KhTqYbZuYmsPjR16UCUXG09Nyv8d/JA4ZdMbroaWmJ2EsJaj+ll0ErydpnuT?=
 =?us-ascii?Q?1xJtOcimylWiblhrbiwczZwMMwHUuaewEZnW1G9rG7r6bBQKvPbpBAylp02w?=
 =?us-ascii?Q?wNj5D2jDBXhL4hmAIOi4W3f9wwy84EBkEmvSHIDfbRq/t8a0Bh8B1kTHvlRP?=
 =?us-ascii?Q?Cw113UzhzS7UfcN2vniEq1xFfTYdov3UVNgfh+RDSAAqOeHavdSDYsWKU75Q?=
 =?us-ascii?Q?pmhE2swLdM+JcvRZeFF/CWsTGUH/STJedtSrZqMtpiB77p3f6WfLHeANXYzl?=
 =?us-ascii?Q?cTHF96XP+mSzseZGXGZk8v7d7Qe75kT1VxC+/RCEz2TNN28T5JMQWf6RvPhS?=
 =?us-ascii?Q?pc7oJ2zG6X2sKd/rOrlXiQCEv1rrpzlB2YDj3ZYbeWxQQNUFzsXM/MuANeJ4?=
 =?us-ascii?Q?UyugNqh673Pl6vb8xRftlBRYY/JuH2Jeh5fXT82Q102VWT62uUIlA6GSkGy8?=
 =?us-ascii?Q?zDXBaehbRWBhDFsUJl6gWz+l6TC8p3vC7y5+2mY8xa1MUdeB+V4QCyX4P+Jx?=
 =?us-ascii?Q?8c22v+WjrcqqZaP9qINymSNy8Yf4hkmX+lumqCCLlA1cVFpAViuNTCgW431F?=
 =?us-ascii?Q?MP41Kx+SHWotMSKXGLjgHWsiePt0osnNfkjpF9oSqmoaJBQeZU36JuMtwsR/?=
 =?us-ascii?Q?eAQf3GGNmPom3V4sLRbRRFje9CfHgVhWqLmabOdtwQ4inGJ93pJDBCK3KK11?=
 =?us-ascii?Q?H+3A+dzyXQRoJ0pFdJH2/qxS4ZFsUdSgKhXSpLgs1MfYP3TFdVR7lIu8L7ez?=
 =?us-ascii?Q?eidJaiUeVj6yxoJeCFlsT3NS2i/aTtoWBgfzCGS0smKxX6lWNORhRqiz8G/0?=
 =?us-ascii?Q?a18Q5elqp9vn8ENxoSGwNYg7ia+fH+KBzoGl2uO3DLG5+LZl9wtb/J4UBeQl?=
 =?us-ascii?Q?DxKJQxGf78K1XW+wc+jZ4HDZtzQ3ZDOwuqWAZunf02tzLXWU+HivhgXmQtei?=
 =?us-ascii?Q?riHCX7fVQXu6rvSte4s9Ih8PCIHvC+JhITOV+aFWta13Eo5WY/CP3iwue7cH?=
 =?us-ascii?Q?scQdgKkbzyABvs1rUMTsxkCgHcdVvUXv0djLY7YKHeNfJrLfFJ8d0GdjhU9T?=
 =?us-ascii?Q?3hc/NLLkBspSZ1oMMW4bfzzgZD3ZeJKePhc8wRNORmz0R9DDW8VruABO5sxt?=
 =?us-ascii?Q?YLGwc3vi2wriSXBDAZ8N249mfB71H0FgV6abXRCRo+Oi+p85+M0yyfGsvBjZ?=
 =?us-ascii?Q?y0JTqA2b8TT0RpEf6eSI2+urjiddlZQLDSM4SPHFiCUveQSlCUW9Dbe1k46x?=
 =?us-ascii?Q?cT4C1V14tgat94ZznibKpuGSpdbn0kh8dy+//s3lSFIyFEEMWfCKPI+qnOrp?=
 =?us-ascii?Q?AjBQY75qv4cxtYD6FmYI0KwZUbqtk+nkE9lLu2OgdvF4ORkVuuyzRgFqJvDP?=
 =?us-ascii?Q?DEv5h3li1i828BpqSrsOsnkZqzo/FETn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DW42kE8VnbjLRFso9VZ5HD60i8Nn/e2hlCAEQ9EohwCIKos21jXua3NIPwhA?=
 =?us-ascii?Q?6siittBo76r74Pb5MMYw2D+wgLgRhgAkDVafnii/e5uWQ3ING2Tzmt33BmPP?=
 =?us-ascii?Q?FzcQXGuI4zhYBmuqXG2eBL0Fc2v/NaLUlUw2HjTxIdbUv4ih5mcbjkroxMJn?=
 =?us-ascii?Q?uNyg6wSK+9gbRIvb/o+TeaxN6PAYifG8+ymQwZTmYdxsa43wcHREpbt3HS0z?=
 =?us-ascii?Q?7rxXgGdpJZgCgS7NxHyOSFF+ZODaXQpxlDHxMIqnlrrOpSuh605HL5UPIPM7?=
 =?us-ascii?Q?xK8PGGKJEV25lPQIjbe9mDSV8fEjnmJpn04QOtRQagBrjGFBMFIo9cvOGLGq?=
 =?us-ascii?Q?hsYQTMjjDiAEYfFH0hwansCuBJM6YFcgsoBBd3MFuj8UHeWrBUCD+4F1V1qS?=
 =?us-ascii?Q?HAMiF4kvuH0RtgOvMFinOjGWYFWZX9w471bUswPfb3qWG3gdtbXWqvqAfPgI?=
 =?us-ascii?Q?76KpGe4uu+qaRImhLkDqvVzo4w9GGTnjvQfwTW3oMFPSEU8DSS68dv3TFFHq?=
 =?us-ascii?Q?c5g8AQbEHzd6S/EcQECLcGz8aNGs4kVW8aHtKlKhvBfkLyGOgOdixJ1epqnl?=
 =?us-ascii?Q?M+B5ShfHK5iwftXwQUC/d4SApuUW1L7I3zygUwSDhHls622jU8jfVenZimu+?=
 =?us-ascii?Q?1l/frCVUkQJxwlGUG/ub+xAIj0asIJbAHUG7aFboCpMxGiyuSGUFFeneMNL9?=
 =?us-ascii?Q?Mhz+qg6QJYlrPljBME4QX6qZWu1HdVBiVBBUL+z6L3MrEXhk3tTEkunrncd2?=
 =?us-ascii?Q?uCv4YvYTZsNWtRZqibYemhvJ469tUhJe4YoR9N6HGywPp5x6kue9waXfakGy?=
 =?us-ascii?Q?5ZcAjcPs6AzloYfUZGEXabdYXnYjuMplhsFDRNEvfsDarebavMMcsVn0Y7JM?=
 =?us-ascii?Q?rjrVVi5r89UR4GMSZPAilf5ibVuehYbS7SQD4tTBDZyubf2jv6KF4RIC4ps3?=
 =?us-ascii?Q?3pnw71e4RpghEN43wTsqmiCHp3FhtxDFGoyjTsZD42KV+mhl9qoyowQO3BMm?=
 =?us-ascii?Q?P5oF0atGkl8N/XBzkrPdigKyGJ9X/Ye0G+SntHahqGNmURLpVyalV72q1MQP?=
 =?us-ascii?Q?dVp+V8dj/jhBt2BkzlgwLzVcAHpvw9sR2TZSZiX04cSVTcsnAc/DDeD3oeML?=
 =?us-ascii?Q?0UNbwj8Igd5CDvcYMaWaGf64ph0AFWC6OF/gAw7xznpOWR7hVwB2baSz2MZ8?=
 =?us-ascii?Q?6SXUm6bhYVqK159vk5rNfVMu3FCBs3qhmSEccg/gFRdXKMIj5eEol+wirTdG?=
 =?us-ascii?Q?bZA6GzuiOabXQwtXT92adRah/aiL1lWmy8VpUtoMX/aOSSDVMZjneV9OXSio?=
 =?us-ascii?Q?UdBKdUi/k1WiC31mUJjKcT6uz5MlwLusS45tSI+gYPr0vE0pfQNibMYKBJ60?=
 =?us-ascii?Q?mpEFOVI02rxkhiYaxo48LHmt6skDTgSF8WMCCejEd7GlFG3gGVWhU41JIfS8?=
 =?us-ascii?Q?u1faEp2kr72A8sM993pm+x9cI6J5MYKSoUFu4p6ozELUZ23UcAjV2QYks3UI?=
 =?us-ascii?Q?A62d6qoIpzbYr3QL1ZN03COdnJWner1Za39PBaRUf54rZHzxXPbeW6UMEfjO?=
 =?us-ascii?Q?dwxkJMCtN2DCCSnqnTk3fAS7Xakdy0kwDNQ0nGOZ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	k8tEhMXpD1D0bXTD3QmIescQghmiOmezGaCJYU5llgwdQjNYAxTyiefokPkcTM0/xNond37U1iadG0CmXCn1x7zHvHBYoKWc2eQon2Xhc5xySHZPILU750UBRzbycLDoop485NVYgZydCD5GbRJpxc0QRMQVm1dQNi9ca6+wkMIGYg3gLz1Mi1gReuT4EVLCIT4d9oq6F5HT6AxGBFoiKvukV+OxGNPxdc2g/xTifAZ44Z4E7pcuxHDJpWnM4Ou3GZ+zyRlzgjZU30ZH2kNipPPgB7eqhOg7s32ubt3xxCwtj3b1SG0IP/cm8iNszfjtsYeLU0YKrXO3/TVjDgE85mkmUjJaL2hRwOEvLZHdGOBwJ+zQkYsVjvGiL4OQ2nuHIj1kELcHrdSHs1QS9ukMody2mYG7JUlKeucz4qSrob/9HqFl/kcLH7+l8cPOT3o/oyfaJBhTKnSYWncj9uxkjbmr6ZY9hOLXrpczpD2T1ee/ZNJ7cdWFlMWrIf/B2MMOKsoXSuFdfav5C5i/jTqAS8sGNQDrGH56IKuWEKtbkFyhqchsM7nKOopSUamNvbgvUMRhfbfqUxiL9bJtmtU0dcgKHOL7Xk6ZMdDmFbort/g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bbdb9f-e190-48c7-5447-08ddfd2fcc46
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:29.0717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4erVVthsmPR3v5FlZhx+qi1cJe6QnfoOdr39++Kly8JUH1QEdl30i4fawSfJrya0QIiTQ6esEMsbpfmSs7mEqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4856
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-ORIG-GUID: ZYqfig7Lyz9gDfmTyN9gj6qrFkPA5cZS
X-Authority-Analysis: v=2.4 cv=C+rkCAP+ c=1 sm=1 tr=0 ts=68d6e43b cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=m10Ym3WaeA1xgpp6jUgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE1OSBTYWx0ZWRfX9ERSLVpBUvYK
 WI9yOczqnPhsoPF6CHnPNh0b7N8GRi6lAHQNtXdKJ2bfeODZSaMoSDgwz3R4iWIQe1p1M4oOsPG
 aWjiR3A6m2rNwT4cXH5t/uqYBLY4Y278cuRBZFUI0hKdp9o0oAs+8dSjotc1zQnyEgbLC7VGwpk
 vwSnoS4haaRy7W1mBqvwq6hHOIbWRFnjXSnER2wuAeOim2VMNu7PB8N847IXzi+lsi4/jJm26H/
 urUtvRnlrM9+CJC3Gb0hI9+Gnj19xdzNjS2tCghU3NHgqtHdiaiqDc/tz7f+NoBRtmzq50jUUBg
 kEsTcDMFg2uSVF9waPdfjHPo37yh3txqC+tBkTPf0KUSckY6YvHHpTAX3XAixikd7Hyp3ND+ZTo
 sdpXG9jRR37B6K7B4Bf0bwSYhkB0ww==
X-Proofpoint-GUID: ZYqfig7Lyz9gDfmTyN9gj6qrFkPA5cZS

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/index.md                        |  4 ++
 doc/userguide/reference/dtrace_providers.md   |  2 +
 .../reference/dtrace_providers_rawfbt.md      | 51 +++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 doc/userguide/reference/dtrace_providers_rawfbt.md

diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index 4eb682a8a..d76c4bed4 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -241,6 +241,10 @@
         -   [profile Probe Arguments](reference/dtrace_providers_profile.md#profile-probe-arguments)
         -   [profile Probe Creation](reference/dtrace_providers_profile.md#profile-probe-creation)
         -   [profile Stability](reference/dtrace_providers_profile.md#prof-stability)
+    -   [Raw FBT Provider](reference/dtrace_providers_rawfbt.md)
+        -   [rawfbt Probes](reference/dtrace_providers_rawfbt.md#rawfbt-probes)
+        -   [rawfbt Probe Arguments](reference/dtrace_providers_rawfbt.md#rawfbt-probe-arguments)
+        -   [rawfbt Stability](reference/dtrace_providers_rawfbt.md#rawfbt-stability)
     -   [Rawtp Provider](reference/dtrace_providers_rawtp.md)
         -   [rawtp Stability](reference/dtrace_providers_rawtp.md#rawtp-stability)
     -   [Sched Provider](reference/dtrace_providers_sched.md)
diff --git a/doc/userguide/reference/dtrace_providers.md b/doc/userguide/reference/dtrace_providers.md
index 450adf9bb..6d9d29131 100644
--- a/doc/userguide/reference/dtrace_providers.md
+++ b/doc/userguide/reference/dtrace_providers.md
@@ -21,6 +21,8 @@ The `pid` provider traces a user process, both function `entry` and `return`, an
 The `proc` provider makes available the probes that pertain to the following activities: process creation and termination, LWP creation and termination, execution of new program images, and signal sending and handling.
 -   **[Profile Provider](../reference/dtrace_providers_profile.md)**
 The `profile` provider includes probes that are associated with an interrupt that fires at some regular, specified time interval.
+-   **[Raw FBT Provider](../reference/dtrace_providers_rawfbt.md)**  
+The `rawfbt` provider is a version of the `fbt` provider based on kprobes and allowing probing of synthetic function variants generated by the compiler.
 -   **[Rawtp Provider](../reference/dtrace_providers_rawtp.md)**  
 The `rawtp` provider gives DTrace users access to the raw tracepoints exposed by the kernel tracing system, including access to the untranslated arguments of the associated tracepoint events.
 -   **[Sched Provider](../reference/dtrace_providers_sched.md)**
diff --git a/doc/userguide/reference/dtrace_providers_rawfbt.md b/doc/userguide/reference/dtrace_providers_rawfbt.md
new file mode 100644
index 000000000..9e4d5bf3c
--- /dev/null
+++ b/doc/userguide/reference/dtrace_providers_rawfbt.md
@@ -0,0 +1,51 @@
+
+# Raw FBT Provider
+
+The [fbt provider](../reference/dtrace_providers_fbt.md) consists of
+probes that are associated with the entry to and return from most functions
+in the Linux kernel.  It does not support tracing synthetic functions,
+that is, compiler-generated functions with a . in their name.
+
+In contrast, the `rawfbt` provider implements a variant of the FBT provider
+and always uses kprobes.  It does allow tracing of synthetic functions, such
+as compiler-generated optimized variants of functions with . suffixes.
+
+You can see the raw FBT probes on your system with:
+
+```
+sudo dtrace -lP rawfbt
+```
+
+As with the `fbt` provider, there could be tens of thousands of probes,
+and effective use requires knowledge of the kernel implementation.
+
+**Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
+
+## rawfbt Probes
+
+The module name of a `rawfbt` probe is `vmlinux` for built-in modules.
+The function name is the probed function.
+The probe name is either `entry` or `return`.
+
+## rawfbt Probe Arguments
+
+The arguments to `entry` probes are the same as the arguments to the corresponding operating system kernel function.
+These arguments can be accessed as `int64_t` values by using the `arg0`, `arg1`, `arg2`, ... variables.
+
+If the function has a return value, the return value is stored in `arg1` of the `return` probe.
+If a function doesn't have a return value, `arg1` isn't defined.
+
+There are no typed `args[]` arguments for any `rawfbt` probes.
+
+## rawfbt Stability
+
+The `rawfbt` provider uses DTrace's stability mechanism to describe its stabilities.
+These stability values are listed in the following table.
+
+| Element   | Name Stability | Data Stability | Dependency Class |
+| :---      | :---           | :---           | :---             |
+| Provider  | Evolving       | Evolving       | Common           |
+| Module    | Private        | Private        | Unknown          |
+| Function  | Private        | Private        | ISA              |
+| Name      | Evolving       | Evolving       | Common           |
+| Arguments | Private        | Private        | ISA              |
-- 
2.47.3

