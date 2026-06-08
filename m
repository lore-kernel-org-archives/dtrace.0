Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D0E2D5925
	for <dtrace@lists.linux.dev>; Mon,  8 Jun 2026 20:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780952077; cv=fail; b=VaxtaswJLaDCBSGyYNqQ/0IzrH09eu52C9oviEiyCIdzHrrShI9spucFNfKjfpJeNReDQRmtPqPre7tW2b6jL4nH9dCtaUl0AVX7bJ/yDtkpYoPzpgGR9Y6O0kP5O5xfRlhJkOtixxWdjmzd1agg7h2Vgs1BSyypcUePABMDIoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780952077; c=relaxed/simple;
	bh=Q/jDbUPhdU52Tf9FXwg+dacPpVf5Z8VMLASg6T4FCl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lYWX1Q8rR79L12IxhOWF1XdlsNnFkBqnT3MCGKSVhp89G+Ror5JK05rL0NKc2cdbkN1sVn11deRf2AGl0q/Elam8KLANxsuQCppJ5kMWccUK8kWrAQOD6Id1TN+pBTOHCYWLGgGhIGIRFuH18NgD/ex91M5PxPEmaH0KsXasr6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hZmxzFvf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=v2oOheJl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hZmxzFvf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="v2oOheJl"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658HSbTS3586877;
	Mon, 8 Jun 2026 20:54:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=nP+cAYnNSarmPlzkX9
	EK7wqk7l/K9t5Lw9db4MWES1Y=; b=hZmxzFvfzpMH4S6fV9QCE1sm5KufQNOgFT
	28CVLrN4kD6r189aF6TEOdny7AQgB2lvRlag8Z1wblueLcv0LkR7wR+nBJ81RB9s
	4p7YMLVZWGIeF+dfo+EH5HV11SyIijOD4RK3I7KR6MO6rhy0oeoo3GcL6O+SYEO9
	IAwf5b10XwCOmKvm8tphUKd08AUO1cLWdXP5qJB/eDxACksvDyS85zHUEZsgg85M
	Aoc8L8FD8dxkReSMaflQRDl+E1H051BGpVAtis9fmpLuPfQ5n3d640DtUv2xDJDZ
	pbdtG1vOZmgotOl2OgS32mPEl4km86KSD+cHnOx+ne4euFxASq8Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ema4y379f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jun 2026 20:54:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 658KraTi001895;
	Mon, 8 Jun 2026 20:54:32 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012008.outbound.protection.outlook.com [52.101.48.8])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ema0p9dwf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 08 Jun 2026 20:54:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zi4vS1FoEpdjtGC5YmOSQ+Fu6ywVHp83qYP2nbco2OgJ48GnyEvUcmgvxen5psqcq8bo5iJzrH82rqIPJuthIV1ZwUZEpsGAeomE3qKfG2X1bCVWxBadudv6C6lVMvcwOe5Sn9hgP1SgAdfkMZA4ralFo36v1qyZ5ElKBOJhxyO+AFxmRBi7at3s6FHSwrNiNzFuCSP2NYJgKBCsxKGYwgdjfpY0Pq6BfJoTOBC4NtpQJyPEaNS6jG2ggJ1wOB7R0sxP+WmTJGAi9oTg3eAsBhDKnkJ+H/+hJkem3ilznQ68bT1OlRQB46ZexGOPudf9raK/CFK/xp79fQMaZg14NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nP+cAYnNSarmPlzkX9EK7wqk7l/K9t5Lw9db4MWES1Y=;
 b=QQsZ/3DYV8KZhjE0ZBh4FIUPNXa74Z7L1thfec+tPBMsY2XrNazmwNb27R6YrK9faEYNpmqQXQwMs7/SfVAnNhnMf0m3nZ485G3Sjboh2qnA/EB2vC3hUFKUkgT3ah6cUxWWsQ/qMjHKPq/4i7JDypTLBXJ8cLlHYFC9uxDQwoN2MtIkD67VmqfbPONUNumvMDHiQRo5/SPAs/XzAJono+6fXvJNtJ/MbfyS/zT7aLwig6vqDNg9DfdWxDn+Bc+RBRYihfLoFByvNMKC/MFMhuu7y9zgw1FA3bdqV7/cr7Ir4xqSiGQgSF0RwazJWdeFTcHX0gopQRHNqsTrL2Olyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nP+cAYnNSarmPlzkX9EK7wqk7l/K9t5Lw9db4MWES1Y=;
 b=v2oOheJlQ4FtYE2LexyYeNvhPXWMH0VeuFV9WkVHlQPqYlzHSpZQopKBObY2DqNgSTMGVNllOr4RYAmfAhlt9VFiSfvIM8YlCKht1cvadwGwLAJIgFwEAK+jzKm8NZSblK2opQS1aJ1koSDYFHTXDyMUEfcKKBArttUExx19e6k=
Received: from PH0PR10MB5514.namprd10.prod.outlook.com (2603:10b6:510:106::17)
 by DM3PPFA927664FB.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Mon, 8 Jun 2026
 20:54:26 +0000
