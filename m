Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF4182D192B
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 19:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765479621; cv=fail; b=RI2NNuDtqvoItlO3oWfDeYgsVlMU9wIojdGMZSNSoM73YNL5icRSRcBqCr5Tyt0tAWFMioc10T30uTxLQC6UNeLPd4XyuCBDIAIHYh8qSzJv38HvgS2URuOwaaeVB2iSaZbRe3KDoxM4thKxqES9p+Uz5e337LFDyLmp7BBqrKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765479621; c=relaxed/simple;
	bh=iHW2oNQ/Km1AC7Pm2+/x884C9vU+IxNDnjf3gIqKH9M=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fwdgo3ErVlflLaCCGR8KvwbKxmqdeHPaTDaX3NI/I5xtdi+FEs7O2KDQlsybxOag2g1pbBT2HqWWdPEPNaX7JRdYM8kX2EMwcW05VZjt6uxcb0f+69/hsLvvJsUZRLaoT4lGKV3AmZExLiDWbNOUN/JW5OD8mGFLiKorBhzsyg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CxtKoNyB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PcWKnPtp; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CxtKoNyB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PcWKnPtp"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBG5DU81635408
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 19:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=vdlR/WN5PDSxZbxYR+
	3gpShw12PR1bwKU8F75E30G6Y=; b=CxtKoNyBqMwjkok7QZQEItbRNil5dck2Qs
	/Z+avSzPzkCO2hctLBZVxXudk+bV1Hr09ibOy6oKJCBwYi20C90hxX0hte5yg9E0
	EUAEKr77+uZI2HrX6wQ7SdD7r6vux8Nuhz6MUHqDUmw+35tQXFjVQOtYlxWXc39w
	TbpwSsLWl47xSvSkAfLbbIr+732tCJSqI4mZAwN9iW8eAOYIces5WQgD/q7vzvhd
	EzEb2ZlqvC0Q0H0E3f0cm0/mE73a3Ynx8YvYXF4yKBONoqNcPALtgHsgLRkuJju5
	Sji3m1jbla/MJDJW5o6yJB22iqeAqccbM6TEORt4ARLZMSbzfuUg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4aycqba5xj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 19:00:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BBIGBxV018194
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 19:00:16 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010061.outbound.protection.outlook.com [52.101.85.61])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4avaxbxgtb-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 19:00:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l07+wx21H7Tn2WGHL2O9wAj4N9NdavnEwdgIYcXHHg9cI3AHVPCh/0cPnv0qBmHRM/G7vJlM51+uAUiK6kt7/tRIyQA5uwQC7IR1n4aH5EM0hCkUz2aA0U3vbazJKwj+sPqbdfIF7NiZRjct4jh1UUzCtvT2Bg14aUOqKWpULzOEn/h+PWyd+VfYDD+H3PL0FrVPdqKcGgV6peIyCVVOn99FXaHi9OfKfZWYP/pOX/gYcPQigcApZTgPigI6/2FBcxtVPVjBLOXpERANHSpzE5RLwl+cdX2XdXG9oazXpfr18q1U1F0TFd7sf0DCTDFk7Cqeu771Xl6kcSs3Di8nMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vdlR/WN5PDSxZbxYR+3gpShw12PR1bwKU8F75E30G6Y=;
 b=h0024HHvGEYE/lob882969a2ZSQQkKMagSaqYOjBx7ga7jqMjzYg6V73uCaP9oiwYo39PD7IDo2/0J9nF4nrcL5yimcQUinFOxKyJEs0DK8Des7PYiyLcWay04/uy5EbgbYBrDZywkJqFwI3Tw2T2Dlt7LfXtDqAWyK5oIah5sDAKMrHcmezUKMYXVGe/Y8b6F0fi7J1xiTK98PIAxoOKFbs5QebVGFc13/9SqoIziBAUSOk/XgTqHDxdJYe91G4uAKGg6u8U/KUUteMjfrjNRzp+7+dW7mCWhS9M9ckY51Tsn2Fzm2iAzfnsWjeRr/BPdIoOcAUsS47BHl0jjV2tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vdlR/WN5PDSxZbxYR+3gpShw12PR1bwKU8F75E30G6Y=;
 b=PcWKnPtpvOyFXtVmDhyOib+z9DSoYff6zgRAVt9+a6LlMg1HXzDzuarelEDIR63M1fUTGL8pe1K3ROWj6pC06shtl92A7CULJzaE8UoY2108ZLJneClcB8VIo9X/emVbZw8J0/eKlF6Vrs8g1pXHoqMu1Q1dEBk0DGndC7AniJo=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BLAPR10MB5073.namprd10.prod.outlook.com (2603:10b6:208:307::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 19:00:11 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 19:00:10 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/3] doc: Clean up list of unimplemented functions
