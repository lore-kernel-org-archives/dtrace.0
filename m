Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEDB1B0437
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 15:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745508806; cv=fail; b=m/HKLi/A4HUVn5LFVHvHNqgyLuirRibbN7ZoHZaxIujOrSMZgRyIpe9wIYxe5q2QPtpxQmNvTiv5PdlhSrKM27k4geQQM+gQ+rRQMctkldfMQh4BLv0N+/2894ob4iwC7vul9B8f2UKwX35pv8Ruf8VtJLf1kjDFhViKul6aU3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745508806; c=relaxed/simple;
	bh=B+18sAZ5wzmW7S5kaeQyEEsDk4ALzmi63qf41lX5xvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EUezYceX75ydypGjs8XEjJNWai+IzPmDevUQBAxTIRLBwIg5rxZHIyGS/OCA6AokqdRlKNereulqL6FEOQ4niP3fIDyiVgwk+AEenkcIFruZXXOWMIdvIgyGzxEVHWfAR9hP8zjo55I91PjBuhwfAlljjIDXQ0X+oa2AGT1hDp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=G2ZBzh6/; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jNQ2kU8/ reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="G2ZBzh6/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jNQ2kU8/"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OFH00N024877
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 15:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=S9IYZxsWu4UEw1NDumEHfUOienO2UT1FEV7eiGJxqkc=; b=
	G2ZBzh6/Esd+FG5gj8dCl1w9M204BG888KAKCN9jMUmvDUWnZP4nGDSYuVmFhj5p
	O88REgMaihgvfGXAK4AD53S9JDzi12o0ATbB1iOGiPdsb7uswERixoAsaILhkteX
	+ucCdtn5671paW88g1xOKXHejgVIiELTHWSmhhAKfXSgstROb+puI3GSlhkh293c
	sYlh6yBHkS4ZEgMbUF6fcwIUiE366+dtdOAPcflLwbMwM/eTjF98C3GzGQn4T4S9
	qOZjgo0nXxCwtu8y1bHStbRis0cf9BfzWxwzSgQOh2axmLF0qCJ47CpUovLHeCaR
	KcUJYqj+7QmnKKvpuufdWw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 467qt782a3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 15:33:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53OF4CIC017350
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 15:32:31 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 466jvgpwah-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 24 Apr 2025 15:32:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtuJIGfbHSdhnmwZ8T47mNFPbueOhu1fSBiMc5s4LF4T0wP9casfppW5yZzi39RCmDa81gWfFXTkY/wQ+uAF4mrJ8A6BVBBB9slQ9CruJJiOGvlNR+shuFBvwGC4zewlEZyosGw4A91F7DyfIKXjhUuWhn3PziGz6w0uWrHJj5f5nICdijPmBZOH85vPL88YYdHdgMywQOLM59EalfbyqaRNeKL05vv7hWJxVYuztQC8sVHacgj0G8kHYb1MahHKK05vJTNotbFVvyhQgxogvRMfcPSuNoaHJdegS2byrWrSU7DZXgSFE8LAP9B0TBrkRM5SgWFZCdzHYHpqC2YcFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YuyeFuFo6A7NuXiciTdRryi0PZcQFbGzhzXQsIIDP4=;
 b=t23b29aDsomq5gnJ4yJYhl10nSxlgO4rC4N7kfJPmFdOkBpqDbRq1nV4bfXG7jXL7985+stSjMZaANSZCCYJ+4FxvOTaMZySm3NFQbm6KYq+4E++AQqKgwanx8nKni6ylXQJs+iijZaCRNr9VtkjN0zeLTomL5nPnNoavPkNbAdVPJJk0YWD7Td/GjowFneBdwUQ2GCS96wDYXpkGISCcsuR8a2qhHBer5IAV4zxhaTAeIZwV0HlNRnHxb+JIGIJMIp73Cm39bNqtQRU+WdRIBktQbxFs4KdLE4h0z+/g3z1lKwemAxV5yJwTL3MbE4rpx//GB0XmumGyeDSTBxYcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YuyeFuFo6A7NuXiciTdRryi0PZcQFbGzhzXQsIIDP4=;
 b=jNQ2kU8/bYit/putEgCMytYP9OTKHJ4ZqyUDD+/g06mgl7y0T6n/peHyt/HaDv93iC6T8n5aR4Y/yyn1rxMJ0dn5sL//nBAnSDuBhuLqS05eBTIPTus9WIg85P1IMfBI3ws8aYRsw15hcH1HUHiy/zlKXLK34upEMPGwYi7tl+U=
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae) by CH2PR10MB4375.namprd10.prod.outlook.com
 (2603:10b6:610:7d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 15:32:26 +0000
Received: from SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437]) by SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 ([fe80::10d5:90dc:428e:437%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 15:32:26 +0000
Date: Thu, 24 Apr 2025 11:32:24 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 2/2] Clean up sched provider trampoline FIXMEs
Message-ID: <aApZiE_Ye0EiKpM2@kvh-deb-bpf.us.oracle.com>
References: <20250403050252.15239-1-eugene.loh@oracle.com>
 <Z/mAC5DG2gl0W8Sn@oracle.com>
 <f9f7221d-ee7c-b10c-b677-de3b38d86181@oracle.com>
 <Z/5KChRZYc4M1eIp@oracle.com>
 <c0bed1b0-b403-6de5-0b04-981daf2bc37c@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c0bed1b0-b403-6de5-0b04-981daf2bc37c@oracle.com>
X-ClientProxiedBy: SJ0PR03CA0086.namprd03.prod.outlook.com
 (2603:10b6:a03:331::31) To SJ5PPF7F7BBD994.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::7ae)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7F7BBD994:EE_|CH2PR10MB4375:EE_