Received: from PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61]) by PH0PR10MB5514.namprd10.prod.outlook.com
 ([fe80::7a08:b55e:b242:9a61%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 20:54:26 +0000
Date: Mon, 8 Jun 2026 16:54:23 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        OpenAI Codex <codex@openai.com>, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 4/6] dtrace: Add uresolve(symbol_name[,
 optional_fallback]) for symbol lookup
Message-ID: <aicr_xS0ZiXkCKdO@oracle.com>
References: <20260605221217.1211791-1-alan.maguire@oracle.com>
 <20260605221217.1211791-5-alan.maguire@oracle.com>
 <aiNzBHzLAk45BqeS@oracle.com>
 <e5411146-fb52-4ff1-8660-3ed5ae561149@oracle.com>
 <aiclmi7vWR5IhX4a@oracle.com>
 <e8a1fcd4-1823-43b8-8df4-5188ed0a7dc0@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8a1fcd4-1823-43b8-8df4-5188ed0a7dc0@oracle.com>
X-ClientProxiedBy: BLAPR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:208:36e::22) To PH0PR10MB5514.namprd10.prod.outlook.com
 (2603:10b6:510:106::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5514:EE_|DM3PPFA927664FB:EE_
X-MS-Office365-Filtering-Correlation-Id: 8451154a-960c-4354-a947-08dec5a0205f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|6133799003|22082099003|3023799007|56012099006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info:
	jwP6UUrJzxAkYw6DEoKMtwOjAU+F2l7syNYjrLIPeZJ/gwpXUmZc+uECxgKNXmMmtkXrWA8MWomjR9TuuQdIpzaDU2CV+1ieHieAekf1d0QY/yCNzVnfzp5oUWT/cfD5SWZ0Fa2DnrPHKbWj/LES7/U2BXK72Vgb6xr6Swz0gVCg27ny2JKO8yU7vdEsdxCeufKp34kguXmcuA56GLQdTRZyKFGu6Nhs0q+qzuISsC4pUwIfK5lhbydyv9uty7yPU0+TiK7L5YKIEhrz19f42n3j6duhInXbfAYguTB2R03UQpacEIuoG5guk4wxgDKBjV2Hpl48kKveAO+ru5JwCBb2+q3DNfrEDo4HQUsNXiLD47HurJvivZi56Gnowc8GxErKzhnqvZ+HdBcFArLT4YlmuRnVh7f4my6tfCLdWCu3FjeGjqdydj++v9ULpXj/rzdv9RC3am5UkKZBVHRLTcwbj/MbKoRRHwYys0RYuQuPRdRFnb2rR7ZTMJI2GJBNtazOzSAscKhPBwagh2etugv1J/7BbLvSg1VwWlyM2LSZFBk/idey1v5zX65bNJhNlJvfxDay8VtcmjNurLaPhbZupdicLa5tVx51lCf1R7fmIMMiDjG8dR9F2Syr7TUY4IDFbcU0MF91TWNu1sKs8FUZ5cuSWoJ/KA4DaKdPRa4/E2NlkHnoqWiuTgKA1I8P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5514.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(6133799003)(22082099003)(3023799007)(56012099006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y6bRBJAmyFu1VLBU+3HkWpLW7k+nb+6gg9ANr4jTN3edGDVqChdEEniwtRgp?=
 =?us-ascii?Q?a69uer6mHVQ5AvWDSR6aHBXWvOcHTNryXlOxHAGFFB+dMX8BftJFkTe5JCIg?=
 =?us-ascii?Q?Nup3T+6/zIXi+Dn+/jnDTHqPWp9FXE3BTuOT20bWCQaIZP7pwM4RbPXeZG3O?=
 =?us-ascii?Q?KDilbbF9Uv9+/h3QQ9GCCPe653mG8AnkG3FNDbgg4BSL98B+qVOpDt4sw0oy?=
 =?us-ascii?Q?F5VNYD7G2+63T1YBguEHsSEuCckBIentUJ08u8rcFiXWKIKJcCO2Xs0AsU5+?=
 =?us-ascii?Q?6Oc9bdCnZ/ZrKIBDpVPJoJSQwVHtAoJMpDUVSsXbnofP+36x+uh7JcB3TyWd?=
 =?us-ascii?Q?6HgzP974fBUW8c3ywVan3GTu5o83DEHU8nV+gTVg7R3a5VEiumL1oQEGAOCW?=
 =?us-ascii?Q?72g0C8zp8J7P5bK0PcUzgIJqr0+wXJHIPw0XZVgs+1VotPKrddr1pY+yQTQi?=
 =?us-ascii?Q?OsGznDcwG6JOTnorfrgNTktaUbVRf9L6YJvI2gw16CTNrNf1OF32aev5AU5v?=
 =?us-ascii?Q?XXL8UOjJLai50YFtTDB2uAPe8mpFxiuGK+jV+/1zsrDf4onMwT3nTBwfw+IT?=
 =?us-ascii?Q?1Ojud3pvOULvm3o7xtEz9DOTt7shyqj9uHXdMhI6Y8rjgJL/+SQo/sOe2Hv8?=
 =?us-ascii?Q?n9j1YT+LPu7mWTG2FCG7ltKyQRirPb2funiiFtu9dJ20quwIn5JW8C+2cwGT?=
 =?us-ascii?Q?Z3HLnyaNE+zyFyqjeirrj9VGLQYwbBe5v/qZwY5x8Om7t29d8oHf2psrGRQo?=
 =?us-ascii?Q?+85yvXfQqnMIsiHWqr5uA4KiCUHuZ+W4ggUG4siG+WtQ80UTqcRa/nySUR0/?=
 =?us-ascii?Q?f3sQW04D6/ohnA7Nm/MkJ0X9zwNTO78oxLGVnhxY2KWMy5mKUT/Q8gzXBBr5?=
 =?us-ascii?Q?f/eyJ7osX76CTiq4wk48Mo5T+Fb1QGFcGyQ6OoBUhzN5qtINfb502pyOzUxN?=
 =?us-ascii?Q?3ui1ysvjZ/5ICprLNU69YgNdFlzZ859/0aoc/zMPqZozT9S+2TV556EHRiDl?=
 =?us-ascii?Q?/VDdGL6O+h23B+dlfpcmbgI9nknJDon1uEaYgWPSgtviGDz5ccph0q6bQ/r6?=
 =?us-ascii?Q?Y8vyLo5FY7URP/1LG7lM0KKZIY/n9k882rL86qTdvd/eKU1J6TlXhHLg6Klu?=
 =?us-ascii?Q?1Hh7QUX8rlraORbxseFZxV7e9Uos/EFmk9C82qiShjxLkiX4nTxlWghifjPX?=
 =?us-ascii?Q?eyhocZ3C1YWvjcQJjHNg+/Uggq1/XrPrm9LntL9TTtVeX3lPgBMXXnzNqN8X?=
 =?us-ascii?Q?QeOwQylzx7PpJNS3zEoUAr9EFQt+2gu6UD2J/cMgHLl0Ql7B2Zez0PhBBqOb?=
 =?us-ascii?Q?5dSnDQp/c8GakxgqGoaomr8sjdNzL0RuvwEoeC0EimtHaCYTal01gmvd5vsH?=
 =?us-ascii?Q?UnpHoVBYFtpmMMPV66mCFx7oaP23U63MdMJ9f+BkdXxfxYoKHxhbkypJzbiO?=
 =?us-ascii?Q?Xixh2JUpCPgD6XPoMYsHXlE057AXB0pXThqk0te41Wt4Jry3YrNtmETosnkU?=
 =?us-ascii?Q?yvGID800Y24ypLJRYrAoXEUADzMaZtsohQbfHS5Z+xvUmRZcMsfFcQblvhLD?=
 =?us-ascii?Q?FJ4n3RsMdFjpvDfsEaKApkugiZ60s3v5W4rEijWRSRB+dyslRhmYcYjdVYPV?=
 =?us-ascii?Q?pbl3mVsleKqs1AxgnlsJlzDan7F9+vSEsJ7fHjVqBqJfkMFPIZ4dvFMFqmMZ?=
 =?us-ascii?Q?J51tP+FGQ2Gn6dkS4ojhKM+y9abtPAKNHp7vl9q6vU+OIhf5t8orthV0GuiQ?=
 =?us-ascii?Q?lKw0wZQmSQ=3D=3D?=
X-Exchange-RoutingPolicyChecked:
	NdDe1yuTEStkEgmmJUWBio+d+4KffnKj91lDP1/sLxk4uo3lBzcSgOQ1RRcB8yGPBTrqoymmPTW3Edwmv2lm7rK3cogCBlD/CGQKJ1A0+FOH1kbyYcwHPoiPV97SMwC2M1g5lRiaH3G+dOxyFhARmXmjohrzzsZ2Qhcv0SxvI34ALcKnP8bWi1qz4/Ijvxdxsy0NyezRJSylf2D5K/ypThhVU+4ORyi/qrr0XJJa/wSnjlJFRaugJMC/AUjF+3YHjd/TIcXv6VjBw9eWt7gyo3KuStcSwraMgxq6NEVhM2p9cbyLVLN+oJM7Z3c//Tjcfm2Bk+Fk5eK10MsCu3geFQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ln3aN0f/7GrYVEPkBbVfAxRwbt7oO0z9vI5igfobLaOjvLg2LckoTTpW7EMUqP/mDWfEctnDX8t/Fc/fWaoDwaPassZ+JMRnIY5HpCa88aS3r5wGsN71yek+XzCy9aRbXutoO+LZ6TNnEm+9M4jDXgF7MyjvddPb73Wu09YTvaYU9E6jmFR6zStvJ4JLeNQoAxu77BwztF0VFmas++xF3fiej/JUE3Nih5cYg6YfRUl/lqpYUqucVq5WNR1rwtkXTcl8eDAJQxhVv8st3MCHnJIa+00dHt6RFo3msbVysiNzQKIWNNTwfevYXFTffeVWi1ULZOkSFIRCKSzmZb8THY53OYajXcKBUgmSaXikRpV6lnqPS16jVIuSLeEKDk6WXDFunN+uUjjA40i7zhhq4bka9sYJyccs6Z+pbuYETqA8iYmyDhTJKPTcsWG8NJQb/MgrMyhwCVM9j1Lhl6ZyhYY7Uw1q0CPOcQ3C1wlPI7D8f5XpItjcYzT9efQw8kxLS2DqfQfsW1o2xmsqtIBQvdd5CRLX47W1HrPu4c0la/DEWmn4IABCHrsDj+rbBfOBO7E2J81KQCPjGpr3KyAdOSB8Q3+EJjSkswURktpJ8M4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8451154a-960c-4354-a947-08dec5a0205f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5514.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 20:54:26.3293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvvyONFEuf3Jm3oSgV+yBLYHj1W8+QkCnR1hNUFlFVNP83XhgFI4FuwISF4mPlZJhdFbckKTRBORZlfUfm00ji6zHFtKR22kSWdDLkgQf6w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA927664FB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2605130000 definitions=main-2606080190
X-Authority-Analysis: v=2.4 cv=ZMvnX37b c=1 sm=1 tr=0 ts=6a272c09 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8
 a=LG5T7v2SAAAA:8 a=TRe_f5R5kw7P6AycXcgA:9 a=7poWOpBSuUQbxMhj:21
 a=CjuIK1q_8ugA:10 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf
 awl=host:12312
X-Proofpoint-ORIG-GUID: Db64hvWiC2GWRhVJ_mW-gAnzGAUnIytL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE5MCBTYWx0ZWRfX1zBYn0HaPQsX
 ZKtVVhPsIYVeAtTB24SqGg7bPCKQJQpWC+VDeNl7La6/9U9uqGVosoEy2XQVWdYdobP+v8UuL/9
 UV7Gyrmzgu+o7D8CcYrL5fz7UWUKQha9xtIgL4wrJaoPRqsnr0yATznlvlXLE/i5uBJWA0s/Ij4
 acBp2l2hFR3vCGX7DIIivKL63BkWWg1vOnnAOik8zb/X/eIwx/2eOqm2iBncoxIdlHgoxAj4BLJ
 T96XxhawcHI/VcYjqqOqLDap9Uy2QAhLMTR3mKE82OTUvJOdVDjz+RuQbvLQ1xDt1n49jv/ACvW
 ZpVqhZy3cjZmRxc08FKVJUoM4+/g15tBktVyFmAeTYCkQM54K+jhUgYORisP8pVrkr+plnZFP94
 hV3HeIuhEAs8+XABUvmAC8iM2VNEKVvKsuBP039Q6FfwMkc0Y92PtBXSCisiqGAm+B/v0LN5MYz
 pbn0KWGBlKx9QiojygUZEY2D0aD8YVQTrnTUqYJM=
X-Proofpoint-GUID: Db64hvWiC2GWRhVJ_mW-gAnzGAUnIytL

On Mon, Jun 08, 2026 at 09:38:52PM +0100, Alan Maguire wrote:
> On 08/06/2026 21:27, Kris Van Hees wrote:
> > On Mon, Jun 08, 2026 at 11:43:47AM +0100, Alan Maguire wrote:
> >> On 06/06/2026 02:08, Kris Van Hees wrote:
> >>> A few initial comments:
> >>>
> >>> - How is this different from what ``symbol or object``symbol would provide?
> >>>   (Yes, as far as I know it never got fully implemented but I think this might
> >>>    be similar to what you are doing, and perhaps it would be better to use the
> >>>    already documented syntax, and actually implement it more fully.)
> >>>
> >>
> >> this is a good idea; I've rebuilt using the existing `` syntax, and it works
> >> well.  My only reservation was losing the fallback behaviour that uresolve() provided;
> >> however I've implemented that with an option -xuresolvefail=zero which zeros out the 
> >> results of address resolution to allow scripts to handle missing symbols.
> > 
> > Hm, but the <module>``<symbol> resolving is done at compile time, so there
> > should be no need to have a fallback - if the symbol cannot be resolved, then
> > the script shouldn't be able to work.  This is similar to how kernel symbols
> > that do not exist cause <module>`<symbol> to fail to resolve and thus the
> > script won't compile.
> > 
> > Why would you end up trying to use a script using a userspace symbol without
> > knowing whether the symbol exists?  
> > 
> 
> Because in some cases (like libpython) the variables of interest change over
> time from version to version. Having a way to handle multiple versions allows
> us to create more portable scripts that are less tied to a specific version
> and can behave differently based on presence/absence of variables.

I think this would be better handled with #ifdef or some similar preprocessor
conditional than causing the compiler to accept an unknown symbol and giving it
a 0 value.

This may need a bit more thinking about...  I just don't like the notion of a
script using a userspace symbol, and having the code effectively act as if the
symbol does exist when it does not.  It feels like there ought to be a better
way than this, since it feels rather kludgy.

> >> One other change below relating to your next question..
> >>  
> >>> - I think it is problematic that the cg code is making calls to a function in
> >>>   a particular provider.  THe architecture has been quite careful at avoiding
> >>>   breaking through that boundary.  I'm still digging a bit more through the
> >>>   code to determine exactly why that call is truly needed - it should not be
> >>>   necessary as far as I can see.
> >>>
> >>
> >> We can fix that as well; it is reasonable to expect in systemwide probe context
> >> that a user qualify their symbol with the object (with the proviso that we
> >> support path expansion as we do for the probemod). This requires a few minor
> >> lexical changes to support filenames with "." in them, but it makes sense and
> >> avoids us having to make inferences from the probe context. So in other words
> >> to retrieve a global variable from libpython during systemwide probing we'd have
> > 
> > Yes, the module name needs to allow for . characters, per the module naming
> > rules in DTrace.
> > 
> >> python*:libpython3.6m.so::function-entry
> >> {
> >> 	this->cur = copyin((uintptr_t)&libpython3.6m.so``_PyThreadState_Current, sizeof(void *));
> >> 	..
> >> }
> >>
> >>> Resolution of a userspace symbol should essentially be a simple matter of:
> >>>
> >>> 	object-base-addr + symbol-offset
> >>>
> >>> where the object is a particular mapping within the address space of the
> >>> current user process.
> >>>
> >>> On Fri, Jun 05, 2026 at 11:12:15PM +0100, Alan Maguire via DTrace-devel wrote:
> >>>> Add uresolve(symbol[, fallback]) to resolve user-space symbols from D
> >>>> scripts.  uresolve() resolves a symbol to an object-relative offset at
> >>>> compile time, then computes the process-specific runtime address at probe
> >>>> fire time as:
> >>>>
> >>>>     current uprobe IP - probe offset + symbol offset
> >>>>
> >>>> For pid$target probes, use the target process and its /proc/<pid>/maps state
> >>>> to find the symbol and translate it to the same object-relative coordinate
> >>>> used by uprobes.  For system-wide uprobes, resolve the offset from the probed
> >>>> object file.  In both cases, address generation is shared and remains dynamic;
> >>>> the presence of a target process does not bake in an absolute address.
> >>>>
> >>>> Use bpf_get_func_ip() when available so system-wide uprobes use the actual
> >>>> probed instruction address rather than a saved pt_regs IP that may contain
> >>>> the resume address.  Retain the saved-IP path as a fallback.
> >>>>
> >>>> This allows scripts to locate process-local data such as
> >>>> _PyThreadState_Current across ASLR and across system-wide probes firing in
> >>>> different processes.  The optional fallback argument is returned when the
> >>>> symbol cannot be resolved; without it, resolution failure remains a
> >>>> compile-time error.
> >>>>
> >>>> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> >>>> Assisted-by: OpenAI Codex (GPT-5) <codex@openai.com>
> >>>> ---
> >>>>  include/dtrace/dif_defines.h |   3 +-
> >>>>  libdtrace/dt_bpf.c           |   1 +
> >>>>  libdtrace/dt_cg.c            | 456 +++++++++++++++++++++++++++++++++++
> >>>>  libdtrace/dt_open.c          |   2 +
> >>>>  libdtrace/dt_probe.h         |   1 +
> >>>>  libdtrace/dt_prov_uprobe.c   |  58 ++++-
> >>>>  6 files changed, 516 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
> >>>> index edb98f06..63b8c293 100644
> >>>> --- a/include/dtrace/dif_defines.h
> >>>> +++ b/include/dtrace/dif_defines.h
> >>>> @@ -213,8 +213,9 @@
> >>>>  #define DIF_SUBR_LINK_NTOP		45
> >>>>  #define DIF_SUBR_STACK			46
> >>>>  #define DIF_SUBR_USTACK			47
> >>>> +#define DIF_SUBR_URESOLVE		48
> >>>>  
> >>>> -#define DIF_SUBR_MAX			47
> >>>> +#define DIF_SUBR_MAX			48
> >>>>  
> >>>>  typedef uint32_t	dif_instr_t;
> >>>>  
> >>>> diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
> >>>> index 146a66e3..aecd71d9 100644
> >>>> --- a/libdtrace/dt_bpf.c
> >>>> +++ b/libdtrace/dt_bpf.c
> >>>> @@ -470,6 +470,7 @@ dt_bpf_init_helpers(dtrace_hdl_t *dtp)
> >>>>  	BPF_HELPER_MAP(probe_read_user_str, probe_read_str);
> >>>>  	BPF_HELPER_MAP(probe_read_kernel, probe_read);
> >>>>  	BPF_HELPER_MAP(probe_read_kernel_str, probe_read_str);
> >>>> +	BPF_HELPER_MAP(get_func_ip, unspec);
> >>>>  	BPF_HELPER_MAP(get_current_task_btf, unspec);
> >>>>  	BPF_HELPER_MAP(task_pt_regs, unspec);
> >>>>  #undef BPF_HELPER_MAP
> >>>> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> >>>> index 1bd73e11..16c58e35 100644
> >>>> --- a/libdtrace/dt_cg.c
> >>>> +++ b/libdtrace/dt_cg.c
> >>>> @@ -11,6 +11,9 @@
> >>>>  #include <setjmp.h>
> >>>>  #include <assert.h>
> >>>>  #include <errno.h>
> >>>> +#include <ctype.h>
> >>>> +#include <fcntl.h>
> >>>> +#include <unistd.h>
> >>>>  
> >>>>  #include <sys/socket.h>			/* needed for if_arp.h on OL7/x86 */
> >>>>  #include <linux/if_arp.h>		/* ARPHRD_ETHER ARPHRD_INFINIBAND */
> >>>> @@ -6988,6 +6991,458 @@ dt_cg_subr_link_ntop(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >>>>  	dt_regset_free(drp, type->dn_reg);
> >>>>  }
> >>>>  
> >>>> +static const char *
> >>>> +dt_cg_basename(const char *path)
> >>>> +{
> >>>> +	const char	*p;
> >>>> +
> >>>> +	p = strrchr(path, '/');
> >>>> +	return p != NULL ? p + 1 : path;
> >>>> +}
> >>>> +
> >>>> +static int
> >>>> +dt_cg_parse_objname(const char *mod, Lmid_t *lmidp, const char **objp)
> >>>> +{
> >>>> +	char	*end;
> >>>> +
> >>>> +	if (mod == NULL || mod[0] == '\0' || strisglob(mod))
> >>>> +		return -1;
> >>>> +
> >>>> +	if (strncmp(mod, "LM", 2) == 0 && isdigit((unsigned char)mod[2])) {
> >>>> +		*lmidp = strtoul(mod + 2, &end, 16);
> >>>> +		if (*end != '`' || end[1] == '\0' || strchr(end + 1, '`'))
> >>>> +			return -1;
> >>>> +
> >>>> +		*objp = end + 1;
> >>>> +		return 0;
> >>>> +	}
> >>>> +
> >>>> +	*lmidp = PR_LMID_EVERY;
> >>>> +	*objp = mod;
> >>>> +	return 0;
> >>>> +}
> >>>> +
> >>>> +static int
> >>>> +dt_cg_probe_objname(const dt_probe_t *prp, Lmid_t *lmidp, const char **objp)
> >>>> +{
> >>>> +	if (prp == NULL || prp->desc == NULL)
> >>>> +		return -1;
> >>>> +
> >>>> +	return dt_cg_parse_objname(prp->desc->mod, lmidp, objp);
> >>>> +}
> >>>> +
> >>>> +static int
> >>>> +dt_cg_obj_matches_path(const char *obj, const char *path)
> >>>> +{
> >>>> +	const char	*base;
> >>>> +	Lmid_t		lmid;
> >>>> +
> >>>> +	if (obj == NULL || path == NULL)
> >>>> +		return 0;
> >>>> +
> >>>> +	if (dt_cg_parse_objname(obj, &lmid, &obj) == -1)
> >>>> +		return 0;
> >>>> +
> >>>> +	base = dt_cg_basename(path);
> >>>> +	return strcmp(obj, path) == 0 || strcmp(obj, base) == 0;
> >>>> +}
> >>>> +
> >>>> +static int
> >>>> +dt_cg_elf_sym_to_offset(Elf *elf, const GElf_Sym *sym, uint64_t *offp)
> >>>> +{
> >>>> +	GElf_Ehdr	ehdr;
> >>>> +	size_t		i, phnum;
> >>>> +	uint64_t	base = 0;
> >>>> +
> >>>> +	if (sym->st_shndx == SHN_UNDEF ||
> >>>> +	    gelf_getehdr(elf, &ehdr) == NULL ||
> >>>> +	    elf_getphdrnum(elf, &phnum) != 0)
> >>>> +		return -1;
> >>>> +
> >>>> +	/*
> >>>> +	 * Match the object-relative coordinate used by uprobe offsets.  For
> >>>> +	 * ET_DYN, libproc computes file_dyn_base from the first PT_LOAD
> >>>> +	 * segment's page offset.  For ET_EXEC, the load bias is zero and the
> >>>> +	 * first segment's vaddr remains part of the object-relative offset.
> >>>> +	 */
> >>>> +	for (i = 0; i < phnum; i++) {
> >>>> +		GElf_Phdr	phdr;
> >>>> +
> >>>> +		if (gelf_getphdr(elf, i, &phdr) == NULL ||
> >>>> +		    phdr.p_type != PT_LOAD)
> >>>> +			continue;
> >>>> +
> >>>> +		if (ehdr.e_type == ET_EXEC)
> >>>> +			base = phdr.p_vaddr;
> >>>> +		else if (ehdr.e_type == ET_DYN && phdr.p_align != 0)
> >>>> +			base = phdr.p_vaddr & (phdr.p_align - 1);
> >>>> +
> >>>> +		break;
> >>>> +	}
> >>>> +
> >>>> +	if (i == phnum || sym->st_value < base)
> >>>> +		return -1;
> >>>> +
> >>>> +	*offp = sym->st_value - base;
> >>>> +	return 0;
> >>>> +}
> >>>> +
> >>>> +static int
> >>>> +dt_cg_elf_lookup_symtab(Elf *elf, int type, const char *name, GElf_Sym *symp)
> >>>> +{
> >>>> +	Elf_Scn		*scn = NULL;
> >>>> +
> >>>> +	while ((scn = elf_nextscn(elf, scn)) != NULL) {
> >>>> +		GElf_Shdr	shdr;
> >>>> +		Elf_Data	*data;
> >>>> +		size_t		i, nsyms;
> >>>> +
> >>>> +		if (gelf_getshdr(scn, &shdr) == NULL ||
> >>>> +		    shdr.sh_type != type ||
> >>>> +		    shdr.sh_entsize == 0)
> >>>> +			continue;
> >>>> +
> >>>> +		data = elf_getdata(scn, NULL);
> >>>> +		if (data == NULL)
> >>>> +			continue;
> >>>> +
> >>>> +		nsyms = shdr.sh_size / shdr.sh_entsize;
> >>>> +		for (i = 0; i < nsyms; i++) {
> >>>> +			GElf_Sym	sym;
> >>>> +			const char	*s;
> >>>> +			uchar_t		stype;
> >>>> +
> >>>> +			if (gelf_getsym(data, i, &sym) == NULL ||
> >>>> +			    sym.st_name == 0 ||
> >>>> +			    sym.st_shndx == SHN_UNDEF)
> >>>> +				continue;
> >>>> +
> >>>> +			stype = GELF_ST_TYPE(sym.st_info);
> >>>> +			if (stype == STT_FILE || stype == STT_SECTION)
> >>>> +				continue;
> >>>> +
> >>>> +			s = elf_strptr(elf, shdr.sh_link, sym.st_name);
> >>>> +			if (s != NULL && strcmp(s, name) == 0) {
> >>>> +				*symp = sym;
> >>>> +				return 0;
> >>>> +			}
> >>>> +		}
> >>>> +	}
> >>>> +
> >>>> +	return -1;
> >>>> +}
> >>>> +
> >>>> +static int
> >>>> +dt_cg_elf_lookup_offset(const char *path, const char *name, uint64_t *offp)
> >>>> +{
> >>>> +	GElf_Sym	sym;
> >>>> +	Elf		*elf = NULL;
> >>>> +	int		fd, rc = -1;
> >>>> +
> >>>> +	fd = open(path, O_RDONLY);
> >>>> +	if (fd < 0)
> >>>> +		return -1;
> >>>> +
> >>>> +	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
> >>>> +	if (elf == NULL || elf_kind(elf) != ELF_K_ELF)
> >>>> +		goto out;
> >>>> +
> >>>> +	if (dt_cg_elf_lookup_symtab(elf, SHT_SYMTAB, name, &sym) == -1 &&
> >>>> +	    dt_cg_elf_lookup_symtab(elf, SHT_DYNSYM, name, &sym) == -1)
> >>>> +		goto out;
> >>>> +
> >>>> +	rc = dt_cg_elf_sym_to_offset(elf, &sym, offp);
> >>>> +
> >>>> +out:
> >>>> +	if (elf != NULL)
> >>>> +		elf_end(elf);
> >>>> +	close(fd);
> >>>> +	return rc;
> >>>> +}
> >>>> +
> >>>> +typedef struct dt_cg_uresolve_arg {
> >>>> +	const char	*name;
> >>>> +	const char	*obj;
> >>>> +	int		explicit_obj;
> >>>> +	int		nmatches;
> >>>> +	int		no_path;
> >>>> +	int		no_symbol;
> >>>> +	int		bad_object;
> >>>> +	int		different_offset;
> >>>> +	uint64_t	off;
> >>>> +} dt_cg_uresolve_arg_t;
> >>>> +
> >>>> +static int
> >>>> +dt_cg_uresolve_probe(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg)
> >>>> +{
> >>>> +	dt_cg_uresolve_arg_t	*uap = arg;
> >>>> +	const char		*path;
> >>>> +	uint64_t		off;
> >>>> +
> >>>> +	path = dt_probe_uprobe_path(prp);
> >>>> +	if (path == NULL) {
> >>>> +		uap->no_path = 1;
> >>>> +		return 1;
> >>>> +	}
> >>>> +
> >>>> +	if (uap->explicit_obj && !dt_cg_obj_matches_path(uap->obj, path)) {
> >>>> +		uap->bad_object = 1;
> >>>> +		return 1;
> >>>> +	}
> >>>> +
> >>>> +	if (dt_cg_elf_lookup_offset(path, uap->name, &off) != 0) {
> >>>> +		uap->no_symbol = 1;
> >>>> +		return 1;
> >>>> +	}
> >>>> +
> >>>> +	if (uap->nmatches++ == 0) {
> >>>> +		uap->off = off;
> >>>> +		return 0;
> >>>> +	}
> >>>> +
> >>>> +	if (uap->off != off) {
> >>>> +		uap->different_offset = 1;
> >>>> +		return 1;
> >>>> +	}
> >>>> +
> >>>> +	return 0;
> >>>> +}
> >>>> +
> >>>> +static int
> >>>> +dt_cg_uresolve_from_probe_file(dt_node_t *dnp, dt_node_t *arg,
> >>>> +			       const char *name, const char *obj,
> >>>> +			       int explicit_obj, int allow_fallback,
> >>>> +			       uint64_t *offp)
> >>>> +{
> >>>> +	dt_cg_uresolve_arg_t	uarg = { 0 };
> >>>> +	dtrace_hdl_t		*dtp = yypcb->pcb_hdl;
> >>>> +
> >>>> +	uarg.name = name;
> >>>> +	uarg.obj = obj;
> >>>> +	uarg.explicit_obj = explicit_obj;
> >>>> +
> >>>> +	if (yypcb->pcb_pdesc != NULL)
> >>>> +		dt_probe_iter(dtp, yypcb->pcb_pdesc, dt_cg_uresolve_probe,
> >>>> +			      NULL, &uarg);
> >>>> +	else if (yypcb->pcb_probe != NULL)
> >>>> +		dt_cg_uresolve_probe(dtp, yypcb->pcb_probe, &uarg);
> >>>> +
> >>>> +	if (uarg.bad_object)
> >>>> +		dnerror(arg, D_PROC_NAME, "uresolve( ) object %s does not "
> >>>> +			"match the current uprobe object\n", obj);
> >>>> +	if (uarg.no_path)
> >>>> +		dnerror(dnp, D_PROC_NAME, "uresolve( ) requires a unique "
> >>>> +			"uprobe object path for this probe\n");
> >>>> +	if (uarg.no_symbol) {
> >>>> +		if (allow_fallback)
> >>>> +			return -1;
> >>>> +
> >>>> +		dnerror(arg, D_PROC_FUNC, "failed to resolve user symbol %s "
> >>>> +			"in the current uprobe object\n", arg->dn_string);
> >>>> +	}
> >>>> +
> >>>> +	if (uarg.nmatches == 0) {
> >>>> +		dnerror(dnp, D_PROC_NAME, "uresolve( ) cannot determine the "
> >>>> +			"current uprobe object\n");
> >>>> +	}
> >>>> +
> >>>> +	if (uarg.different_offset)
> >>>> +		dnerror(arg, D_PROC_FUNC, "uresolve( ) matched multiple "
> >>>> +			"uprobe objects with different offsets for symbol %s\n",
> >>>> +			arg->dn_string);
> >>>> +
> >>>> +	*offp = uarg.off;
> >>>> +	return 0;
> >>>> +}
> >>>> +
> >>>> +static int
> >>>> +dt_cg_uresolve_from_target(dt_node_t *dnp, dt_node_t *arg, pid_t pid,
> >>>> +			   Lmid_t lmid, const char *obj, const char *name,
> >>>> +			   int allow_fallback, uint64_t *offp)
> >>>> +{
> >>>> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> >>>> +	const prmap_t	*mapp, *first;
> >>>> +	GElf_Sym	sym;
> >>>> +	pid_t		gpid;
> >>>> +	int		err = 0;
> >>>> +
> >>>> +	gpid = dt_proc_grab_lock(dtp, pid,
> >>>> +	    DTRACE_PROC_WAITING | DTRACE_PROC_SHORTLIVED);
> >>>> +	if (gpid <= 0)
> >>>> +		dnerror(dnp, D_PROC_GRAB, "failed to grab target process %d "
> >>>> +			"for uresolve( )\n", pid);
> >>>> +
> >>>> +	if (dt_Pxlookup_by_name(dtp, gpid, lmid, obj, name,
> >>>> +	    &sym, NULL) != 0) {
> >>>> +		err = 1;
> >>>> +	} else if ((mapp = dt_Paddr_to_map(dtp, gpid, sym.st_value)) == NULL ||
> >>>> +	    mapp->pr_file == NULL ||
> >>>> +	    (first = mapp->pr_file->first_segment) == NULL ||
> >>>> +	    sym.st_value < first->pr_vaddr) {
> >>>> +		err = 1;
> >>>> +	} else {
> >>>> +		*offp = sym.st_value - first->pr_vaddr;
> >>>> +	}
> >>>> +
> >>>> +	dt_proc_release_unlock(dtp, gpid);
> >>>> +
> >>>> +	if (err == 0)
> >>>> +		return 0;
> >>>> +
> >>>> +	if (allow_fallback)
> >>>> +		return -1;
> >>>> +
> >>>> +	dnerror(arg, D_PROC_FUNC, "failed to resolve target user symbol %s\n",
> >>>> +		arg->dn_string);
> >>>> +}
> >>>> +
> >>>> +static void
> >>>> +dt_cg_uresolve_emit_offset_addr(dt_node_t *dnp, dt_irlist_t *dlp,
> >>>> +				dt_regset_t *drp, uint64_t symoff)
> >>>> +{
> >>>> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> >>>> +	int	treg;
> >>>> +
> >>>> +	/*
> >>>> +	 * Compute the current object base from the saved user PC and the
> >>>> +	 * uprobe offset, then add the compile-time-resolved symbol offset.
> >>>> +	 * When available, use the kernel's current uprobe IP directly because
> >>>> +	 * the saved register block may not reliably carry the breakpoint
> >>>> +	 * address for system-wide uprobes across different processes.
> >>>> +	 */
> >>>> +	if (dtp->dt_bpfhelper[BPF_FUNC_get_func_ip] != BPF_FUNC_unspec) {
> >>>> +		if (dt_regset_xalloc_args(drp) == -1)
> >>>> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >>>> +		if (dt_regset_xalloc(drp, BPF_REG_0) == -1)
> >>>> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >>>> +
> >>>> +		dt_cg_access_dctx(BPF_REG_1, dlp, drp, DCTX_CTX);
> >>>> +		emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ip]));
> >>>> +		dt_regset_free_args(drp);
> >>>> +
> >>>> +		if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
> >>>> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >>>> +
> >>>> +		emit(dlp, BPF_MOV_REG(dnp->dn_reg, BPF_REG_0));
> >>>> +		dt_regset_free(drp, BPF_REG_0);
> >>>> +	} else {
> >>>> +		if ((dnp->dn_reg = dt_regset_alloc(drp)) == -1)
> >>>> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >>>> +
> >>>> +		if ((treg = dt_regset_alloc(drp)) == -1)
> >>>> +			longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >>>> +
> >>>> +		dt_cg_access_dctx(treg, dlp, drp, DCTX_MST);
> >>>> +		emit(dlp, BPF_LOAD(BPF_DW, dnp->dn_reg, treg,
> >>>> +				   DMST_REGS + PT_REGS_IP));
> >>>> +		dt_regset_free(drp, treg);
> >>>> +	}
> >>>> +
> >>>> +	if ((treg = dt_regset_alloc(drp)) == -1)
> >>>> +		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >>>> +
> >>>> +	dt_cg_access_dctx(treg, dlp, drp, DCTX_MST);
> >>>> +	emit(dlp, BPF_LOAD(BPF_DW, treg, treg, DMST_PROFF));
> >>>> +	emit(dlp, BPF_ALU64_REG(BPF_SUB, dnp->dn_reg, treg));
> >>>> +	dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, treg, symoff);
> >>>> +	emit(dlp, BPF_ALU64_REG(BPF_ADD, dnp->dn_reg, treg));
> >>>> +
> >>>> +	dt_regset_free(drp, treg);
> >>>> +}
> >>>> +
> >>>> +static void
> >>>> +dt_cg_subr_uresolve(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >>>> +{
> >>>> +	dtrace_hdl_t	*dtp = yypcb->pcb_hdl;
> >>>> +	dt_node_t	*arg = dnp->dn_args;
> >>>> +	dt_node_t	*fallback;
> >>>> +	dt_ident_t	*tidp;
> >>>> +	pid_t		pid = 0;
> >>>> +	char		*spec, *tick;
> >>>> +	const char	*obj = NULL;
> >>>> +	const char	*name;
> >>>> +	Lmid_t		lmid = PR_LMID_EVERY;
> >>>> +	uint64_t	off = 0;
> >>>> +	int		err = 0, explicit_obj = 0;
> >>>> +	int		use_fallback = 0;
> >>>> +
> >>>> +	if (arg == NULL || (arg->dn_list != NULL &&
> >>>> +	    arg->dn_list->dn_list != NULL))
> >>>> +		dnerror(dnp, D_PROTO_LEN, "uresolve( ) prototype mismatch: "
> >>>> +			"expected 1 or 2 arguments\n");
> >>>> +
> >>>> +	if (arg->dn_kind != DT_NODE_STRING)
> >>>> +		dnerror(arg, D_PROTO_ARG, "uresolve( ) argument #1 must be "
> >>>> +			"a string constant\n");
> >>>> +
> >>>> +	fallback = arg->dn_list;
> >>>> +	tidp = dt_idhash_lookup(dtp->dt_macros, "target");
> >>>> +	if (tidp != NULL)
> >>>> +		pid = tidp->di_id;
> >>>> +
> >>>> +	spec = strdup(arg->dn_string);
> >>>> +	if (spec == NULL)
> >>>> +		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
> >>>> +
> >>>> +	tick = strrchr(spec, '`');
> >>>> +	if (tick != NULL) {
> >>>> +		*tick = '\0';
> >>>> +		obj = spec;
> >>>> +		name = tick + 1;
> >>>> +		explicit_obj = 1;
> >>>> +
> >>>> +		if (*obj == '\0' || *name == '\0')
> >>>> +			err = 1;
> >>>> +	} else {
> >>>> +		name = spec;
> >>>> +	}
> >>>> +
> >>>> +	if (err != 0) {
> >>>> +		free(spec);
> >>>> +		dnerror(arg, D_PROC_NAME, "uresolve( ) argument must be "
> >>>> +			"\"symbol\" or \"object`symbol\"\n");
> >>>> +	}
> >>>> +
> >>>> +	if (pid == 0) {
> >>>> +		if (dt_cg_uresolve_from_probe_file(dnp, arg, name, obj,
> >>>> +		    explicit_obj, fallback != NULL, &off) != 0)
> >>>> +			use_fallback = 1;
> >>>> +		goto done;
> >>>> +	}
> >>>> +
> >>>> +	if (explicit_obj) {
> >>>> +		if (dt_cg_parse_objname(obj, &lmid, &obj) != 0) {
> >>>> +			free(spec);
> >>>> +			dnerror(arg, D_PROC_NAME, "uresolve( ) object %s is "
> >>>> +				"not a valid user object name\n", arg->dn_string);
> >>>> +		}
> >>>> +	} else if (dt_cg_probe_objname(yypcb->pcb_probe, &lmid, &obj) != 0) {
> >>>> +		const char	*path = dt_probe_uprobe_path(yypcb->pcb_probe);
> >>>> +
> >>>> +		if (path != NULL) {
> >>>> +			obj = path;
> >>>> +			lmid = PR_LMID_EVERY;
> >>>> +		} else {
> >>>> +			free(spec);
> >>>> +			dnerror(arg, D_PROC_NAME, "unqualified uresolve( ) "
> >>>> +				"requires a concrete probe module\n");
> >>>> +		}
> >>>> +	}
> >>>> +
> >>>> +	if (dt_cg_uresolve_from_target(dnp, arg, pid, lmid, obj, name,
> >>>> +	    fallback != NULL, &off) != 0)
> >>>> +		use_fallback = 1;
> >>>> +
> >>>> +done:
> >>>> +	free(spec);
> >>>> +
> >>>> +	if (use_fallback) {
> >>>> +		dt_cg_node(fallback, dlp, drp);
> >>>> +		dnp->dn_reg = fallback->dn_reg;
> >>>> +	} else
> >>>> +		dt_cg_uresolve_emit_offset_addr(dnp, dlp, drp, off);
> >>>> +}
> >>>> +
> >>>>  typedef void dt_cg_subr_f(dt_node_t *, dt_irlist_t *, dt_regset_t *);
> >>>>  
> >>>>  static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
> >>>> @@ -7039,6 +7494,7 @@ static dt_cg_subr_f *_dt_cg_subr[DIF_SUBR_MAX + 1] = {
> >>>>  	[DIF_SUBR_LINK_NTOP]		= &dt_cg_subr_link_ntop,
> >>>>  	[DIF_SUBR_STACK]		= &dt_cg_subr_stack,
> >>>>  	[DIF_SUBR_USTACK]		= &dt_cg_subr_ustack,
> >>>> +	[DIF_SUBR_URESOLVE]		= &dt_cg_subr_uresolve,
> >>>>  };
> >>>>  
> >>>>  static void
> >>>> diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> >>>> index ca00788a..0505e2ff 100644
> >>>> --- a/libdtrace/dt_open.c
> >>>> +++ b/libdtrace/dt_open.c
> >>>> @@ -330,6 +330,8 @@ static const dt_ident_t _dtrace_globals[] = {
> >>>>  	DT_VERS_1_2, &dt_idops_func, "_usymaddr(uintptr_t)" },
> >>>>  { "uregs", DT_IDENT_ARRAY, 0, DIF_VAR_UREGS, DT_ATTR_STABCMN, DT_VERS_1_0,
> >>>>  	&dt_idops_regs, NULL },
> >>>> +{ "uresolve", DT_IDENT_FUNC, 0, DIF_SUBR_URESOLVE, DT_ATTR_STABCMN,
> >>>> +	DT_VERS_2_0, &dt_idops_func, "uintptr_t(string, [uintptr_t])" },
> >>>>  { "ustack", DT_IDENT_FUNC, DT_IDFLG_DPTR, DIF_SUBR_USTACK, DT_ATTR_STABCMN,
> >>>>  	DT_VERS_1_0, &dt_idops_func, "dt_stack_t([uint32_t], [uint32_t])" },
> >>>>  { "ustackdepth", DT_IDENT_SCALAR, 0, DIF_VAR_USTACKDEPTH,
> >>>> diff --git a/libdtrace/dt_probe.h b/libdtrace/dt_probe.h
> >>>> index 54053cd3..bff47055 100644
> >>>> --- a/libdtrace/dt_probe.h
> >>>> +++ b/libdtrace/dt_probe.h
> >>>> @@ -102,6 +102,7 @@ typedef int dt_dependent_f(dtrace_hdl_t *dtp, dt_probe_t *prp, void *arg);
> >>>>  extern int dt_probe_dependent_iter(dtrace_hdl_t *dtp, const dt_probe_t *prp,
> >>>>  				   dt_dependent_f *func, void *arg);
> >>>>  
> >>>> +extern const char *dt_probe_uprobe_path(const dt_probe_t *prp);
> >>>>  
> >>>>  extern void dt_probe_init(dtrace_hdl_t *dtp);
> >>>>  extern void dt_probe_detach_all(dtrace_hdl_t *dtp);
> >>>> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> >>>> index d53b1e43..9a481f59 100644
> >>>> --- a/libdtrace/dt_prov_uprobe.c
> >>>> +++ b/libdtrace/dt_prov_uprobe.c
> >>>> @@ -307,6 +307,47 @@ typedef struct uprobe_data {
> >>>>  	int	ref_shift;
> >>>>  } uprobe_data_t;
> >>>>  
> >>>> +dt_provimpl_t	dt_pid;
> >>>> +dt_provimpl_t	dt_usdt;
> >>>> +dt_provimpl_t	dt_stapsdt;
> >>>> +
> >>>> +const char *
> >>>> +dt_probe_uprobe_path(const dt_probe_t *prp)
> >>>> +{
> >>>> +	const dt_uprobe_t	*upp;
> >>>> +	const list_probe_t	*pup;
> >>>> +	const char		*path = NULL;
> >>>> +
> >>>> +	if (prp == NULL || prp->prov == NULL)
> >>>> +		return NULL;
> >>>> +
> >>>> +	if (prp->prov->impl == &dt_uprobe) {
> >>>> +		upp = prp->prv_data;
> >>>> +		return upp != NULL ? upp->fn : NULL;
> >>>> +	}
> >>>> +
> >>>> +	if (prp->prov->impl != &dt_pid &&
> >>>> +	    prp->prov->impl != &dt_usdt &&
> >>>> +	    prp->prov->impl != &dt_stapsdt)
> >>>> +		return NULL;
> >>>> +
> >>>> +	for (pup = prp->prv_data; pup != NULL; pup = dt_list_next(pup)) {
> >>>> +		if (pup->probe == NULL || pup->probe->prv_data == NULL)
> >>>> +			return NULL;
> >>>> +
> >>>> +		upp = pup->probe->prv_data;
> >>>> +		if (upp->fn == NULL)
> >>>> +			return NULL;
> >>>> +
> >>>> +		if (path == NULL)
> >>>> +			path = upp->fn;
> >>>> +		else if (strcmp(path, upp->fn) != 0)
> >>>> +			return NULL;
> >>>> +	}
> >>>> +
> >>>> +	return path;
> >>>> +}
> >>>> +
> >>>>  static const dtrace_pattr_t	pattr = {
> >>>>  { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
> >>>>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> >>>> @@ -315,10 +356,6 @@ static const dtrace_pattr_t	pattr = {
> >>>>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> >>>>  };
> >>>>  
> >>>> -dt_provimpl_t	dt_pid;
> >>>> -dt_provimpl_t	dt_usdt;
> >>>> -dt_provimpl_t	dt_stapsdt;
> >>>> -
> >>>>  #define UPROBE_CONFIG	"/sys/bus/event_source/devices/uprobe/"
> >>>>  #define PERF_TYPE_FILE	(UPROBE_CONFIG "type")
> >>>>  #define RET_FLAG_FILE	(UPROBE_CONFIG "format/retprobe")
> >>>> @@ -1392,6 +1429,19 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
> >>>>  	 */
> >>>>  	dt_cg_tramp_copy_regs(pcb);
> >>>>  
> >>>> +	/*
> >>>> +	 * On some architectures the saved user IP in the uprobe pt_regs is the
> >>>> +	 * resume address rather than the probed instruction address.  Normalize
> >>>> +	 * the saved IP to the actual uprobe address when the kernel can provide
> >>>> +	 * it so consumers such as uresolve() can derive the correct object base.
> >>>> +	 */
> >>>> +	if (dtp->dt_bpfhelper[BPF_FUNC_get_func_ip] != BPF_FUNC_unspec) {
> >>>> +		emit(dlp, BPF_MOV_REG(BPF_REG_1, BPF_REG_8));
> >>>> +		emit(dlp, BPF_CALL_HELPER(dtp->dt_bpfhelper[BPF_FUNC_get_func_ip]));
> >>>> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7,
> >>>> +				    DMST_REGS + PT_REGS_IP, BPF_REG_0));
> >>>> +	}
> >>>> +
> >>>>  	/*
> >>>>  	 * Record the uprobe instrumentation offset in the probe context.
> >>>>  	 * This is the same object-relative offset passed to perf_event_open()
> >>>> -- 
> >>>> 2.43.5
> >>>>
> >>>>
> >>>> _______________________________________________
> >>>> DTrace-devel mailing list
> >>>> DTrace-devel@oss.oracle.com
> >>>> https://oss.oracle.com/mailman/listinfo/dtrace-devel