Date: Thu, 11 Dec 2025 14:00:03 -0500
Message-Id: <20251211190003.10486-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251211190003.10486-1-eugene.loh@oracle.com>
References: <20251211190003.10486-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH8PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BLAPR10MB5073:EE_
X-MS-Office365-Filtering-Correlation-Id: 00020f17-a173-4faf-0806-08de38e78233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s2fpaUfhBgTNx0atd0PI/wkkm0zQPhxP1OpWZeDgJ6sfZDj/7RJSLQl+9shH?=
 =?us-ascii?Q?nC1vDDjyO8lt3w/LO7e3v8gxh8Ic1ZfvI2NXFpv5v5pz8DfVVDeU3VvOyWOC?=
 =?us-ascii?Q?p6V5seUNBe1DUGFeDPRNPGoG+MvbEyL4c5rW/lw/UjItXufnZ2An/QuL61KC?=
 =?us-ascii?Q?Ydm9aTSJPY+IPOdVefwJ3Zxf2uCf2/YIXAu6jwUeZFTHcVwiwPAtpY74SRA+?=
 =?us-ascii?Q?EyndgcTWL9mTQ3D+ACokaXze/i66XzXHkW6YdayIur+/GpK+UK8DrH0M/KHB?=
 =?us-ascii?Q?igC25SHZDRZxNi9iQRSr1H4twZwV9tKdhNQdqMJOJ/fQ2oPTqnQifDX+OO9W?=
 =?us-ascii?Q?UDhQwazA+/47sGuEcRxdb2ERawEJCaSjvGWU9oqLqSlJDPzUGznOAJ3Fgmjj?=
 =?us-ascii?Q?R/AdRrN7btt/YQUuajxI1OguqoeQnyHlJDAiTdYjqQK/VuIHB7QBG0CJs58q?=
 =?us-ascii?Q?BGNBMMN7s670zFFVPWsN3yRY/PJlD7l0BWliYItYDdsha3Bhh/ykRPRjP7Cm?=
 =?us-ascii?Q?ARpWvaKB9B6ido1vnR/xRpCSPOnD3uaofCciI3P3p2NJtw0IwxQrr2BajNvD?=
 =?us-ascii?Q?F56AEu8ill/+zsBIhy1Uzjck1W0ZQfIniuaF6lnoPuDUAREy8COLLNs7kO8f?=
 =?us-ascii?Q?gRiE1eJwnj7E67gwZxXOQDuWoWWOTBxC0Ex6Y9kylEIBjmke7JDCMONPKYty?=
 =?us-ascii?Q?hgKoz4CGpE7/Srbl+Vrka9j+sMv7UjJibMBAkwNuAfcv79vvasJjMSdcgS4C?=
 =?us-ascii?Q?puuRFIUCAWLFgT0v14UD2kx6/6kr550gvfsEpnzO2m11mTA6NN3OwX5ArtOS?=
 =?us-ascii?Q?wFnJ0fMItdDXLbkVV6HHjdgLzYwX9CPN170E8iDt3ir+jifDiW8fvIUKf4rR?=
 =?us-ascii?Q?AJPvueG9PdsJSuwqqlgcSJHNEbQT1OWbJWlphjZeZSCMkCb2/HkeUxwBStL/?=
 =?us-ascii?Q?vFgbbaOdesxY0bWbRBXdf3lY4jD0b5bIlop4jBCEykk0L+oW49JopvRC18YS?=
 =?us-ascii?Q?S0aH0Elw3M95jmSHH3QXBDSWrbdSIevnChhEz/oCThSv1zKkLiUkvnfvmQP5?=
 =?us-ascii?Q?pgstMFlEBSiZcZ58aTqFCPky6mPHrOdjHIiqv/xHLgrBA71P21POlVoTul8j?=
 =?us-ascii?Q?pKJ8Pi028mFZMN+11RWARhXd98C4IrCSEmMYqFYeqRZpHb9zq/CRU3vLjmZ3?=
 =?us-ascii?Q?KswBBFCwPGJvw924SBsYgN8mK4pU/4YB7fITFs6iX6BbGsAuAzz9SJPglANJ?=
 =?us-ascii?Q?HAvR1JohKIGIhsPRCg40NtFZu8NBtlKK/Tl8swB3cXfq27cTlYwnCIwZSuJh?=
 =?us-ascii?Q?GChS1giffOOpeElFbY4W8UWm0DOl5THWa5SgpIaT2Tmc/XgMgV2fg6s1XJ7p?=
 =?us-ascii?Q?ABlyM4Sw+R/chwdNhF70oMLXcz6OQ15TkgfLlmjg4U6ZT4QlMTmBMjR4oS5J?=
 =?us-ascii?Q?NqzwUlphTAoTn5IMvBDxNYw8nRX4TfTh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hf08Oh4U0zhGDcSdOctWvFMUEZ5KX/hgaM4U8X30Li7mZTl+X2JC0aHicwR7?=
 =?us-ascii?Q?D8QwUQVzR2GXPWdbMooLLNnvj1ACOSizDlkXtm9xL0xcanIQm23IWrpx/kOX?=
 =?us-ascii?Q?iyTnr+ABsS+SsjbY9h9gUon9BqEVmgj9+1hKUrTXY2x05563trkvwybXYkIY?=
 =?us-ascii?Q?ThiJsyhkGHsMDN6TeSlrvJAe/eRTEfsp82gWVaBnyPFlpZ3ga5i+Pr6RGi37?=
 =?us-ascii?Q?PRkJKeJ3+wdR+zP921pxUe4N7GhGChBcTrimbpua/1rFnkyBfpoY9aknibbm?=
 =?us-ascii?Q?pZ+oC+775yX+ToP0L1xcurVFPH1V4Xay2zwC0KPHxTQdtBf6PNHvo+s3zqK9?=
 =?us-ascii?Q?w0dtbONBpBOclHHUOn1Oq0Y2lVPSL2SCYgC52SZK9tVdKniKc2577dhJec1K?=
 =?us-ascii?Q?j0T0n1UvRIpymy0r+8p4Rnz6zP3oyot0IsbwZje13xCM4GuhPcUzecH2e+5H?=
 =?us-ascii?Q?Cy35+GiNP6aemohTx1rZmhR0DSuHbZjgQBUAByxwNQjZiLNrO+u+4ko9Mh+S?=
 =?us-ascii?Q?Kz+R79gEbE9Osyo2W2egjK0FCTV0HBlUz/GcGsZdPplBZxHEcHoVmWkM8ZpR?=
 =?us-ascii?Q?Eo72z4+4jGunA4QdJUa5fZgAxBIQt1GMjSvhStPKDPlDZARDrFWadnIwizUL?=
 =?us-ascii?Q?TDXps0K4+PGOWeqB2yzAUr+78DRVWm4+E12wjaA5L9hYvxRnuaquf8qWYK96?=
 =?us-ascii?Q?I30QzxGSdFzMkS8MHiR9bvt72bYh/FNGedE46h//BSrEX6DrgFWQtjkM95i+?=
 =?us-ascii?Q?KsEUCcjbpZ1LgwEMnxUO1ZOG+3Ccp2OxjEM3AOmuS1+dpJOaGUnuXG7ZUjPx?=
 =?us-ascii?Q?oR6O5+SPizMHkT8mPHpK5PvzSSoe0suekqOnh00JL4+zxpwVkOpAKz9ui0dI?=
 =?us-ascii?Q?qzwmuU32DGIiJp+RNBnNn7N+at22mVTm+o8rjReXcO21oemU64JkpRY/hWet?=
 =?us-ascii?Q?B/B/X4KG9XTX/ZrU+rUWuxXlVcbWyjA9HgeveifasY9iCATndSagjPiiwaRP?=
 =?us-ascii?Q?76TmX93qvk/dGrrMd4ySulBCKdyBAjcPF+euR9gV9f1djhyvDo3sJjWVGU7U?=
 =?us-ascii?Q?d+5Fnoh93xsg4xVI0/M7jAGPUoHhNYE7PYk1o/2Se0WP2s4pKlgdKHaE5fwR?=
 =?us-ascii?Q?hWa5tB5K0NzO0hBF3yf5fv9kAldAm2OJB4tsz9kByOdPicRzqHxA2+r6Bm3E?=
 =?us-ascii?Q?IxXtVsMUM1cWNINMtF1zTvz8ZlY9my0PtO4IzNTOdllV/b5y0Xuu+aDaZCba?=
 =?us-ascii?Q?htUobGZaeoefrV9U1V1PVuLza9saY7+ZFIU5EI1Nb5o1mY3JqzcTJdd59RYJ?=
 =?us-ascii?Q?Gg2SQDBTOohuOrZwRcT2HU+ZWTFfHnoOt0pQwbwRf+nmJCpqzGhwdj+OEkjz?=
 =?us-ascii?Q?kQawbvFm8jmsOY5wmr5512ZOt9bDBnHor7YFcI8Tnb+STqhejr0kxK3qMiIQ?=
 =?us-ascii?Q?G2ug8FwDYai8MovZ/2hDwb3RgKmjcK3k8nHv9bveNC5OIxtRyIM+kELXwNeX?=
 =?us-ascii?Q?94fkcMGpQpGx9191waVoH9Anhe2tq6Mz7BN9TBwdhUgZw3rO3skXaChVludK?=
 =?us-ascii?Q?KVh1Cry5cfvMttvHJ1NswSh/uG3QUEbj17h3rf3e?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wRdHQp2ru8eb7KuQ+CHxzSYwip6Uqns/WptOZ2z071Y2p3G+UgCo+Pcmw6rcUajRhyuoBs8U4BvOBlMNBfZOYwB6jgE9DD4DrlUz+uYQMaW07YuC/5xtPf+WCpWQPczpAI1QoZYlSGAqLBCJtunUMXeIA+AFlLHWz89U+epGoUoEoj2jh+F0uIkwvVCrjCN02D8jEs4wxaDohFMQTvA5rb9R26atPACFcZn+LQIE0EFys6z9pnJV7vb4Je4417MEfIzK5oDXP27lXwgXS3HCoFvvtfWCs2O1QhnTk0mTG7/L8OhfVDTgnnloVAqQ4YZABKz8Tibexucvw2ZzAePgWFv9l3xS+ktt9MYFXHMehcGpmdSi9w8qFTWoAOfYgrG/ODs4Pd3V0hi0EA8V1OrXKm6tE4xKy5mxZhTsLT3OxRE5SSOG63aEVNwk2WhjDdPdFJ6Puq7v0CJkoiWSaj4wY/CTnqlm/9BlrkkYXSmEDmKXhe5owHfCwTH98Fv1qb9VJiZqonzs2jVeXfPCyXYY7/rntSgpEfSXfFpIBhjvZpgZol3twUMG+f+NQwr7zKC+Q82oZJYlMVpMNXbdEArLCBTuga2CDNILYbZbT5TQtpE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00020f17-a173-4faf-0806-08de38e78233
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 19:00:10.8028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avQa239zjoDO1XNmgbq0eW1RjiKzCJdFyklQ5RskyMjxSmzyqnaPLHKNnL1DU5YE74M8plRW8st0XlZRG9SCjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5073
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 adultscore=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512110151
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDE1MSBTYWx0ZWRfX204tvNmnj0ta
 BOoDqXSXDUvbKnyKIAIw1QV5miW3XKGn3bMMv3muk1TH0hynMx/rPj8mrOw3wvZ625d0wm/kWfF
 0rWlU/jFZ7XR/0/CtYDuCPO59HkR7Bw3mJjZ3R7nITa/N8ZTq11GmYGJU4Wg79hqg2TAmKpjI72
 fYwvvaOZhz1jHy8ClnqwDk2W0wHIOR3QEq3gXne6WtYLIoqv6VMGefnX7Nh7GfAT6NYvh5Oowc3
 p5nVPWvlQsrbLL2jKUXxGlj1wRu1SXdCN+KmBIogQ6Iky0Giu7HCpKtyQ52z6Y6Kv7eOhHqbwAV
 RcIZ3eb+F6cwmOBdJmwrqHsMzyayWbLCmZBpjbWRoY93aiDZp5zCXIz0l2Zmeqez/S/JSveWc9u
 VnzQ1m+nfC8OslkwCy13OGNbYt/bVA==
