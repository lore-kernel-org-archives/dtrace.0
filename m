Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E9F34AB1E
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 19:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768591959; cv=fail; b=lLCUEvDqBjeOlHpzUt/RQ1ugCbJ7qMM310IaGAuUxUm1RfV0291yq0MgwQA/CHrCe34uAvq87fpUuA7x3sKfA+Sbh4prmMUFhdUeeedEohsj7LODZYftRKCo7cCwPnxbsMDWkfcBDiaxgqc1qKpERCpRJAotG4+howuAyPq3jYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768591959; c=relaxed/simple;
	bh=1hB7KEvODEIgaRVH6Q2UQzvlTfNLFjadN8TVZ0dWE/8=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=u8bAmmPDOaC1N9P7ET93Y+m6wddgPL8X5JqJZBiGcWyK9RwE5HluwhU64R5KQISNj6zT/8MkrR8RrSjeMf+ba/HowRxYqihrn9AufdbP+qmuleuVTx4eV25DggS0MMwxQAgaGu1mm6x/NJZp674+ANcmKpzVDLr2pQaS8EcY2zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PsTEFW2G; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=bT+r02IA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PsTEFW2G";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="bT+r02IA"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GEEkjH1430382
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 19:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=iVITAUF8RSF0SM8A49+8wUMHL3pHIiEhTazER4hkUhU=; b=
	PsTEFW2G3t4Nh1s342srGffmnL3NNlrD0+Q+iGauihTmFst7p0LrA9sUC4PjMl0M
	p+SchgCQV9o6HO1vngzDR274P15ftCT6Cw+dupVzmOW8qBXHIW2QpYOZHH9ZrurZ
	TMBeXA7RrtRn3gN6HbSe+IvW/jLap8tTeLuz4lZueR8gsWA+P25eob6Z6IpzdDZL
	UGtjdPTcVo84WO/CJpGHsALFPT/QaqewgH0Tha7UnUCC8solF0L53SCLRo5sWwsM
	UZY4kEjQJnPPTbruuB24AlIkBm418/UFB0QxUtEKedOCklWg7KVyWAYZ/Nqt9inm
	EZxZ7Ws+7deBRfmImFbb8g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkre42kjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 19:32:33 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60GHVKg3035388
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 19:32:33 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011061.outbound.protection.outlook.com [40.93.194.61])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7d9ujs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 16 Jan 2026 19:32:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rnzdwzySaj5ZQAhu0Q5HU+DlQcx1rI7AL6fTb0wFizoQ26gOq6+7b8PPHb9Prp8mCCH1ivKnyy4cM6gWZwZ8Rma4XT7XxTL5DUVVynQ1c5g3ned0MsLdrzWZmjS2V7B0YVrS6IYb/J4CxP7EEI1sPMTTjd2Oxl79dVbuvJVdWeuSqET47bMSCi0MM4frtFa9rn1dS2uDxZxokCvwWJEAMU9HzYTIntPjDjhShDe8/1lyl4T1z8nc1/QPj2dpC3mArJiWXtpHaKR6XTTDPQTUB3L4FreK6LY+rvEf2zB/CnJeYU7YCir9AY0ZmwvpaFJ0IfwTrt07qYZxh6WG2Zotxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVITAUF8RSF0SM8A49+8wUMHL3pHIiEhTazER4hkUhU=;
 b=zAALGatn297RRLQVz6aQnWEn+bFRsid3Fz5D3iQLuNZKuzkedezx4VOW5yCacQQkz7Y0p9gdFcC+34vxRS1//apPOMw/Q9F+K+hsWIggbFnXxiMDV8LO5kX42hqNiy8VItzY5eJlBDRuh+D9T3WpO3Nh6a8urYj+OfiLwmJZR3U2TSrQjna65t30PFcVWALqYYTBxKqcbsAhAl5INTTFgYQed3sdkwTi4CGidNye8zohO1dXeWe6frNakO94+z5w6fIKf7JvhCIdTyHo1GIiw3UiLg17ZUmYr69knpn1c/TTzHcVIJsSgYKDlmsNbFmzao9DIvr7rdZgfCOdQ6M9Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVITAUF8RSF0SM8A49+8wUMHL3pHIiEhTazER4hkUhU=;
 b=bT+r02IA6BxBFeUCuBCVtJrMREQ7+90+GzK/5f6SQ0J6/vAWE5k4q1mSnTOJOaD/hZZUWRI7ttzxFnCQlC3O0FNYjvzZuQNVglq6/Vas9gsPlu1AekihH4WnUCl6MeHbZJ0/9HS/qki3nwigCQyny0XJ3Bmy4SOIkNnl+Nailzo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CH2PR10MB4264.namprd10.prod.outlook.com (2603:10b6:610:aa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 19:32:29 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 19:32:29 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Remove obsolete reference to dt_prov_rawfbt.c
Date: Fri, 16 Jan 2026 14:32:28 -0500
Message-Id: <20260116193228.20581-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0043.namprd02.prod.outlook.com
 (2603:10b6:a03:54::20) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CH2PR10MB4264:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ea30f9-4df5-4a7c-0868-08de5535fca7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?yWM+OgzNlKp14SPXWxJzwoMrn+BqQKjAcnr5BJLhMaa4cSgct0RFFAuvhZu2?=
 =?us-ascii?Q?KipDWvXKkGh64txeqFm0eis8/XpW7hmVZUOKnGlaM1JmfCzTYwQFsGozhscb?=
 =?us-ascii?Q?v0bduD4vvrNlx1KeMJ7g4+KiLpjwSYGmtR/m2J1spFDeq10Uj/+W+lIsUd5p?=
 =?us-ascii?Q?8IHhaEDRNQjaCWzOP7fJAzHp3UEnUtpHd3x1WaPEbVv5KDF1dIlBhSBhPSqq?=
 =?us-ascii?Q?7MmR6NvLOzGq1ZkmPJXqatA3nVGmuHwV+wuKqAXwrmq/3rxB3VSoYCVTxPue?=
 =?us-ascii?Q?NDR9HXk7bF5WQpDtmtAkObRVu6feGhJlj6C3zssjLBMfiGsYMhWnDRn+M8Cu?=
 =?us-ascii?Q?00cQsSiMk8tUGtwKfNxcQRAZ5ndEjlmSzDwttiytvNr4/7QaTwCidaS0SYQ4?=
 =?us-ascii?Q?aR0HvCpDHnmpjq7WcZvOXjh0P256cdpEYW+cp2TDoMShDyxof8OAsvbC2r4M?=
 =?us-ascii?Q?0lYE1t5O4RBzAmYq578Iqh/iZMZy9z10t2p3f5GPvxwiVKOIejkS8jtYeQYk?=
 =?us-ascii?Q?FcI7QQ9G86RnlHABk0dmYeCyanG0TH+ytDU0LxX/uifNsXhsZSKgS2KL12+e?=
 =?us-ascii?Q?8f6mokSgKtmk4HquTt167c5iI+a6qx4suBnBjvb4QYmPk2SWiaqutzrVU68B?=
 =?us-ascii?Q?VFNemA4T23eCEKr1qu8lalyXKLoauy4Ihz3TdQoK8sn6Fc17KnSmykLWEOkj?=
 =?us-ascii?Q?nEOamb57nn1X8w/jsbPmcoaWuqRRcGJlp3JysIKwREfpAelMLxRuj9iM7zNB?=
 =?us-ascii?Q?YEcPZS63Jkv5kgsiMpvlnqHF1NOZtc7FZnFVVuvkDnDzRoO0Lf/xmJCrRUT0?=
 =?us-ascii?Q?Y/EJ5KkxGGS6oZ7tz7RUe1x8tudBwv4KOFYKxyNvJnpVZGwzffdcGFnandxu?=
 =?us-ascii?Q?ROym67j9u71yK26zMoWPRHeTeiBDgav2VVZGvF43qtg0s3y0Fa2ya+KuLlOv?=
 =?us-ascii?Q?KAv/ahFQUGw4vhHYTaTc45QbFWLEyeP5/eQQlxUrY/tIs12dB6tnXjuE3d00?=
 =?us-ascii?Q?2DJOnoenfJJWpScLT0YUD/MOfRgyb/ru0uc94ywqSFG8gov71EsJcjZ1aC5D?=
 =?us-ascii?Q?1rsF08PX2B5BC9DYecEeYp53R885nySuz+9lZ76mYOvcNk/n3LsxUS7hiLGn?=
 =?us-ascii?Q?UxH5rgkUXsVfm9bjD+7Fi5dyYVfwdvipoIIJUqpptRMab+/GwWYnbwvPT+oC?=
 =?us-ascii?Q?e9LEOnXs/yjA6IBBOxWOpVmZVvwqpau1M9gHrc7ZXLC8ezIP+UX32X9HXRVr?=
 =?us-ascii?Q?BVJvKz/bbj05vKY9yX+iaA/6rvsQm6X9XUa6ojxcszsqudqjcVzcdB6yDHEh?=
 =?us-ascii?Q?EIQ9PpW2xbyCtaF51sPyTmcoxFwgKClr9GHjlqqkSsMnSer03N5hDHlN/uFX?=
 =?us-ascii?Q?+dDfYLSEvCM+ro+D6Xpw8tcmZzDjopyTdNH8zeQhtWYWIwrhXheIKOukSMkB?=
 =?us-ascii?Q?gyJ5WK2pUKFXxgpo6fRt+aZkIHsfjq1VQ+6D5tj7IknqWx/ijr3EqlV3zZWF?=
 =?us-ascii?Q?jpsy+MiOUJrvVvyFyVzjkrrnhTGpycGtP4eZ+TOFBfvQCrZTS0Qbno6E2v06?=
 =?us-ascii?Q?fdAX2COW13HrWiktqJuwU8PUx0EZMrNaGdkCejih?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?G3Wa8BSAInzD7f6VxM02JBtk7qBAZYbT/eXDMDjQp9bbGV0kbB8XhwGpjk2Y?=
 =?us-ascii?Q?o1AmR+Xe5hULNguOkaciQn4WbJqI8In+XO6VYiiCAxf3KVZv2cljexZXDNNG?=
 =?us-ascii?Q?oydN06/V+4WebQD8rE8lCYiI3luffRsviV4JIGsA6Xt39xPytF7cuGix+ia1?=
 =?us-ascii?Q?zOfo4OzlJ6bHjeoFNo9aC7CWu4vJU41QgjlOfK1Zf8kj7swrZ1VxvGYxjlFM?=
 =?us-ascii?Q?Dtdy7+CzsCTykPO/n5i0S5tM/yCsHLehysFK4Pw+JPMl2EW3rd7cgsbtXijD?=
 =?us-ascii?Q?oUuOspp13p/kTRNhwvYoeHR4uSWrrNkFwCdgMUUs5yBGSn5GsN8YJXp0CCJf?=
 =?us-ascii?Q?O/EixoW8IU5+Fvb/C66nSjm6UI8TVudZBhRnWQTPk1qIVlRarpxQ3cXwjePo?=
 =?us-ascii?Q?rBeQg0bjdoZaTPENSMGxYQNME7MDhzhbSeeZ/5MeOHW0h/qDy6uniyf+LxUM?=
 =?us-ascii?Q?EU5KAGEgqY6jYIhkjn3bcNlTgDWSP0+xrkID16xxaHLu23NuS48+ZBAc8ETk?=
 =?us-ascii?Q?AGFQ+zBZtMsm93ax+xG7s4CyRmCgfsrPt2PiBmJcLdgST57dCQ6BT+VArXpQ?=
 =?us-ascii?Q?JHn+kuhD4/dw/XzkYY8UJdSyvK18EobKeEeg5inGO2M+CrvG3s59FnEI/5j3?=
 =?us-ascii?Q?7QDmneVKHWmKfwL6VmtbTE+icsCBv5r17ZYP17WcnOzZpIBC73xrlQ1VD4IK?=
 =?us-ascii?Q?whHYGPtQCbcVHBQGxmS1UZRGdw3fayBnwd9G4T9fyQVxIgY8jzneIvZ+OYbw?=
 =?us-ascii?Q?JHYvvlRKSBvJaPOAZkYZj2jogpsLhpP9sTYkg5N56ym6Q3YwNT4pmu07o64T?=
 =?us-ascii?Q?HZ1YEZRtelNSeMVfTMok1Z0OoBN0ltx3brGR3EYYM3Dhr+1/W1O7x8/Eaq54?=
 =?us-ascii?Q?YPbox6dJYYoTTEINxphGYYfStJYPxblOqBEFcMujZ2smf0oYs5UUzFsXrJld?=
 =?us-ascii?Q?Ie0qADMEONHX31NaIAmZPWprtHwB1c4HHp8mJqgi4fXyEwD4PL/9/5idGyIs?=
 =?us-ascii?Q?kkloPfUbIoDlDERWS+A975dfcVpIDS/mXSgrTPbOA572K4fCMt5yfsfrvzQ4?=
 =?us-ascii?Q?XTRqrs/GzaaRMMzMKBvsyjRme1Q+qqZD0sVg8GIvBddKxGQYjgpCKD/nel67?=
 =?us-ascii?Q?hxjtsGqQWkM/cPqKLq+C2y7MpzisH+5w5eImZfb3an4mKELfO46IgKtqtuIG?=
 =?us-ascii?Q?BekD2yGOGM7mKaag3oLDch1XCR0XqRcncFNaIf54Y81avIupsk8HhrASNE4O?=
 =?us-ascii?Q?fZos7dgYXKf93ZCs5wRSt3W3BVppxE5nqIPZdyJDWCx7ZVANuTC3wrI3/1WQ?=
 =?us-ascii?Q?S2BUZFMP9vOLOFpP7WTdz5mjGgIX9if6iqapcr3R/WzaShqkJyOUy+iaKKHL?=
 =?us-ascii?Q?t11J1GUAIMAKfmeSlumsHIm3Ee07J4IzfLd01gHX01gzJHpI5Tysn2t9rjCj?=
 =?us-ascii?Q?HpToOXBl3o2x0BEmPgY1M4yBZynRzTlxz3vzQAFOfnvLe0JxiNxdcrWrNWHn?=
 =?us-ascii?Q?vZCBWODlk1sJvjhq2SNRFyg0AKTRaSCtPcNUjFo1u1Diq35XULcmD/zUtbBT?=
 =?us-ascii?Q?KKonPgyDiufWhaj35DmSHitdZU6N2daYuQS/VFo3BosOO2oNJ/t9ihDCbhcA?=
 =?us-ascii?Q?h0b7ydQHPOKimPcHKN497aI5PUtgKM/KP0C47gftmu57Z5y5io/JuqXRJaX0?=
 =?us-ascii?Q?ykjKkjI6P0IcT4SBG0m8J0acTSvSZ2XSUPrflsIenlo6wQGY3fdzRYVErodH?=
 =?us-ascii?Q?SJn+FwgF9g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
 KYUHqNI5Rdrg//v7Bravtci2cXsne25FkdEOEhfanwROvdJ24adwc0I5hr0tai5PqezG7Ve8NPSVfy8GFaA2ZuBdeQMbqyskMyaOpo+KTYqOs0nkN2L5D3Y/qQGU3hZ93roVKFEvpJSsanHVPrTqvGiiJiu9v+nuQ5ml+Dsu6v2pPpQPk789s12m9ELrXl9y2gK9JZJOfdNrh40H+Lk3nAY1MWgkJVEau6ih+wpiw9rVFdgmzbWhrAeVEFfB8SR0RKv1CisvQGSZldMZhR85k+QO071zrHSYOM8RgaBkG0SqyjGBIbsijbVvFBKgcZVjuTC4odaIq/X/qEMlZiK7AReQSi19NAfzps+PIbtMzY83koCeNgjtobw6XoTimFSu3U5SnO1ljgJisKvCcf0V7WmTgYTnAEVRMMa/HSmfJLqN16bLJx5WyqZanl7ukhQ1G2yWPG3xUR0/EAYFQ7rNgWMF0O2xQdJ4jp6hzVvKZKQrVBATK791KSADAuzhFZXZ3s1nAqH/druo/qjHB+8Yn4Qu4drhIJBIiHAqg8X4dueHxJro4xp0YCgu6hRQvYjr9VIXM7HTn8HdCpAU4NyJlM2tvW6P36L298zG2+TNvRE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ea30f9-4df5-4a7c-0868-08de5535fca7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 19:32:29.5361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XrPe4pl8EPpowVICtJAUjRv8z9YxIjNmfbpOfoKYO4WTPmkO1JOQQ2Ma2UGOxgHtdCaemxA7YGpSL85wa618vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4264
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601160145
X-Proofpoint-ORIG-GUID: Kx6WwnGTGejfsV1SeJon5ru56cezqsX3
X-Authority-Analysis: v=2.4 cv=YKOSCBGx c=1 sm=1 tr=0 ts=696a9251 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=6R_V80ZCcWGX8p_av34A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE0NSBTYWx0ZWRfXz+tYjyRobngr
 yctIhAJNPVNNe1+Pv0NlyitVsE3ffJgRWzLyrhL0Gzd4K3lMC3xyZt3IUsQ47E/xThQ9hKt4uQv
 hnaRekJq95J9rl1pY6xcewFJRXuuyOo1w4YY2dQvzkWCyxJ6Hae6mOfdlsB0LekYld03ES4/44G
 cNE8FT+1P79T3i4UYSIfnOdOmoiqA5CbAN3WFweCkmrT1ZVzzD2X88RKK3XODDrC6TThGigs0xW
 wi6Nth6kVkgshyU8EKgX4fglxE2CJG7/ZWwigTxrjGHfrjUVPpg6akrVaKeqzMc2o0heA0iqOWy
 ARR5ZtIopGnW0G3WyVPnnMk6cizUL1ddtGi80f4PWsSsZVY34ysvSYKgEm/bi0786X3mFwo43YM
 Y8NluHrHkQxdfjLMejqJesA/TV99yfzxJ6bxe18Ppr4bJrWb3u9phAbuzoRSk8uS4STejdW6wQW
 qM+ZXmndEAnGuV3S9kw==
X-Proofpoint-GUID: Kx6WwnGTGejfsV1SeJon5ru56cezqsX3

From: Eugene Loh <eugene.loh@oracle.com>

In commit 0b7c5a6327 ("fbt, rawfbt: consolidate code to avoid duplication"),
the file dt_prov_rawfbt.c was removed.  Remove the remaining reference
to this file.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/Build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/libdtrace/Build b/libdtrace/Build
index 90613e9d7..3a6c04664 100644
--- a/libdtrace/Build
+++ b/libdtrace/Build
@@ -1,5 +1,5 @@
 # Oracle Linux DTrace.
-# Copyright (c) 2011, 2025, Oracle and/or its affiliates. All rights reserved.
+# Copyright (c) 2011, 2026, Oracle and/or its affiliates. All rights reserved.
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 
@@ -115,7 +115,6 @@ dt_prov_ip.c_CFLAGS := -Wno-pedantic
 dt_prov_lockstat.c_CFLAGS := -Wno-pedantic
 dt_prov_proc.c_CFLAGS := -Wno-pedantic
 dt_prov_profile.c_CFLAGS := -Wno-pedantic
-dt_prov_rawfbt.c_CFLAGS := -Wno-pedantic
 dt_prov_rawtp.c_CFLAGS := -Wno-pedantic
 dt_prov_sched.c_CFLAGS := -Wno-pedantic
 dt_prov_sdt.c_CFLAGS := -Wno-pedantic
-- 
2.47.3