X-MS-Office365-Filtering-Correlation-Id: ce6ab7b0-6ae3-4719-ef9f-08dd83453772
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?aklocELqWeb5hAjqyBe+d/vXbIVFTxR29qxnOdsa4F4/ABct994OE5W7oJ?=
 =?iso-8859-1?Q?co6KeNZfZjKcgh5xJ2MMx3n9eFHYQGA03zj+FGKnWiyH3tyo/N09h3T5BX?=
 =?iso-8859-1?Q?y4mqUHH4wPrJnKnpHeQcGKd1m6ZqDfljt05J4TMGdxTDtwCnkUEavDikjQ?=
 =?iso-8859-1?Q?H29a6nByX973CT07v76jhPNnczNucofpW2qks+8I1LkKdMKkSaO7tpiFns?=
 =?iso-8859-1?Q?rutbrIGb4/qXKugj8ve0h/3thPaMOjStwXYwbR0xutxKD4bxs80bjDcjzq?=
 =?iso-8859-1?Q?pEcfpCRG1oqL8ObvnZuoti5Kr3/giqn4OISi6oBInuz3xBpNr2k/B5YIAh?=
 =?iso-8859-1?Q?p5PQmyn3kuUOMYuEdrFLhQEEEvjzjt6YuBisdmvjrzLWNd2y4U0MaG0yIZ?=
 =?iso-8859-1?Q?2f4Epo43v7/wQYwrizmY077IqBkNb3S5kRw8KOTYJaIzUQEB5UGXiJVJ7q?=
 =?iso-8859-1?Q?3ctvJq0CCSeA+aq8+d2zSUFF8JJCPWNrYDet2dtw0fORrFRnUcHjV83Otn?=
 =?iso-8859-1?Q?boNrk9BJW2pveFzVNJdEFu4y0ilpmHOeHVSWuQfPizqA7mv0c/b9OXIKSC?=
 =?iso-8859-1?Q?NTgGeO9mFkibpcut0Aah8TKGgzwLUaE/GX764lFI8ksVtLgRc3euBDZKGo?=
 =?iso-8859-1?Q?q5dx4MhKiqWTCqidZEC7seDEkSnrTsTE16nj/RQjEaF3mdSJ1eM9AiYmCo?=
 =?iso-8859-1?Q?AA/OZt7LOZncOxfC3gmPwBD6QAlm4M9Atmx3zOl0HEILTe/XvzTEU7jlNP?=
 =?iso-8859-1?Q?w+gqFO6Fy76H/GPMPC8wSzh9dvz9EXWtVuF7SPhBsnjMTcdeYhT/5okckW?=
 =?iso-8859-1?Q?MLZ8vnmnLlx1vNSY/5hhfJWkIenA308VmIZDmK/4llIAYs92VHZ0TTxiRn?=
 =?iso-8859-1?Q?h+OSryD1eqUYTvK7Xtgduu6GtLHz8ddX22eJ0WWuXQKuGYb1jYwfYhKt/u?=
 =?iso-8859-1?Q?PumwmMcLPh3gGQ8RBUtDYTkOPeZLmbyvXXtfUZC8/2FTcvSVZmRMqoYBZE?=
 =?iso-8859-1?Q?l2e7LVjevF923ERu7eDrwd6Dei6JtiKxFeCcksu+kMGNkwtpfQ5dL5+jaK?=
 =?iso-8859-1?Q?/nAaAWLyuGQLYG+lnUn3CToYPmWQiQkE7I9utJeT2mSs1CRlGkqsQEDXl6?=
 =?iso-8859-1?Q?9iNhg73FUToEUtfzfAxx2nvvBHhUR+Kcj/yyj1XvDjS4BHoeAXR87sJDRG?=
 =?iso-8859-1?Q?9Q8FdWUGO6/qGXTPna+EUvkA82P5387sc4qZF0+doHaAfNGzPWQFMXBQIz?=
 =?iso-8859-1?Q?njyVzYpivdNkM3wePntL02OntylOBBh6yCVgLxcbE+IBbQhJZRESCCK9H+?=
 =?iso-8859-1?Q?YZf1DaxLE4JXOq/cHv6XZosP30wucgAiHAkEkW/k+T4nHn3Stj8hEVg0VM?=
 =?iso-8859-1?Q?CYdsLGjTLQJ8Y1cePNrwgny4FlamUcDqrMaWR71YR801QjO3Re8+hIuddn?=
 =?iso-8859-1?Q?RrGYlVxng7MSvoOItsK8wLvXTPvyaViKZXsNy3o+YvkQM0dpSyC2CcD4KG?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF7F7BBD994.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?DwZ6e+/+wFEjFK4lFZy8HNB8jg9RFMAFnHmyNErH+liSfNoQaRe1ooEtOY?=
 =?iso-8859-1?Q?TYEQm29KUg8LmFtAe/ABaIVWV4C9XITiMpHW34IlFUz6OzJeXt4XKasgiE?=
 =?iso-8859-1?Q?YAsbhKYHVHUkgzzx1CDEjziZBKsFqDfSNAPCC2AvHH2AWdrj5PIH+NmM3O?=
 =?iso-8859-1?Q?7pS+3I54BRkcUILrwmCdpYdmfJRgGzW7qzUcvtREAAb8hB9cxHXtLW8PQr?=
 =?iso-8859-1?Q?BHGEiBgJyvd3DT//wqOeKU/PuFSVxSV8Ez3OnfnaKKHK9FyGANBId3xxiE?=
 =?iso-8859-1?Q?tTCZseRNCg3iO2EW+JcXEtWGjbshpq9v6STuHoVlEgrca/QyWD74ARp60d?=
 =?iso-8859-1?Q?Uit1M8IeMgpPpDr8qaAbm595syP1bWrox9fcMZnM2HUw1tW1vLk4UA7DeX?=
 =?iso-8859-1?Q?Q3Aowpg21i+NCFvLxr61VoH1VYGlDGW2Logf2dqttDsrQujgzDEc4ElC0T?=
 =?iso-8859-1?Q?TK4Kk8vu72zRbytQdUVS18r+Qfgc548Ym2VPgoOzsfJTkVBvWvD1Y7p/ip?=
 =?iso-8859-1?Q?8UUOnGUWR/aVQFQjzMzHrGZXZf/RAmq2gAyfWZ2cknSiuhUHBZLesligcp?=
 =?iso-8859-1?Q?/R0b73bNbKeMmNjeflpRccPSpU6u8JQt0OD9q7PDFPoZ9VSkqZRY3N4tAJ?=
 =?iso-8859-1?Q?OHjMPm2UZFUcEdbzUyxTvCeDOdr/GeroIxEFdVkb4P0loqV7pKAGoXJnSR?=
 =?iso-8859-1?Q?wtOjtnhxMBPirP1Bhp+VgqQwX65bF6Q6Xd7PSs47uCmmGosQW9TPExrptp?=
 =?iso-8859-1?Q?aSS0tQ1qR/ElJStjnQ/ag7uh12K1De0mHxmstG77eqvFfRzpDGw62/gXVX?=
 =?iso-8859-1?Q?J6UHCgza3M1XTlTvvNKbo4Bxk/WxiqoE3yfT1QLXyCvM+JLpI/QfBBhNZT?=
 =?iso-8859-1?Q?9LcbPmRabM5/LJmyeKRXe2kT/soiGSq1wXDJ+OQliVeISURsng1Eblbz9N?=
 =?iso-8859-1?Q?Ea8TtP/2TIS8RPerJ4SQd9ZCGKQoHSpREcPDYfqkwVE6SMksDPZfpKOTfe?=
 =?iso-8859-1?Q?blN+TTLNJe7P4j7uFEUHy6Dd5uFk4Xk2d3tXkPetL+/6wb6E0IdOcgcCbw?=
 =?iso-8859-1?Q?XUY4MDTAcwtSs6h/zYsTwv1Opz8ZQ+sAAu16F5ko3IlzccTVgTnTZDxd9p?=
 =?iso-8859-1?Q?J5udoWe2WwFR07CZ7VCbxV73bo8+PMZiFhKvnvA/TFHs+fuy4PixvblT6N?=
 =?iso-8859-1?Q?YkRZVKMVzf/9y/qgVcq6S8PAni/Zz3+Fx7Pd6HIq52+H6uNgFHCMjwRQyY?=
 =?iso-8859-1?Q?okm8aEgiNdukljl+tj+hdby/i14hfZbbruNt2k3tnhVo6ui9AkovXWmDPj?=
 =?iso-8859-1?Q?OMtiNrmGA4p81Anmypue70mMcQI5cIn2smGhLAOvcYncpj44FWdtHxggGv?=
 =?iso-8859-1?Q?IeT32Qy04JkvtlqxgD308TycIK95GqLlZHmBGBMgWut7B/5/0MPTaJMyL1?=
 =?iso-8859-1?Q?99sVY3upv4QcF/t8+3AKBpkpQC5aN1lHbW6OZq1JEqqcJMBHnHjHYrYjUG?=
 =?iso-8859-1?Q?ajhk02OMFs8yAfWWFdvjojYJgZOnxcWbwU2CTIc7aMHRYkIU+4JSxx5O/N?=
 =?iso-8859-1?Q?/axdgrfAnEvLWxjFuVdfSWPKobGUT6BeCdOzSnUGFPX6rYfyHrjlB6Uolj?=
 =?iso-8859-1?Q?b0q1B1l1vmVIJvcgh/Qbp1WoEGrdkXbMwyz0tPyRqo8Dyy1kdh97dToA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7FW6OKP9oJdRukllrZaRFfF1WlhmcQM2Qt2DN59WhSQLnl058RDf6v/16Iiy3P6DfC6j8VAiA+DiEvhTYLLwNGgKxXpPjHGrbYMdmfA9Noj8HHlXtjkGz5e07exJ4tEjOzt8QCbAumbi8mWYhkGdVosr8wwUNf5UE7MXCTvj+IWQG8Klj/uJmJQ4lXdfVnBmQYK+NMnB6Rs2qzNdjSlwDqbfiUpjq/xFmXmIbQ6GzUSlenTULhc+5gkTR3/SZPcAVLOV3UeCS3dxhvXBVzg2gKOgXzlQ7pQALT+M8haJp+Rre4E8idjFadp5ujdMtWpeAmMLKOGtXO6NI9HMpSC3/eTV6bFN3ghyVlSCado2gdux7hqIJ4/Tcz+tcYQMvhmVxXuhgttwh4zOY3UJGpLc5mC3zYsnvURF0vv0Ec0M1tWgGEJ0LY+3vgEScGzTs46hB01VMndD6Gci+rswrPI7OXnwSfeMtky1oRMQq2X0jOnpmSCMTDrK41x9IH02XigRNS8Qn2MsPOD1i1Ua1FgOajBU0Es+O1Z+GGvRGtvPPQG9c/oJiXyr3TcGA2AYYEjvCb5WUQqLxpk+hL991euuuTYSTHJyDd6SA2XUH1rf0WM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce6ab7b0-6ae3-4719-ef9f-08dd83453772
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7F7BBD994.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 15:32:26.4305
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bhf1tw5qr+7Hi3qGZcwfKj/mK5b3/nlRq7ijz3lF8Sx6P4Bwmqj4pyaA++5Xgg055Ilg3S9nKAWNfOXaT7ni6gAX6qNBbfw+zuNzLv0mQjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4375
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_06,2025-04-24_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2504240105
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDEwNiBTYWx0ZWRfX30OvXbS1gDKO vyEZVLa5jRlvovDS41ylddbP9/GltlFijHP1cQQscvP9jA3YYex3+HzMvQl2MAUlpUIbZ/KqX5d aqtmJj5V7TvCIzJzSxA3XLCPjTIcXjB0Adg4eFrmDb4F/gWpFFAA6RoRXrdhGxE8e1j8hPbwxnU
 rXSR1UKIUU7aHekMvLEBa0dGPTwLsXnAADhkZzW96brTJV6u3Vb+Bl4O0AIJvGD3sqMXcGbZDPb zglIdgDZRDft8wCX9g/90+qdrm1t2cVK/rbZNRsKCtms7esGcCZtpfodGLc/7Of2d0r9+5w550j 0mDGGtP7MrGcSXc+TPx1bWY+5K4UdLPDPvZWbhP/v2TEGGkfdMMzOtFLEqP/7QwMasP0WM+zws9 NRCDv3sF
