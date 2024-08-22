Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148FE3FC2
	for <dtrace@lists.linux.dev>; Thu, 22 Aug 2024 00:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724288223; cv=fail; b=W+VcqJWp2hknTPag4vnEZqdDcuyTUDwe7u+XSbxvytTXPvQ1tkzu61nlg4fuY40/ns+QWvKHrsPh/eSZjngAXSZ+jepjO51fvg55oAhy9evFeqZDEypYwvDe6g1vBIGVxQt5DK00WmomfkO36ux25wRaNzg6BODVMR6d0wsV0tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724288223; c=relaxed/simple;
	bh=rK3KfKBTB5VadqYqxiJlkIQs7pU/sFaKBwEYKxemqWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oTrzKf/5dVX1Xf9QIMOf1B59Q/yVoEbGLkiDBmtdlXYx/CxiZWTpVhh2tt0ojUHWYOWY5RflVOxASzfHIfnRNyFvuZa/UzVI2tcW30aoNOMQZVhnCfCjgTrQSfbOfGoNDQ7okTOmrQRf+JdWtiWv5smzOa4hp4/y8W1JZawgpls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ZV1VXd4+; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FngmK2zi; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZV1VXd4+";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FngmK2zi"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LKtXpD022880
	for <dtrace@lists.linux.dev>; Thu, 22 Aug 2024 00:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=d4NnNiAqRhFooHy
	aghxki4GvMp7xRDFASM2D46vVopA=; b=ZV1VXd4+lIw7j6SgYgnJkKrpaiRS9ov
	rCO6gPE63p0ea77ewY92aLyBTX/BHID9I7Xm54IGzWJw4UUK8okC9m9GE9FcTqfF
	Gxpr8Lgb3J97qvHu19HR/Vus5Wr6b321Hiy8wwPyTBNbcl2RUu8iPNUy7VGbbstK
	Sndu8xu16qP9Oq+aod79B9d+6InO+42nEEqi5yMR3e/gcK4nVnI0KiK+LXoKru01
	3pj4UM3b+OvUmDEM5pYc9H6OY2+eSrRfkHaajc5JNSlQF5kX5vPjVyVMB4/t7QzA
	4mNazLHGiKcaCZwfytJ5imSd0nwQmLI5t9XUsTxjhpJ91nB91d2ma3A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m45gvru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 Aug 2024 00:56:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47LNG7so012373
	for <dtrace@lists.linux.dev>; Thu, 22 Aug 2024 00:56:57 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 415sru2n45-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 22 Aug 2024 00:56:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMg76FK4lJcqrYvif5r5PKViKe0U2UlqzRPaDy4dkBu+nN7OmcDBIVyEMLXf/RORFSjp8sWuxO83xbEP2pSS9EyEE10SKOVE9uuEYup7Q+ohzdgVuJ8jDZtaINTwJk/gKvabB7hXcaMHK4vdXDzzhhcSBLhvawsn26jB3wOBFtg/haNqk86I3SQqGoTb8qnGjLa6ZNpf5roRjK7xTmFvw47zGPGnacb82tPh7oy2RCSHRGwgqbBv/qry3qjfjcDZpNpo/32v8O1EBj3p0DnNhmi8d8zp5F2S0PgXK6Sk0RFjmoUA1ZAHmoKqS4Ph6+gCycxCHM7tsSumCEndb85++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4NnNiAqRhFooHyaghxki4GvMp7xRDFASM2D46vVopA=;
 b=f3zHexpD8aJxbsmdH6K4yea31ukXyrMNaSS8AfWtDkOLYJvk2S9sLtyC1alAXEme8ofbiBXg1FQqzF8cA07ZHEmjinOdDtuFFOaFQqHB36yExkKX0YWBTbFbxsUvP9L/MxFJIEvmIduoHEVNRK4Sw2cAX0XFzmtG91Qn/6Lv2s2xDZ9AyLEiz6KbPVx45zRTX/em8RhMZbQbcYEYGapEExXUt7S+R23QdMS1WQyA9LbLn/blt2gZu2H4Tn5mkSz4zGB3nQrvLHLEFirS8li+IOsV7JeFaA6aspnmNkjxLVcjph7+GulqTrZXyytO/b06VZJXORvy57m/8FKMJCMUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4NnNiAqRhFooHyaghxki4GvMp7xRDFASM2D46vVopA=;
 b=FngmK2zi4eBDDpGul+9zo+6A5TIAjA4FjDUb5h7Ks1CUY5UwtkG6FzSxQ0j7/Le49gLpfgx8wdPkWOUCynuOxJpOG26L6h6F9T/Eto68vgccUqOgbrhRGxG1h41Nd6i4b6urGVJNFqn0FkQ/ayr0IGg4zNtU9Bdj40xoJ1ontNk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by LV3PR10MB8155.namprd10.prod.outlook.com (2603:10b6:408:28f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Thu, 22 Aug
 2024 00:56:53 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7897.007; Thu, 22 Aug 2024
 00:56:53 +0000
Date: Wed, 21 Aug 2024 20:56:50 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] ioctl: remove obsolete ioctl definitions and dead
 code that used them
Message-ID: <ZsaM0j13RnAB3F0H@oracle.com>
References: <SN7PR10MB628717A48FCC1BBB3B96F465C28E2@SN7PR10MB6287.namprd10.prod.outlook.com>
 <f7743a0a-1af8-fe4a-bd06-a45ff9c9e0d6@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7743a0a-1af8-fe4a-bd06-a45ff9c9e0d6@oracle.com>