X-Authority-Analysis: v=2.4 cv=R8UO2NRX c=1 sm=1 tr=0 ts=693b14c0 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=26Sn6DwbkJ2VNwVrCaUA:9
X-Proofpoint-ORIG-GUID: uzOY_wmo6aerK2gKZn0sCCCbdZOwrnqA
X-Proofpoint-GUID: uzOY_wmo6aerK2gKZn0sCCCbdZOwrnqA

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/reference/unimplemented_functions.md | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/doc/userguide/reference/unimplemented_functions.md b/doc/userguide/reference/unimplemented_functions.md
index f69600b56..a63bffdde 100644
--- a/doc/userguide/reference/unimplemented_functions.md
+++ b/doc/userguide/reference/unimplemented_functions.md
@@ -6,25 +6,13 @@ and some functions are not relevant to Linux and might never be implemented.
 The following functions are not currently implemented:
 
 -   `breakpoint`
-
 -   `chill`
-
 -   `dpath`
 -   `ddi_pathname`
-
--   `inet_ntoa6`
-
--   `inet_ntop`
-
 -   `msgdsize`
-
 -   `msgsize`
-
 -   `panic`
-
 -   `pcap`
-
 -   `stop`
 
-
 **Parent topic:**[DTrace Function Reference](../reference/dtrace_functions.md)
-- 
2.47.3