X-Proofpoint-GUID: d3TCP2GIDE2BSkZLNDMGpGuFpFrGzsHg
X-Proofpoint-ORIG-GUID: d3TCP2GIDE2BSkZLNDMGpGuFpFrGzsHg

On Tue, Apr 15, 2025 at 01:11:57PM -0400, Eugene Loh wrote:
> On 4/15/25 07:59, Kris Van Hees wrote:
> 
> > On Fri, Apr 11, 2025 at 05:20:00PM -0400, Eugene Loh wrote:
> > > On 4/11/25 16:48, Kris Van Hees wrote:
> > > 
> > > > Partial comments below (still looking at the provider changes)...
> > > > 
> > > > On Thu, Apr 03, 2025 at 01:02:52AM -0400, eugene.loh@oracle.com wrote:
> > > > > From: Eugene Loh <eugene.loh@oracle.com>
> > > > > 
> > > > > The sched provider trampoline for enqueue and dequeue probes had
> > > > > pending FIXMEs for providing a cpuinfo_t* for the cpu associated
> > > > > with the run queue.  Implement the missing code.
> > > > > 
> > > > > Since the cpu associated with the run queue might be different from
> > > > > the cpu where we are running, it becomes necessary to access the
> > > > > cpuinfo for some random cpu.  With Linux 5.18, there is a BPF
> > > > > helper function map_lookup_percpu_elem() that allows such lookups
> > > > > on per-cpu arrays.  To support older kernels, however, we change
> > > > > the cpuinfo BPF map from per-cpu to global.  Also, it is a hash
> > > > > table rather than an array in case cpus are not numbered consecutively.
> > > > I agree with all the above.  Good solution.
> > > > 
> > > > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > > > ---
> > > > >    bpf/get_agg.c                     |  2 +-
> > > > >    bpf/get_bvar.c                    |  2 +-
> > > > >    libdtrace/dt_bpf.c                | 34 ++++++--------
> > > > >    libdtrace/dt_cg.c                 |  5 ++-
> > > > >    libdtrace/dt_prov_lockstat.c      |  4 +-
> > > > >    libdtrace/dt_prov_sched.c         | 74 +++++++++++++++++++++++++------
> > > > >    libdtrace/dt_work.c               | 20 +++------
> > > > >    test/unittest/sched/tst.enqueue.d |  1 -
> > > > >    8 files changed, 89 insertions(+), 53 deletions(-)
> > > > > 
> > > > > diff --git a/bpf/get_agg.c b/bpf/get_agg.c
> > > > > index c0eb825f0..e70caa6ef 100644
> > > > > --- a/bpf/get_agg.c
> > > > > +++ b/bpf/get_agg.c
> > > > > @@ -21,7 +21,7 @@ extern struct bpf_map_def cpuinfo;
> > > > >     */
> > > > >    noinline uint64_t *dt_no_agg(void)
> > > > >    {
> > > > > -	uint32_t		key = 0;
> > > > > +	uint32_t		key = bpf_get_smp_processor_id();
> > > > >    	dt_bpf_cpuinfo_t	*ci;
> > > > >    	ci = bpf_map_lookup_elem(&cpuinfo, &key);
> > > > > diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> > > > > index d372b3445..d81c3605f 100644
> > > > > --- a/bpf/get_bvar.c
> > > > > +++ b/bpf/get_bvar.c
> > > > > @@ -67,7 +67,7 @@ noinline uint64_t dt_bvar_caller(const dt_dctx_t *dctx)
> > > > >    noinline uint64_t dt_bvar_curcpu(const dt_dctx_t *dctx)
> > > > >    {
> > > > > -	uint32_t	key = 0;
> > > > > +	uint32_t	key = bpf_get_smp_processor_id();
> > > > >    	void		*val = bpf_map_lookup_elem(&cpuinfo, &key);
> > > > >    	if (val == NULL) {
> > > > > diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> > > > > index 6d42a96c7..d6722cbd1 100644
> > > > > --- a/libdtrace/dt_bpf.c
> > > > > +++ b/libdtrace/dt_bpf.c
> > > > > @@ -761,37 +761,29 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
> > > > >    static int
> > > > >    gmap_create_cpuinfo(dtrace_hdl_t *dtp)
> > > > >    {
> > > > > -	int			i, rc;
> > > > > +	int			i;
> > > > >    	uint32_t		key = 0;
> > > > >    	dtrace_conf_t		*conf = &dtp->dt_conf;
> > > > >    	size_t			ncpus = conf->num_online_cpus;
> > > > > -	dt_bpf_cpuinfo_t	*data;
> > > > > +	dt_bpf_cpuinfo_t	data;
> > > > Not sure about this, because (see below)...
> > > > 
> > > > >    	cpuinfo_t		*ci;
> > > > > -	/*
> > > > > -	 * num_possible_cpus <= num_online_cpus: see dt_conf_init.
> > > > > -	 */
> > > > > -	data = dt_calloc(dtp, dtp->dt_conf.num_possible_cpus,
> > > > > -			 sizeof(dt_bpf_cpuinfo_t));
> > > > > -	if (data == NULL)
> > > > > -		return dt_set_errno(dtp, EDT_NOMEM);
> > > > > -
> > > > > -	for (i = 0, ci = &conf->cpus[0]; i < ncpus; i++, ci++)
> > > > > -		memcpy(&data[ci->cpu_id].ci, ci, sizeof(cpuinfo_t));
> > > > > -
> > > > >    	dtp->dt_cpumap_fd = create_gmap(dtp, "cpuinfo",
> > > > > -					BPF_MAP_TYPE_PERCPU_ARRAY,
> > > > > +					BPF_MAP_TYPE_HASH,
> > > > >    					sizeof(uint32_t),
> > > > > -					sizeof(dt_bpf_cpuinfo_t), 1);
> > > > > +					sizeof(dt_bpf_cpuinfo_t), ncpus);
> > > > >    	if (dtp->dt_cpumap_fd == -1)
> > > > >    		return -1;
> > > > > -	rc = dt_bpf_map_update(dtp->dt_cpumap_fd, &key, data);
> > > > > -	dt_free(dtp, data);
> > > > > -	if (rc == -1)
> > > > > -		return dt_bpf_error(dtp,
> > > > > -				    "cannot update BPF map 'cpuinfo': %s\n",
> > > > > -				    strerror(errno));
> > > > > +	memset(&data, 0, sizeof(data));
> > > > Do we need this, because (see below)....
> > > > 
> > > > > +	for (i = 0, ci = &conf->cpus[0]; i < ncpus; i++, ci++) {
> > > > > +		memcpy(&data.ci, ci, sizeof(cpuinfo_t));
> > > > Do we need this, because (see below)....
> > > > 
> > > > > +		key = ci->cpu_id;
> > > > > +		if (dt_bpf_map_update(dtp->dt_cpumap_fd, &key, &data) == -1)
> > > > Why can'you we simply do:
> > > > 
> > > > 		if (dt_bpf_map_update(dtp->dt_cpumap_fd, &key, ci) == -1)
> > > I think the problem is that the BPF map has elements with size
> > > sizeof(dt_bpf_cpuinfo_t).  Meanwhile, ci has size sizeof(cpuinfo_t), which
> > > is smaller.  So if we do an update like that, the map will have stuff where
> > > we want it to be initialized to 0.
> > Yes, but I am 99% certain that BPF maps are allocated and initialized with
> > zeros because doing otherwise would be a major security risk for the kernel.
> > So you can count on that (should verify first to make certain but honestly
> > it needs to be or else it could leak data which is a big no-no).
> 
> I don't think that helps.  We do not feed map_update() a size.  We cannot
> say, "Fill in only the first few bytes of the element."  We just point to
> where the new value is and the BPF function copies as much data in as it
> needs for the map element.  Unless we prepare a zero-padded copy of the
> data, map_update() will overreach and copy in values that should be zero but
> are actually data corresponding to other CPUs.

Ah yes, you are right of course.  Nevermind.

> 
> > > > > +			return dt_bpf_error(dtp,
> > > > > +					    "cannot update BPF map 'cpuinfo': %s\n",
> > > > > +					    strerror(errno));
> > > > > +	}
> > > > >    	return 0;
> > > > >    }
> > > > > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > > > > index 6dcf4cd3d..d83b1c2ce 100644
> > > > > --- a/libdtrace/dt_cg.c
> > > > > +++ b/libdtrace/dt_cg.c
> > > > > @@ -1243,9 +1243,12 @@ dt_cg_epilogue(dt_pcb_t *pcb)
> > > > >    		} else {
> > > > >    			idp = dt_dlib_get_map(dtp, "cpuinfo");
> > > > >    			assert(idp != NULL);
> > > > > +
> > > > > +			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_get_smp_processor_id));
> > > > > +
> > > > >    			dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
> > > > >    			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_2, BPF_REG_FP, DT_STK_SP));
> > > > > -			emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_2, 0, 0));
> > > > > +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_2, 0, BPF_REG_0));
> > > > >    			emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> > > > >    			emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, pcb->pcb_exitlbl));
> > > > >    			emit(dlp, BPF_MOV_IMM(BPF_REG_1, 1));
> > > > > diff --git a/libdtrace/dt_prov_lockstat.c b/libdtrace/dt_prov_lockstat.c
> > > > > index c73edf9be..8b2cf4da2 100644
> > > > > --- a/libdtrace/dt_prov_lockstat.c
> > > > > +++ b/libdtrace/dt_prov_lockstat.c
> > > > > @@ -121,11 +121,13 @@ static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
> > > > >    {
> > > > >    	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfo");
> > > > > +	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_smp_processor_id));
> > > > > +
> > > > >    	assert(idp != NULL);
> > > > >    	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
> > > > >    	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> > > > >    	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_BASE));
> > > > > -	emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_2, 0, 0));
> > > > > +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_2, 0, BPF_REG_0));
> > > > >    	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> > > > >    	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
> > > > >    	emit(dlp, BPF_MOV_REG(BPF_REG_6, BPF_REG_0));
> > > > > diff --git a/libdtrace/dt_prov_sched.c b/libdtrace/dt_prov_sched.c
> > > > > index 3a218f3cb..a548e679f 100644
> > > > > --- a/libdtrace/dt_prov_sched.c
> > > > > +++ b/libdtrace/dt_prov_sched.c
> > > > > @@ -84,6 +84,40 @@ static int populate(dtrace_hdl_t *dtp)
> > > > >    			       probe_args, probes);
> > > > >    }
> > > > > +/*
> > > > > + * Get a pointer to the cpuinfo_t structure for the CPU associated
> > > > > + * with the runqueue that is in arg0.
> > > > > + *
> > > > > + * Clobbers %r1 through %r5
> > > > > + * Stores pointer to cpuinfo_t struct in %r0
> > > > > + */
> > > > > +static void get_cpuinfo(dtrace_hdl_t *dtp, dt_irlist_t *dlp, uint_t exitlbl)
> > > > > +{
> > > > > +	dt_ident_t	*idp = dt_dlib_get_map(dtp, "cpuinfo");
> > > > > +
> > > > > +	assert(idp != NULL);
> > > > > +
> > > > > +	/* Put the runqueue pointer from mst->arg0 into %r3. */
> > > > > +	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
> > > > > +
> > > > > +	/* Turn it into a pointer to its cpu member. */
> > > > > +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_3, dt_cg_ctf_offsetof("struct rq", "cpu", NULL, 1)));
> > > > > +
> > > > > +	/* Call bpf_probe_read_kernel(%fp + DT_TRAMP_SP_SLOT[0], sizeof(int), %r3) */
> > > > > +	emit(dlp, BPF_MOV_IMM(BPF_REG_2, (int) sizeof(int)));
> > > > > +	emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
> > > > > +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
> > > > > +	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_probe_read_kernel));
> > > > > +	emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, 0, exitlbl));
> > > > > +
> > > > > +	/* Now look up the corresponding cpuinfo_t. */
> > > > > +	dt_cg_xsetx(dlp, idp, DT_LBL_NONE, BPF_REG_1, idp->di_id);
> > > > > +	emit(dlp, BPF_MOV_REG(BPF_REG_2, BPF_REG_FP));
> > > > > +	emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_2, DT_TRAMP_SP_SLOT(0)));
> > > > > +	emit(dlp, BPF_CALL_HELPER(BPF_FUNC_map_lookup_elem));
> > > > > +	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_0, 0, exitlbl));
> > > > > +}
> > > > > +
> > > > >    /*
> > > > >     * Generate a BPF trampoline for a SDT probe.
> > > > >     *
> > > > > @@ -98,18 +132,39 @@ static int populate(dtrace_hdl_t *dtp)
> > > > >     */
> > > > >    static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> > > > >    {
> > > > > +	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
> > > > >    	dt_irlist_t	*dlp = &pcb->pcb_ir;
> > > > >    	dt_probe_t	*prp = pcb->pcb_probe;
> > > > >    	if (strcmp(prp->desc->prb, "dequeue") == 0) {
> > > > > -		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
> > > > > -		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> > > > >    		/*
> > > > > -		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
> > > > > -		 *	  associated with the runqueue.
> > > > > +		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
> > > > > +		 */
> > > > > +		get_cpuinfo(dtp, dlp, exitlbl);
> > > > > +
> > > > > +		/*
> > > > > +		 * Copy arg1 into arg0.
> > > > >    		 */
> > > > > -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
> > > > > +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
> > > > > +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
> > > > > +
> > > > > +		/* Store the cpuinfo_t* in %r0 into arg1. */
> > > > > +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
> > > > >    	} else if (strcmp(prp->desc->prb, "enqueue") == 0) {
> > > > > +		/*
> > > > > +		 * Get the runqueue from arg0 and place its cpuinfo_t* into %r0.
> > > > > +		 */
> > > > > +		get_cpuinfo(dtp, dlp, exitlbl);
> > > > > +
> > > > > +		/*
> > > > > +		 * Copy arg1 into arg0.
> > > > > +		 */
> > > > > +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
> > > > > +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_3));
> > > > > +
> > > > > +		/* Store the cpuinfo_t* in %r0 into arg1. */
> > > > > +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(1), BPF_REG_0));
> > > > > +
> > > > >    /*
> > > > >     * This is ugly but necessary...  enqueue_task() takes a flags argument and the
> > > > >     * ENQUEUE_HEAD flag is used to indicate that the task is to be placed at the
> > > > > @@ -120,15 +175,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> > > > >     * outside the kernel source tree.
> > > > >     */
> > > > >    #define ENQUEUE_HEAD	0x10
> > > > > -
> > > > > -		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(1)));
> > > > > -		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_0));
> > > > > -		/*
> > > > > -		 * FIXME: arg1 should be a pointer to cpuinfo_t for the CPU
> > > > > -		 *	  associated with the runqueue.
> > > > > -		 */
> > > > > -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(1), 0));
> > > > > -
> > > > >    		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
> > > > >    		emit(dlp, BPF_ALU64_IMM(BPF_AND, BPF_REG_0, ENQUEUE_HEAD));
> > > > >    		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
> > > > > diff --git a/libdtrace/dt_work.c b/libdtrace/dt_work.c
> > > > > index 498d5332a..2167ed299 100644
> > > > > --- a/libdtrace/dt_work.c
> > > > > +++ b/libdtrace/dt_work.c
> > > > > @@ -37,35 +37,29 @@ END_probe(void)
> > > > >    int
> > > > >    dt_check_cpudrops(dtrace_hdl_t *dtp, processorid_t cpu, dtrace_dropkind_t what)
> > > > >    {
> > > > > -	dt_bpf_cpuinfo_t	*ci;
> > > > > -	uint32_t		cikey = 0;
> > > > > +	dt_bpf_cpuinfo_t	ci;
> > > > > +	uint32_t		cikey = cpu;
> > > > >    	uint64_t		cnt;
> > > > >    	int			rval = 0;
> > > > >    	assert(what == DTRACEDROP_PRINCIPAL || what == DTRACEDROP_AGGREGATION);
> > > > > -	ci = dt_calloc(dtp, dtp->dt_conf.num_possible_cpus,
> > > > > -		       sizeof(dt_bpf_cpuinfo_t));
> > > > > -	if (ci == NULL)
> > > > > -		return dt_set_errno(dtp, EDT_NOMEM);
> > > > > -
> > > > > -	if (dt_bpf_map_lookup(dtp->dt_cpumap_fd, &cikey, ci) == -1) {
> > > > > +	if (dt_bpf_map_lookup(dtp->dt_cpumap_fd, &cikey, &ci) == -1) {
> > > > >    		rval = dt_set_errno(dtp, EDT_BPF);
> > > > >    		goto fail;
> > > > >    	}
> > > > >    	if (what == DTRACEDROP_PRINCIPAL) {
> > > > > -		cnt = ci[cpu].buf_drops - dtp->dt_drops[cpu].buf;
> > > > > -		dtp->dt_drops[cpu].buf = ci[cpu].buf_drops;
> > > > > +		cnt = ci.buf_drops - dtp->dt_drops[cpu].buf;
> > > > > +		dtp->dt_drops[cpu].buf = ci.buf_drops;
> > > > >    	} else {
> > > > > -		cnt = ci[cpu].agg_drops - dtp->dt_drops[cpu].agg;
> > > > > -		dtp->dt_drops[cpu].agg = ci[cpu].agg_drops;
> > > > > +		cnt = ci.agg_drops - dtp->dt_drops[cpu].agg;
> > > > > +		dtp->dt_drops[cpu].agg = ci.agg_drops;
> > > > >    	}
> > > > >    	rval = dt_handle_cpudrop(dtp, cpu, what, cnt);
> > > > >    fail:
> > > > > -	dt_free(dtp, ci);
> > > > >    	return rval;
> > > > >    }
> > > > > diff --git a/test/unittest/sched/tst.enqueue.d b/test/unittest/sched/tst.enqueue.d
> > > > > index f445ac843..28dcace8c 100644
> > > > > --- a/test/unittest/sched/tst.enqueue.d
> > > > > +++ b/test/unittest/sched/tst.enqueue.d
> > > > > @@ -4,7 +4,6 @@
> > > > >     * Licensed under the Universal Permissive License v 1.0 as shown at
> > > > >     * http://oss.oracle.com/licenses/upl.
> > > > >     */
> > > > > -/* @@xfail: dtv2 */
> > > > >    #pragma D option switchrate=100hz
> > > > >    #pragma D option destructive
> > > > > -- 
> > > > > 2.43.5
> > > > > 