X-ClientProxiedBy: BL1PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::34) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|LV3PR10MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: e80576f8-67df-45df-46c6-08dcc2454ff0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E1HoImI40mrvPWiqzjh6tkVs1/n+HHnPXYntX+QSXNSdpzNt3YebbJZmg1j2?=
 =?us-ascii?Q?MwkL7OQlWO2E763/ZX5SS/URiBqeVWreY9TSDLyaIpX9ufSE4l1jS+OIa7oo?=
 =?us-ascii?Q?sGAFDug8g1CNfJXJhteY1UAaHpk9roDX5n3AiVaZhwysMjH+2Ius85KTx3h0?=
 =?us-ascii?Q?GuMdg1KHhTJ2GnNCKzwx0s9kcrxhxWQI/JEG0zjk9cMcEyyQ86hGnZzKlDIH?=
 =?us-ascii?Q?yGrvlgAO4qo6PuKpG7ABdgqcjnkoyz/Sw1vw4wi5oZHg9vy/tGwr0nIeEILk?=
 =?us-ascii?Q?3X9Q3XqESMzAWS7pwmSMs9N/T0gnX0WRNYVMtuo6N+Gn6L/Yp2W3fQ2WsF4Z?=
 =?us-ascii?Q?GNBE8ULMD+HrNv4jqFEQvonNUZuIOJxkgEGqjp1NXlaf5xr8uxuTJxI0QmJJ?=
 =?us-ascii?Q?NXa0SzCv0HC94V2IpCEMmeBw97kshZckYmuUZYCf748JWfv1cVWqO8Csr99t?=
 =?us-ascii?Q?CzlDQ1hR6576tWOROhI6Hij/PhC6wcU5VOU7lBinDPoTlf51uw5CerL+hUpj?=
 =?us-ascii?Q?4YepWFsQ1DiBQ8lPR37WKIjjBfNgZTp4hxBQ/vkuxZI1Qg+w9pSfkJKmyu8E?=
 =?us-ascii?Q?cdppZbpgOPY8UfZiGVqM0zH/QJRYCLx2jpn/SO8dordQ6OlBDRhCBzk4HrwC?=
 =?us-ascii?Q?rXsYyz+CkY7n/t/GZwOj1KujO3QkwSkhSI29Jn4RZR/0c/BWdozuQYllrFi5?=
 =?us-ascii?Q?jchwR/fEssRs2x5OG3EcsaQ87OMEmoGQ2hZj1NU3K2d4thlx6UMmC57yDCIn?=
 =?us-ascii?Q?mW4KMFrb6j4W4qKIjpq9gfHUp+FvFTuZywiEvfs7XjZ0ftiLnsYuaVLSSDOT?=
 =?us-ascii?Q?5YnYZofOojVhT2BBkyxcPWZtyZZ9ZBXmS0r6wE6WE+Me5MY+3RKwgAtKRMze?=
 =?us-ascii?Q?dqoNUwGdbjw9OJq5rSRgFwnoNtvfX5/f7QWDknHqqCiSgnYQU7gCQao37J3B?=
 =?us-ascii?Q?nUj5PnibzPrb3vEZGEkxPS9Ks/m1kQEr3vLsh69Ntx419LoJZf5Csfna+bFR?=
 =?us-ascii?Q?rlApx+UPxIbN95J36fdouO77M1pVEQm49jhO703KQ4++LTgBELkxzRKcEdvw?=
 =?us-ascii?Q?OTJ6o0gLiHCCQJj0qzG0paimsOZ0irMpS533/p6UjNA3Q4rgyDzar8D5Wn2k?=
 =?us-ascii?Q?Qu6gOMwCkNhDLiOW732BEBGWdw155lk/mMbxKWB9iKRF4fbHambv19RlAm+D?=
 =?us-ascii?Q?HC/hdwKnlf4TZvoGIjcEL8yoL/QzViORFWqnfxmkzXFedx22+QzvdLR7+OmL?=
 =?us-ascii?Q?5KY4PMJ2Pjd5Ozro2JfzP11ijiNbJve6alkUjK/0Fh6QDV8DVqlFLxNDo5gn?=
 =?us-ascii?Q?EBw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JB2P5nHOlC/Fp7rgcuxR8Tq90ZUQMnGy3fhhjewfYDkLPpurgYLL+TUf6KPE?=
 =?us-ascii?Q?9JBvHZjN74m2Ic7xxjZ+EGrDVAiclcS2Ni9PV624RqwC/N7c+SOqu7qrqU5q?=
 =?us-ascii?Q?ec56b9R2Nrs235EhmLaSGU9sxPCIJyjAiqAcT4xmgYlpCaNqSXKa63jyXxF+?=
 =?us-ascii?Q?HeOONtfv5eY+dqR4sGtolXhgGgwL0FdMMGYIkiElr3++SebD+l7JtfINaJ+w?=
 =?us-ascii?Q?ZC46ymd5rTKfFBg3c5T2LrZUVclCLE9JcuzF/SPFv7I4BQBQcz+PVHBKneGD?=
 =?us-ascii?Q?SGnfGIULWBcrU2p3v8ntLv/MXTAGng1ggJDAEHPDlgEGuMjcktJQ7mdY9pvH?=
 =?us-ascii?Q?yv/yuNfdGz5Id32fVWDilWy6XSwH/ZbDvs553i8Zc0Xd0iVIm5BceywiCV96?=
 =?us-ascii?Q?QPbWmIU6IXiEXlaX0LkTQi5yrT8vXUy3pyLHSiggZIfiWY9posB6/n3tL2n/?=
 =?us-ascii?Q?5pwiG6rM1f02+e287ADKb1Dpv0izkSm/5SdLqDrhNm4ef6561vPc9Nq9ld8i?=
 =?us-ascii?Q?4ZaiBffPEHmHHmWfGkG2NgT//OTqujU8vJ+iAeIc04i0NOrBBGS7oipsoS0u?=
 =?us-ascii?Q?NWNekkgNXUbGlpuh6lhNqQLSLiWYgEsKTPUCRdhb2dOLaisNO1Nl3BzZvUcy?=
 =?us-ascii?Q?lKbuzNaCdsNFbmEguDXbBo8nsQJEtOHu14vk1SnEo/92QXKFY3nkp7KLFhXD?=
 =?us-ascii?Q?3rD9S2mfJNrOekoMyLjA944DSs3TNipa3PF4kTq2a7lyxl9pT+Cpqy8BKWGs?=
 =?us-ascii?Q?K4qT3dlACom6MxFfOrd5/Pl8cm4lzhfWuGQ1GkybdX5SMR/iZ+CC9AuISQ/n?=
 =?us-ascii?Q?NXOhW17Qv6M1oDFp6cDHOOAX8LjTropHohfWtZ/vK6Ob0qxEbeq7nDgNtxQX?=
 =?us-ascii?Q?gRrZvGPl9kJYiMbKarKX8yEskyMnzKCZPTDeGVlmCDPjYYKCD7qnaGEjXfpr?=
 =?us-ascii?Q?1Afk77m/CXH5w4TS6IgGwKix6hq/5RIWK/A4UjfT5iQcr2Btygkpovo2q+dx?=
 =?us-ascii?Q?Uyd8RYmBy6Rdf16Fuc1rlfmGlU9Y04t39kdcV1QzjZ//p8+ehgcWAALD1zeD?=
 =?us-ascii?Q?QMyAEs24EKtoXPH8LayZbi8BlqMXHmtikbbIh4dXNhqOPU+t+VXesGNykqv5?=
 =?us-ascii?Q?QoKrpyLaAe12Bk1bHa0p5xd218Js3z11TENlkIRu4zfq8hcfvJCk7yO06qJJ?=
 =?us-ascii?Q?V6MCKLQVJhJpd4DB5siMxRV5usbs+V+bns3KH6rnrDU71QtPZwMyen2kleu+?=
 =?us-ascii?Q?F3ghGZq5BvLckNjRYx5C0jfcg9G6IwcRE9EEBdoMCs55Rqk080rIE93u/GZo?=
 =?us-ascii?Q?KadRUgISDiCEz/5WZc0PTiSKfbYh4ufUv0eTwgGk//h025PGt3fnNCV+Vcuf?=
 =?us-ascii?Q?Ie0KMsC3rV4Zmy9Ui8PTkaPm9IcYncI5TfJrMDdGA5i+j3gvhUAhAS224sIH?=
 =?us-ascii?Q?/5KzXiyUAA3v0GYBYotBJKg0Ltr9f/oXdWySrIAMx2O6WMWAxPsbbb79gZpB?=
 =?us-ascii?Q?VUmv0OlWn2assKafqRF3WmHwgVZeV4uCwrYFcss4oxGtdgBj9NE6UO2rLPUm?=
 =?us-ascii?Q?uBOz9xYBxvFjLWXrvpUJwuFcUuOnzSY4/yOaihkq47SPp26oN5aKbJKtBfM8?=
 =?us-ascii?Q?fg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZW/FPPCZ03WDXhnrZF8hdIzOdubla/4bk/ywOl6G5gTSteAoJFQJR/PRP/Q8ZauQwyB6we91PELqbuHRDrGPlfJl2GStF2Sovh0vbZi/0ZbXGQZ5myM6ohNPL6tF5St/nO0pZk+61DiZXVKquqdGkX72c81DRfhK//ok09Wh3/hdhYHGEdSDHjPorykiiJsYDzBKR6xYMERioXGHw5kBdZM+LlzJmy4tJG2mRdBcHLco30KGnJR4Ee+lIsB2ugQiRNy02IRCWK/r+KwdXFVkeSAEj9L+fxl3cfCMTx6pEPR4JUgRElT+i1lC/QgKdz84MU3xGtjJKslRA/llLRrkZoNIbJfa7gCZOb/0mECylHksDYElpm/2/+RTLIxjh05lwNP5rItfLi5wKrALB9VUiNWY1B36g8EjPSCs367+U4WoWJYBun7W24V57AGmom6P2yJtvEwGgTHGDpMND1D5aY3ZgRonPp9HsLzIxp0IvB9bXgzsYEGwOECsKvgfDm5H6hqqhtEyrZBwbFRvGww4GLd55Q5/SxTe1t+9ehqYyK+uGlE7avQoJZ+Qb9zibUbCqKQGxpXI9cFskW9H1LTgUQ40SKuZE8reW1ffDiIgkzo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e80576f8-67df-45df-46c6-08dcc2454ff0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 00:56:53.2078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MiRiHLYEnzrmfCyqAaoObrVTuWA2CT52Kudl6pEEInZr21oLV7M2b+GIJQ6LncqK4affRV6S+w8bMrvS/tH9WLBIz1FVyTXw4bx+jXQESqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8155
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_17,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408220005
X-Proofpoint-ORIG-GUID: dB7Qvgs7cojtuHrZqkK5lGyn42PDbsH4
X-Proofpoint-GUID: dB7Qvgs7cojtuHrZqkK5lGyn42PDbsH4

On Wed, Aug 21, 2024 at 08:11:40PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> though maybe dt_options_load() should still be removed from dt_impl.h.

Ah yes, will do.  Thanks.

> On 8/21/24 18:47, Kris Van Hees wrote:
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   include/dtrace/dif.h         |   5 +-
> >   include/dtrace/dif_defines.h |   5 +-
> >   include/dtrace/ioctl.h       |  23 -----
> >   libdtrace/dt_options.c       |  61 -----------
> >   libdtrace/dt_probe.c         | 132 ------------------------
> >   libdtrace/dt_work.c          |   5 -
> >   runtest.sh                   |  61 ++---------
> >   test/utils/.gitignore        |   2 -
> >   test/utils/Build             |   2 +-
> >   test/utils/baddof.c          | 191 -----------------------------------
> >   test/utils/badioctl.c        | 129 -----------------------
> >   11 files changed, 13 insertions(+), 603 deletions(-)
> >   delete mode 100644 test/utils/baddof.c
> >   delete mode 100644 test/utils/badioctl.c
> > 
> > diff --git a/include/dtrace/dif.h b/include/dtrace/dif.h
> > index 191aa73c..576bda2c 100644
> > --- a/include/dtrace/dif.h
> > +++ b/include/dtrace/dif.h
> > @@ -19,10 +19,7 @@
> >   /*
> >    * The following definitions describe the DTrace Intermediate Format (DIF), a a
> >    * RISC-like instruction set and program encoding used to represent predicates
> > - * and actions that can be bound to DTrace probes.  The constants below defining
> > - * the number of available registers are suggested minimums; the compiler should
> > - * use DTRACEIOC_CONF to dynamically obtain the number of registers provided by
> > - * the current DTrace implementation.
> > + * and actions that can be bound to DTrace probes.
> >    */
> >   /*
> > diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
> > index d88b3b2e..c8c1d961 100644
> > --- a/include/dtrace/dif_defines.h
> > +++ b/include/dtrace/dif_defines.h
> > @@ -19,9 +19,8 @@
> >    * The following definitions describe the DTrace Intermediate Format (DIF), a a
> >    * RISC-like instruction set and program encoding used to represent predicates
> >    * and actions that can be bound to DTrace probes.  The constants below defining
> > - * the number of available registers are suggested minimums; the compiler should
> > - * use DTRACEIOC_CONF to dynamically obtain the number of registers provided by
> > - * the current DTrace implementation.
> > + * the number of available registers are dependent on the underlying BPF
> > + * implementation.
> >    */
> >   #define DIF_VERSION_1	1
> > diff --git a/include/dtrace/ioctl.h b/include/dtrace/ioctl.h
> > index a2a3a93b..2273453a 100644
> > --- a/include/dtrace/ioctl.h
> > +++ b/include/dtrace/ioctl.h
> > @@ -9,30 +9,7 @@
> >   #define _DTRACE_IOCTL_H_
> >   #include <linux/ioctl.h>
> > -#include <dtrace/arg.h>
> > -#include <dtrace/conf.h>
> > -#include <dtrace/dof.h>
> > -#include <dtrace/enabling.h>
> >   #include <dtrace/helpers.h>
> > -#include <dtrace/metadesc.h>
> > -#include <dtrace/stability.h>
> > -#include <dtrace/status.h>
> > -
> > -#define DTRACEIOC		0xd4
> > -#define DTRACEIOC_PROVIDER	_IOR(DTRACEIOC, 1, dtrace_providerdesc_t)
> > -#define DTRACEIOC_PROBES	_IOR(DTRACEIOC, 2, dtrace_probedesc_t)
> > -#define DTRACEIOC_PROBEMATCH	_IOR(DTRACEIOC, 5, dtrace_probedesc_t)
> > -#define DTRACEIOC_ENABLE	_IOW(DTRACEIOC, 6, void *)
> > -#define DTRACEIOC_EPROBE	_IOW(DTRACEIOC, 8, dtrace_eprobedesc_t)
> > -#define DTRACEIOC_PROBEARG	_IOR(DTRACEIOC, 9, dtrace_argdesc_t)
> > -#define DTRACEIOC_CONF		_IOR(DTRACEIOC, 10, dtrace_conf_t)
> > -#define DTRACEIOC_STATUS	_IOR(DTRACEIOC, 11, dtrace_status_t)
> > -#define DTRACEIOC_GO		_IOW(DTRACEIOC, 12, processorid_t)
> > -#define DTRACEIOC_STOP		_IOW(DTRACEIOC, 13, processorid_t)
> > -#define DTRACEIOC_AGGDESC	_IOR(DTRACEIOC, 15, dtrace_aggdesc_t)
> > -#define DTRACEIOC_FORMAT	_IOR(DTRACEIOC, 16, dtrace_fmtdesc_t)
> > -#define DTRACEIOC_DOFGET	_IOR(DTRACEIOC, 17, dof_hdr_t)
> > -#define DTRACEIOC_REPLICATE	_IOR(DTRACEIOC, 18, void *)
> >   #define DTRACEHIOC		0xd8
> >   #define DTRACEHIOC_ADD		_IOW(DTRACEHIOC, 1, dof_hdr_t)
> > diff --git a/libdtrace/dt_options.c b/libdtrace/dt_options.c
> > index 2f7917a0..ec53358b 100644
> > --- a/libdtrace/dt_options.c
> > +++ b/libdtrace/dt_options.c
> > @@ -1030,67 +1030,6 @@ dt_opt_bufresize(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
> >   	return 0;
> >   }
> > -int
> > -dt_options_load(dtrace_hdl_t *dtp)
> > -{
> > -#ifdef FIXME
> > -	dof_hdr_t hdr, *dof;
> > -	dof_sec_t *sec = NULL;  /* gcc -Wmaybe-uninitialized */
> > -	size_t offs;
> > -	int i;
> > -
> > -	/*
> > -	 * To load the option values, we need to ask the kernel to provide its
> > -	 * DOF, which we'll sift through to look for OPTDESC sections.
> > -	 */
> > -	memset(&hdr, 0, sizeof(dof_hdr_t));
> > -	hdr.dofh_loadsz = sizeof(dof_hdr_t);
> > -
> > -	if (dt_ioctl(dtp, DTRACEIOC_DOFGET, &hdr) == -1)
> > -		return dt_set_errno(dtp, errno);
> > -
> > -	if (hdr.dofh_loadsz < sizeof(dof_hdr_t))
> > -		return dt_set_errno(dtp, EINVAL);
> > -
> > -	dof = alloca(hdr.dofh_loadsz);
> > -	memset(dof, 0, sizeof(dof_hdr_t));
> > -	dof->dofh_loadsz = hdr.dofh_loadsz;
> > -
> > -	for (i = 0; i < DTRACEOPT_MAX; i++)
> > -		dtp->dt_options[i] = DTRACEOPT_UNSET;
> > -
> > -	if (dt_ioctl(dtp, DTRACEIOC_DOFGET, dof) == -1)
> > -		return dt_set_errno(dtp, errno);
> > -
> > -	/* FIXME: can we get a zero-section DOF back? */
> > -
> > -	for (i = 0; i < dof->dofh_secnum; i++) {
> > -		sec = (dof_sec_t *)(uintptr_t)((uintptr_t)dof +
> > -		    dof->dofh_secoff + i * dof->dofh_secsize);
> > -
> > -		if (sec->dofs_type != DOF_SECT_OPTDESC)
> > -			continue;
> > -
> > -		break;
> > -	}
> > -
> > -	for (offs = 0; offs < sec->dofs_size; offs += sec->dofs_entsize) {
> > -		dof_optdesc_t *opt = (dof_optdesc_t *)(uintptr_t)
> > -		    ((uintptr_t)dof + sec->dofs_offset + offs);
> > -
> > -		if (opt->dofo_strtab != DOF_SECIDX_NONE)
> > -			continue;
> > -
> > -		if (opt->dofo_option >= DTRACEOPT_MAX)
> > -			continue;
> > -
> > -		dtp->dt_options[opt->dofo_option] = opt->dofo_value;
> > -	}
> > -#endif
> > -
> > -	return 0;
> > -}
> > -
> >   /*ARGSUSED*/
> >   static int
> >   dt_opt_preallocate(dtrace_hdl_t *dtp, const char *arg, uintptr_t option)
> > diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
> > index 0b53121a..14ea134f 100644
> > --- a/libdtrace/dt_probe.c
> > +++ b/libdtrace/dt_probe.c
> > @@ -186,131 +186,6 @@ dt_probe_key(const dtrace_probedesc_t *pdp, char *s)
> >   	return s;
> >   }
> > -/*
> > - * If a probe was discovered from the kernel, ask dtrace(7D) for a description
> > - * of each of its arguments, including native and translated types.
> > - */
> > -static dt_probe_t *
> > -dt_probe_discover(dt_provider_t *pvp, const dtrace_probedesc_t *pdp)
> > -{
> > -#ifdef FIXME
> > -	dtrace_hdl_t *dtp = pvp->pv_hdl;
> > -	char *name = dt_probe_key(pdp, alloca(dt_probe_keylen(pdp)));
> > -
> > -	dt_node_t *xargs, *nargs;
> > -	dt_ident_t *idp;
> > -	dt_probe_t *prp;
> > -
> > -	dtrace_typeinfo_t dtt;
> > -	int i, nc, xc;
> > -
> > -	int adc = _dtrace_argmax;
> > -	dt_argdesc_t *adv = alloca(sizeof(dt_argdesc_t) * adc);
> > -	dt_argdesc_t *adp = adv;
> > -
> > -	assert(strcmp(pvp->desc.dtvd_name, pdp->prv) == 0);
> > -	assert(pdp->id != DTRACE_IDNONE);
> > -
> > -	dt_dprintf("discovering probe %s:%s id=%d\n",
> > -		   pvp->desc.dtvd_name, name, pdp->id);
> > -
> > -	for (nc = -1, i = 0; i < adc; i++, adp++) {
> > -		memset(adp, 0, sizeof(dt_argdesc_t));
> > -		adp->ndx = i;
> > -		adp->id = pdp->id;
> > -
> > -		if (dt_ioctl(dtp, DTRACEIOC_PROBEARG, adp) != 0) {
> > -			dt_set_errno(dtp, errno);
> > -			return NULL;
> > -		}
> > -
> > -		if (adp->ndx == DTRACE_ARGNONE)
> > -			break; /* all argument descs have been retrieved */
> > -
> > -		nc = MAX(nc, adp->mapping);
> > -	}
> > -
> > -	xc = i;
> > -	nc++;
> > -
> > -	/*
> > -	 * Now that we have discovered the number of native and translated
> > -	 * arguments from the argument descriptions, allocate a new probe ident
> > -	 * and corresponding dt_probe_t and hash it into the provider.
> > -	 */
> > -	xargs = dt_probe_alloc_args(pvp, xc);
> > -	nargs = dt_probe_alloc_args(pvp, nc);
> > -
> > -	if ((xc != 0 && xargs == NULL) || (nc != 0 && nargs == NULL))
> > -		return NULL; /* dt_errno is set for us */
> > -
> > -	idp = dt_ident_create(name, DT_IDENT_PROBE, DT_IDFLG_ORPHAN, pdp->id,
> > -			      _dtrace_defattr, 0, &dt_idops_probe, NULL,
> > -			      dtp->dt_gen);
> > -
> > -	if (idp == NULL) {
> > -		dt_set_errno(dtp, EDT_NOMEM);
> > -		return NULL;
> > -	}
> > -
> > -	prp = dt_probe_create(dtp, idp, 2, nargs, nc, xargs, xc);
> > -	if (prp == NULL) {
> > -		dt_ident_destroy(idp);
> > -		return NULL;
> > -	}
> > -
> > -	dt_probe_declare(pvp, prp);
> > -
> > -	/*
> > -	 * Once our new dt_probe_t is fully constructed, iterate over the
> > -	 * cached argument descriptions and assign types to prp->nargv[]
> > -	 * and prp->xargv[] and assign mappings to prp->mapping[].
> > -	 */
> > -	for (adp = adv, i = 0; i < xc; i++, adp++) {
> > -		if (dtrace_type_strcompile(dtp,
> > -		    adp->native, &dtt) != 0) {
> > -			dt_dprintf("failed to resolve input type %s "
> > -			    "for %s:%s arg #%d: %s\n", adp->native,
> > -			    pvp->desc.dtvd_name, name, i + 1,
> > -			    dtrace_errmsg(dtp, dtrace_errno(dtp)));
> > -
> > -			dtt.dtt_object = NULL;
> > -			dtt.dtt_ctfp = NULL;
> > -			dtt.dtt_type = CTF_ERR;
> > -		} else {
> > -			dt_node_type_assign(prp->nargv[adp->mapping],
> > -			    dtt.dtt_ctfp, dtt.dtt_type);
> > -		}
> > -
> > -		if (dtt.dtt_type != CTF_ERR && (adp->xlate[0] == '\0' ||
> > -		    strcmp(adp->native, adp->xlate) == 0)) {
> > -			dt_node_type_propagate(prp->nargv[
> > -			    adp->mapping], prp->xargv[i]);
> > -		} else if (dtrace_type_strcompile(dtp,
> > -		    adp->xlate, &dtt) != 0) {
> > -			dt_dprintf("failed to resolve output type %s "
> > -			    "for %s:%s arg #%d: %s\n", adp->xlate,
> > -			    pvp->desc.dtvd_name, name, i + 1,
> > -			    dtrace_errmsg(dtp, dtrace_errno(dtp)));
> > -
> > -			dtt.dtt_object = NULL;
> > -			dtt.dtt_ctfp = NULL;
> > -			dtt.dtt_type = CTF_ERR;
> > -		} else {
> > -			dt_node_type_assign(prp->xargv[i],
> > -			    dtt.dtt_ctfp, dtt.dtt_type);
> > -		}
> > -
> > -		prp->mapping[i] = adp->mapping;
> > -		prp->argv[i] = dtt;
> > -	}
> > -
> > -	return prp;
> > -#else
> > -	return NULL;
> > -#endif
> > -}
> > -
> >   /*
> >    * Lookup a probe declaration based on a known provider and full or partially
> >    * specified module, function, and name.  If the probe is not known to us yet,
> > @@ -339,13 +214,6 @@ dt_probe_lookup2(dt_provider_t *pvp, const char *s)
> >   	if ((idp = dt_idhash_lookup(pvp->pv_probes, key)) != NULL)
> >   		return idp->di_data;
> > -	/*
> > -	 * If the probe isn't known, use the probe description computed above
> > -	 * to ask dtrace(7D) to find the first matching probe.
> > -	 */
> > -	if (dt_ioctl(dtp, DTRACEIOC_PROBEMATCH, &pd) == 0)
> > -		return dt_probe_discover(pvp, &pd);
> > -
> >   	if (errno == ESRCH || errno == EBADF)
> >   		dt_set_errno(dtp, EDT_NOPROBE);
> >   	else
> > diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> > index 13483301..c98bbfb9 100644
> > --- a/libdtrace/dt_work.c
> > +++ b/libdtrace/dt_work.c
> > @@ -319,11 +319,6 @@ dtrace_go(dtrace_hdl_t *dtp, uint_t cflags)
> >   	if (dt_state_get_activity(dtp) == DT_ACTIVITY_STOPPED)
> >   		dt_state_set_activity(dtp, DT_ACTIVITY_DRAINING);
> > -#if 0
> > -	if (dt_options_load(dtp) == -1)
> > -		return dt_set_errno(dtp, errno);
> > -#endif
> > -
> >   	return 0;
> >   }
> > diff --git a/runtest.sh b/runtest.sh
> > index 0fe98a99..c720a8c9 100755
> > --- a/runtest.sh
> > +++ b/runtest.sh
> > @@ -247,7 +247,6 @@ Options:
> >                             or with a timeout, but have no expected results,
> >                             as the expected results.  (Only useful if
> >                             --no-comparison is not specified.)
> > - --[no-]baddof: Run corrupt-DOF tests.
> >    --[no-]use-installed: Use an installed dtrace rather than a copy in the
> >                          source tree.
> >    --quiet: Only show unexpected output (FAILs and XPASSes).
> > @@ -267,7 +266,6 @@ exit 0
> >   CAPTURE_EXPECTED=${DTRACE_TEST_CAPTURE_EXPECTED:+t}
> >   OVERWRITE_RESULTS=
> >   NOEXEC=${DTRACE_TEST_NO_EXECUTE:+t}
> > -NOBADDOF=${DTRACE_TEST_BADDOF:-t}
> >   USE_INSTALLED=${DTRACE_TEST_USE_INSTALLED:+t}
> >   VALGRIND=${DTRACE_TEST_VALGRIND:+t}
> >   COMPARISON=t
> > @@ -303,8 +301,6 @@ while [[ $# -gt 0 ]]; do
> >           --no-comparison) COMPARISON=;;
> >           --valgrind) VALGRIND=t;;
> >           --no-valgrind) VALGRIND=;;
> > -        --baddof) NOBADDOF=;;
> > -        --no-baddof) NOBADDOF=t;;
> >           --use-installed) USE_INSTALLED=t;;
> >           --no-use-installed) USE_INSTALLED=;;
> >           --timeout=*) TIMEOUT="$(printf -- $1 | cut -d= -f2-)";;
> > @@ -641,56 +637,17 @@ done
> >   # Initialize test coverage.
> > -if [[ -n $NOBADDOF ]]; then
> > -    for name in build*; do
> > -        if [[ -n "$(echo $name/*.gcno)" ]]; then
> > -            rm -rf $logdir/coverage
> > -            mkdir -p $logdir/coverage
> > -            lcov --zerocounters --directory $name --quiet
> > -            lcov --capture --base-directory . --directory $name --initial \
> > -                 --quiet -o $logdir/coverage/initial.lcov 2>/dev/null
> > -        fi
> > -    done
> > -fi
> > -
> > -load_modules
> > -
> > -if [[ -z $NOBADDOF ]]; then
> > -    # Run DOF-corruption tests instead.
> > -
> > -    test/utils/badioctl > /dev/null 2> $tmpdir/badioctl.err &
> > -    declare ioctlpid=$!
> > -
> > -    ZAPTHESE+=($ioctlpid)
> > -    for _test in $(if [[ $ONLY_TESTS ]]; then
> > -                      echo $TESTS | sed 's,\.r$,\.d,g; s,\.r ,.d ,g'
> > -                   else
> > -                      for name in $TESTSUITES; do
> > -                          find test/$name -name "*.d" | sort -u
> > -                      done
> > -                   fi); do
> > -
> > -        if ! run_with_timeout $TIMEOUT test/utils/baddof $_test > /dev/null 2> $tmpdir/baddof.err; then
> > -            out "$_test: FAIL (bad DOF)"
> > -        fi
> > -        if [[ -s $tmpdir/baddof.err ]]; then
> > -            sum "baddof stderr:"
> > -            tee -a < $tmpdir/baddof.err $LOGFILE >> $SUMFILE
> > -        fi
> > -    done
> > -
> > -    if [[ "$(ps -p $ioctlpid -o ppid=)" -eq $BASHPID ]]; then
> > -        kill -$TIMEOUTSIG -- $ioctlpid >/dev/null 2>&1
> > -    fi
> > -    if [[ -s $tmpdir/badioctl.err ]]; then
> > -        sum "badioctl stderr:"
> > -        tee -a < $tmpdir/badioctl.err $LOGFILE >> $SUMFILE
> > +for name in build*; do
> > +    if [[ -n "$(echo $name/*.gcno)" ]]; then
> > +        rm -rf $logdir/coverage
> > +        mkdir -p $logdir/coverage
> > +        lcov --zerocounters --directory $name --quiet
> > +        lcov --capture --base-directory . --directory $name --initial \
> > +             --quiet -o $logdir/coverage/initial.lcov 2>/dev/null
> >       fi
> > -    # equivalent of unset "ZAPTHESE[-1]" on bash < 4.3
> > -    unset "ZAPTHESE[$((${#ZAPTHESE[@]}-1))]"
> > -    exit 0
> > -fi
> > +done
> > +load_modules
> >   # Export some variables so triggers and .sh scripts can get at them.
> >   export _test _pid dt_flags
> > diff --git a/test/utils/.gitignore b/test/utils/.gitignore
> > index 7c25cb18..4d52db48 100644
> > --- a/test/utils/.gitignore
> > +++ b/test/utils/.gitignore
> > @@ -1,6 +1,4 @@
> >   # In-place built executables
> > -baddof
> > -badioctl
> >   workload_kernel
> >   workload_user
> >   print-stack-layout
> > diff --git a/test/utils/Build b/test/utils/Build
> > index 1398822b..10f4e726 100644
> > --- a/test/utils/Build
> > +++ b/test/utils/Build
> > @@ -3,7 +3,7 @@
> >   # Licensed under the Universal Permissive License v 1.0 as shown at
> >   # http://oss.oracle.com/licenses/upl.
> > -TEST_UTILS = baddof badioctl workload_kernel workload_user showUSDT print-stack-layout
> > +TEST_UTILS = workload_kernel workload_user showUSDT print-stack-layout
> >   TEST_SCRIPTS = check_result.sh clean_probes.sh cpc_get_events.sh cpc_temp_skip_bug.sh perf_count_event.sh workload_analyze_loop.sh workload_get_iterations.sh
> >   define test-util-template
> > diff --git a/test/utils/baddof.c b/test/utils/baddof.c
> > deleted file mode 100644
> > index 5f844625..00000000
> > --- a/test/utils/baddof.c
> > +++ /dev/null
> > @@ -1,191 +0,0 @@
> > -/*
> > - * Oracle Linux DTrace.
> > - * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
> > - * Licensed under the Universal Permissive License v 1.0 as shown at
> > - * http://oss.oracle.com/licenses/upl.
> > - */
> > -
> > -#include <sys/types.h>
> > -#include <sys/stat.h>
> > -#include <sys/ioctl.h>
> > -#include <stdio.h>
> > -#include <stdlib.h>
> > -#include <stdarg.h>
> > -#include <fcntl.h>
> > -#include <errno.h>
> > -#include <math.h>
> > -#include <string.h>
> > -#include <dtrace.h>
> > -
> > -void
> > -fatal(char *fmt, ...)
> > -{
> > -	va_list ap;
> > -
> > -	va_start(ap, fmt);
> > -
> > -	fprintf(stderr, "%s: ", "baddof");
> > -	vfprintf(stderr, fmt, ap);
> > -
> > -	if (fmt[strlen(fmt) - 1] != '\n')
> > -		fprintf(stderr, ": %s\n", strerror(errno));
> > -
> > -	exit(1);
> > -}
> > -
> > -#define	LEAP_DISTANCE		20
> > -
> > -void
> > -corrupt(int fd, unsigned char *buf, int len)
> > -{
> > -	static int ttl, valid;
> > -	int bit, i;
> > -	unsigned char saved;
> > -	int val[LEAP_DISTANCE], pos[LEAP_DISTANCE];
> > -	int new, rv;
> > -
> > -again:
> > -	printf("valid DOF #%d\n", valid++);
> > -
> > -	/*
> > -	 * We are going iterate through, flipping one bit and attempting
> > -	 * to enable.
> > -	 */
> > -	for (bit = 0; bit < len * 8; bit++) {
> > -		saved = buf[bit / 8];
> > -		buf[bit / 8] ^= (1 << (bit % 8));
> > -
> > -		if ((bit % 100) == 0)
> > -			printf("%d\n", bit);
> > -
> > -		if ((rv = ioctl(fd, DTRACEIOC_ENABLE, buf)) == -1) {
> > -			/*
> > -			 * That failed -- restore the bit and drive on.
> > -			 */
> > -			buf[bit / 8] = saved;
> > -			continue;
> > -		}
> > -
> > -		/*
> > -		 * That worked -- and it may have enabled probes.  To keep
> > -		 * enabled probes down to a reasonable level, we'll close
> > -		 * and reopen pseudodevice if we have more than 10,000
> > -		 * probes enabled.
> > -		 */
> > -		ttl += rv;
> > -
> > -		if (ttl < 10000) {
> > -			buf[bit / 8] = saved;
> > -			continue;
> > -		}
> > -
> > -		printf("enabled %d probes; resetting device.\n", ttl);
> > -		close(fd);
> > -
> > -		new = open("/dev/dtrace/dtrace", O_RDWR);
> > -
> > -		if (new == -1)
> > -			fatal("couldn't open DTrace pseudo device");
> > -
> > -		if (new != fd) {
> > -			dup2(new, fd);
> > -			close(new);
> > -		}
> > -
> > -		ttl = 0;
> > -		buf[bit / 8] = saved;
> > -	}
> > -
> > -	for (;;) {
> > -		/*
> > -		 * Now we want to get as many bits away as possible.  We flip
> > -		 * bits randomly -- getting as far away as we can until we don't
> > -		 * seem to be making any progress.
> > -		 */
> > -		for (i = 0; i < LEAP_DISTANCE; i++) {
> > -			/*
> > -			 * Pick a random bit and corrupt it.
> > -			 */
> > -			bit = lrand48() % (len * 8);
> > -
> > -			val[i] = buf[bit / 8];
> > -			pos[i] = bit / 8;
> > -			buf[bit / 8] ^= (1 << (bit % 8));
> > -		}
> > -
> > -		/*
> > -		 * Let's see if that managed to get us valid DOF...
> > -		 */
> > -		if ((rv = ioctl(fd, DTRACEIOC_ENABLE, buf)) > 0) {
> > -			/*
> > -			 * Success!  This will be our new base for valid DOF.
> > -			 */
> > -			ttl += rv;
> > -			goto again;
> > -		}
> > -
> > -		/*
> > -		 * No luck -- we'll restore those bits and try flipping a
> > -		 * different set.  Note that this must be done in reverse
> > -		 * order...
> > -		 */
> > -		for (i = LEAP_DISTANCE - 1; i >= 0; i--)
> > -			buf[pos[i]] = val[i];
> > -	}
> > -}
> > -
> > -int
> > -main(int argc, char **argv)
> > -{
> > -	char *filename = argv[1];
> > -	dtrace_hdl_t *dtp;
> > -	dtrace_prog_t *pgp;
> > -	int err, fd, len;
> > -	FILE *fp;
> > -	unsigned char *dof, *copy;
> > -
> > -	if (argc < 1)
> > -		fatal("expected D script as argument\n");
> > -
> > -	if ((fp = fopen(filename, "r")) == NULL)
> > -		fatal("couldn't open %s", filename);
> > -
> > -	/*
> > -	 * First, we need to compile our provided D into DOF.
> > -	 */
> > -	if ((dtp = dtrace_open(DTRACE_VERSION, 0, &err)) == NULL) {
> > -		fatal("cannot open dtrace library: %s\n",
> > -		    dtrace_errmsg(NULL, err));
> > -	}
> > -
> > -	pgp = dtrace_program_fcompile(dtp, fp, 0, 0, NULL);
> > -	fclose(fp);
> > -
> > -	if (pgp == NULL) {
> > -		fatal("failed to compile script %s: %s\n", filename,
> > -		    dtrace_errmsg(dtp, dtrace_errno(dtp)));
> > -	}
> > -
> > -	dof = dtrace_dof_create(dtp, pgp, 0);
> > -	len = ((dof_hdr_t *)dof)->dofh_loadsz;
> > -
> > -	if ((copy = malloc(len)) == NULL)
> > -		fatal("could not allocate copy of %d bytes", len);
> > -
> > -	for (;;) {
> > -		memcpy(copy, dof, len);
> > -		/*
> > -		 * Open another instance of the dtrace device.
> > -		 */
> > -		fd = open("/dev/dtrace/dtrace", O_RDWR);
> > -
> > -		if (fd == -1)
> > -			fatal("couldn't open DTrace pseudo device");
> > -
> > -		corrupt(fd, copy, len);
> > -		close(fd);
> > -	}
> > -
> > -	/* NOTREACHED */
> > -	return 0;
> > -}
> > diff --git a/test/utils/badioctl.c b/test/utils/badioctl.c
> > deleted file mode 100644
> > index 8a5c286c..00000000
> > --- a/test/utils/badioctl.c
> > +++ /dev/null
> > @@ -1,129 +0,0 @@
> > -/*
> > - * Oracle Linux DTrace.
> > - * Copyright (c) 2007, 2020, Oracle and/or its affiliates. All rights reserved.
> > - * Licensed under the Universal Permissive License v 1.0 as shown at
> > - * http://oss.oracle.com/licenses/upl.
> > - */
> > -
> > -#include <sys/types.h>
> > -#include <sys/stat.h>
> > -#include <sys/ioctl.h>
> > -#include <sys/mman.h>
> > -#include <sys/wait.h>
> > -#include <sys/time.h>
> > -#include <stdio.h>
> > -#include <stdlib.h>
> > -#include <fcntl.h>
> > -#include <stdarg.h>
> > -#include <string.h>
> > -#include <errno.h>
> > -#include <unistd.h>
> > -
> > -#define	DTRACEIOC	(('d' << 24) | ('t' << 16) | ('r' << 8))
> > -#define	DTRACEIOC_MAX	17
> > -
> > -void
> > -fatal(char *fmt, ...)
> > -{
> > -	va_list ap;
> > -
> > -	va_start(ap, fmt);
> > -
> > -	fprintf(stderr, "%s: ", "badioctl");
> > -	vfprintf(stderr, fmt, ap);
> > -
> > -	if (fmt[strlen(fmt) - 1] != '\n')
> > -		fprintf(stderr, ": %s\n", strerror(errno));
> > -
> > -	exit(1);
> > -}
> > -
> > -void
> > -badioctl(pid_t parent)
> > -{
> > -	int fd = -1, random, ps = sysconf(_SC_PAGESIZE);
> > -	int i = 0;
> > -	caddr_t addr;
> > -	struct timeval now, last = {0};
> > -
> > -	if ((random = open("/dev/urandom", O_RDONLY)) == -1)
> > -		fatal("couldn't open /dev/urandom");
> > -
> > -	if ((addr = mmap(0, ps, PROT_READ | PROT_WRITE,
> > -	    MAP_ANON | MAP_PRIVATE, -1, 0)) == (caddr_t)-1)
> > -		fatal("mmap");
> > -
> > -	for (;;) {
> > -		unsigned int ioc;
> > -
> > -		gettimeofday(&now, NULL);
> > -		if (now.tv_sec > last.tv_sec) {
> > -			if (kill(parent, 0) == -1 && errno == ESRCH) {
> > -				/*
> > -				 * Our parent died.  We will kill ourselves in
> > -				 * sympathy.
> > -				 */
> > -				exit(0);
> > -			}
> > -
> > -			/*
> > -			 * Once a second, we'll reopen the device.
> > -			 */
> > -			if (fd != -1)
> > -				close(fd);
> > -
> > -			fd = open("/dev/dtrace/dtrace", O_RDONLY);
> > -
> > -			if (fd == -1)
> > -				fatal("couldn't open DTrace pseudo device");
> > -
> > -			last = now;
> > -		}
> > -
> > -
> > -		if ((i++ % 1000) == 0) {
> > -			/*
> > -			 * Every thousand iterations, change our random gunk.
> > -			 */
> > -			read(random, addr, ps);
> > -		}
> > -
> > -		read(random, &ioc, sizeof(ioc));
> > -		ioc %= DTRACEIOC_MAX;
> > -		ioc++;
> > -		ioctl(fd, DTRACEIOC | ioc, addr);
> > -	}
> > -}
> > -
> > -int
> > -main()
> > -{
> > -	pid_t child, parent = getpid();
> > -	int status;
> > -
> > -	for (;;) {
> > -		if ((child = fork()) == 0)
> > -			badioctl(parent);
> > -
> > -		while (waitpid(child, &status, WEXITED) != child)
> > -			continue;
> > -
> > -		if (WIFEXITED(status)) {
> > -			/*
> > -			 * Our child exited by design -- we'll exit with
> > -			 * the same status code.
> > -			 */
> > -			exit(WEXITSTATUS(status));
> > -		}
> > -
> > -		/*
> > -		 * Our child died on a signal.  Respawn it.
> > -		 */
> > -		printf("badioctl: child died on signal %d; respawning.\n",
> > -		    WTERMSIG(status));
> > -		fflush(stdout);
> > -	}
> > -
> > -	/* NOTREACHED */
> > -	return 0;
> > -}
