Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6471B1D88DC
	for <dtrace@lists.linux.dev>; Tue,  5 Nov 2024 20:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730840400; cv=fail; b=o9dOTiX0gSBGJIaNKeqX3+tHywfnu2OYBuQlo1VAl95AW68AsJ54JW5W7MgYe4n/RWvsN3V3F2P0C/4lI1Cu9RJAJjv0s4/N6NvsltiTR0CAP3aBFMHHPmBjt+O1d/LMDVGhzqfpUk67GhiIStKBkb08LjDaL6jen2BHctPtimA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730840400; c=relaxed/simple;
	bh=1W9vgrLUubUZg0kFeTNeSVeG0LGT75s2hUDI0VJuC0g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nZ3NViSti6TFQLN8AqdXpcnKjbqfzXmhu4jKTB3j+MDJGyIlHL2R7XLEO8eazC3dCgbg2woxvuH0NlLxFh7nBHtJa4ig7e9bAah5SdJiPdIWq8umR/P19/0t/PBvZVdNFx/XghOgBkPOVUmpurZuaTUxeiKBVkv2JLhmduhmgbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SG/uzG/2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mDxxDDvb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SG/uzG/2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mDxxDDvb"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5KfYkb019801
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 20:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=uJ+gLFVWL6avx3tR12It5HlHTePZDUgRhYIC/u1PgX4=; b=
	SG/uzG/2CIIOeivL/c8EDqtzU5rWEI1JYbHWEfQfUNp7vqfF+3YEHONqeDZ1CyvS
	YzV8cocYs/zn6Tfk8oGlaYqXnBbozo+ouU7jN1T/6QwhP5jg3UN5uG37qs5ELgu3
	UsZVLZpUH8sqdwgCWoVV5Ze2RkkjBoHnjV/bADdSlv8d1bNsTh0rm7KVEOybWdoz
	FpBufMXuXB1LQmWKmD9LbV7Uculp6ky7c+LEDfjltMBz9WTkZg+eQrmVfLcyHQrA
	MMB2KNPV5oHbByUEaq0q/rB1RcIsPjTYn9BAgsZ1WfhQTKeQIbpI5jgojXIbsm5c
	8MLzT8wBTg2xycQ1MsPftg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42nav26feq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 20:59:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5KES2j004991
	for <dtrace@lists.linux.dev>; Tue, 5 Nov 2024 20:59:56 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42p87b33xh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 05 Nov 2024 20:59:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GL3WcFIGpy1sZx413YivNAnaN84LJ4XsTzI6s2RV5uzINod5h91RtlR6J2IL8X144ukBUbyesDHZoYfnVqhnmkYOdQGfUHhxOmcTAJtKOeIiyAYNfk0heWwMY4wXUmwxZ7rOiUzX9Y/DPsMKcL9J2hSjyJSOmDdNR85WskyORtsF2wbYLlL5nZU8QDnmrQ7h5C+bo0zS/bmB6d1+7HpmsGxldnfTYYHRto3aSssv+9nSrjwprh0Xih26dfBwKZmzhGV5HjvvFBKOUM0uV9Z0C4q49uxGzOWPv+V5RlDF4eN0oHQCYzzPvue1a+FsMssj1BTXROtDhByxBOYurH74cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJ+gLFVWL6avx3tR12It5HlHTePZDUgRhYIC/u1PgX4=;
 b=k8Uq4apMCbKX8IXo8MzyKX2RXhWyFrs5VQYj0MU+up5zt8vr38cO/p+FRDyLqcU/4JlSlMyT5MbZLhq0VSoC3R7XBHCM1NHKiE078PaNdkrKBYzRnjlva7zAyzeS3ChdASP2qu4icqDwlTU0CXlZbYl+OhdezlR9HreqgZZz6/BubDbXzdBsRHvuTgs+hzHPlKZCZIEgGDx7SZhxMLPw2h68tocCnhjJcA0P4jlEdvs2fuxHk1+YmrYnIT9Jmxkl2zN7TCb3R1uOWZFi83Ev4Ezu+eZwBlYwkQeXF7PZ5XebV2FAmAmhnEQRNQAt6bR7FhPsxf42ndNc4wPZTphUcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJ+gLFVWL6avx3tR12It5HlHTePZDUgRhYIC/u1PgX4=;
 b=mDxxDDvbWYl99BkPC+OqamZobJv0pe49P3USyJfBWGCLYHDBI5XBGL+NOAyKkFJv9o1q2n4IFXq/SP5+kN3lMC91RlUJddxpoBtw7TNfimjNrjffb6ZfQ085su+UCdT2k2kDf5quVyhxJnUp86BQnmV/vx19AXrhZk5ZeMwANhA=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by SA1PR10MB6295.namprd10.prod.outlook.com (2603:10b6:806:252::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 20:59:53 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%5]) with mapi id 15.20.8114.015; Tue, 5 Nov 2024
 20:59:53 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v6 3/6] cg: add argument mapping in the trampoline
Date: Tue,  5 Nov 2024 20:59:39 +0000
Message-ID: <20241105205942.192409-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241105205942.192409-1-nick.alcock@oracle.com>
References: <20241105205942.192409-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0140.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::19) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|SA1PR10MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: c1897913-d9bc-4bc2-fefd-08dcfddccba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Puc6UP/bct9AuW2P/fkA6/xkRR3SyynosBIM7YB3HUPom7lNnJkIGU2Q/3kr?=
 =?us-ascii?Q?6tjfyY8KT5d8osTWLbZcwnU4E9wyAK+JgoPDCc+s4+0OxY513YZTNpBUkrJk?=
 =?us-ascii?Q?wjgP0ayOzCVZLIERrHhGms6vnM6wq3iQW9/ZWu34+StDrlmWaaPdOVGUDoQy?=
 =?us-ascii?Q?GTGRUHWSUzayD9d2WtTaGO/NZwI96g6fXS1YNK1dfjL1n3epcbgKrciTr8P4?=
 =?us-ascii?Q?KXu7wT2MH4wksDLX2UV22215A86hsPRZ+EH445ojCeMdtZvSZR4ERkQGKQQB?=
 =?us-ascii?Q?CUOYL+6092/lzTMnt6oogjLQSCBpHBMB6JPtPOsJw1cP4q7D9RAy8rnDxVtp?=
 =?us-ascii?Q?+64QqKZ9TDeGJaxd1sOCp5WL10DAdfogMZ5r6p5upzCG4XWPfRYoZAAbGc5h?=
 =?us-ascii?Q?5aXnmLZ6lWdNFZFOk5Fvbgpf3oqFFAwqJ6cpdPF3zH48QxCnVMEHNVLw4SSk?=
 =?us-ascii?Q?5sbFckrllWPIVOb8xBwzvk+Qbb1Os4gg1QhDF5gqlEC84+c1j/6hKQMZde5i?=
 =?us-ascii?Q?OxTBm7PWAvnxryVT1PnE9t/ES3dlZ4k7mGa7WxeRB0plc5ozy8boqUN9UTud?=
 =?us-ascii?Q?mZ2GH0P2jH1fX7iu5l1hVlkJpaKEJN0zLlp3ARCQH5mvaW6Nj44EhknJ93B3?=
 =?us-ascii?Q?q5BsU5bQPVdkoIDrEwR28sLCgnama940HduZWPWL1oaq6nqCDz7LYelHYU3C?=
 =?us-ascii?Q?0tS8rvLj7eFRgCNLXzwcjZpIBjLLV8G1/z3QWS3g9nAXKFgbt/WhhYsxbhhx?=
 =?us-ascii?Q?z/nBMmg5w1f7WekMQDx1NUnGXUJztUE+pJ3yWEJm5CjeWnNB+lMa4fzC/zFv?=
 =?us-ascii?Q?gRg/AMQBFbs/IoryFTKttg/SW7XTzapbjc/wKkJujwRa7WLP6VGtvXNb/h2m?=
 =?us-ascii?Q?YjyuhMNbHJYQeGMUfmqs2nc0pUiYxR/doQuLngbcAqC0Pu19HuJEO2m9+SRT?=
 =?us-ascii?Q?bpRWeyTo+DLTZyprTRRvnMkYdrAFk1xYvvzSbINea3+MajlED4H6X8s3VTDX?=
 =?us-ascii?Q?CXW4JDwbRcVqV0dI/0GrK63B/udOmFRYGlHzQOHHfcqAUvJoE3cV9SPp3LxT?=
 =?us-ascii?Q?5oEz9S1rvwU/DBiWG5BuyJyugHncaD73tPAi/Jqjj25tuxzhJHgzpns9ANDS?=
 =?us-ascii?Q?mgr/0XS4ff7tTfODVSdNR+OZc7BLT3tpnilnmW4oSUG7tCNVZWz9/Ez02pjQ?=
 =?us-ascii?Q?Uoq40UP5kk7lIKOF4r/I2FpqUz6vBbOmenVy+bGNTXoiWjVWwdeGabWmgkM/?=
 =?us-ascii?Q?vxHZXfw3ADtV89tqPWMmfh21cK7z9Uj/f4t+8NWsUNU3BYT1/0uWJWKTECXO?=
 =?us-ascii?Q?U5B23fe6Rur9Xl8ChIPKkaio?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?b1kQBHK5E9gIXvn/EEiOjO/NYzk8Z6VVso4kxp6Jbj2ZIK0oFObJk9b00AnV?=
 =?us-ascii?Q?wpM82zgECn1GpVuC8VsIGkEqONFtGMqp8oDpCTwXWV7E5TCL+z9zhYaQPJ+o?=
 =?us-ascii?Q?5aP8YK2rQNbmQNiCdDehLVaYWqVH/fXta4QjCv5OvSao0Ju+b4fgeBgjZhEi?=
 =?us-ascii?Q?+3dFe9N2DtBHhX1HJVF7Z/lltCwbSY6RhrmcvVqelNmyHS9OB84O796tCgIL?=
 =?us-ascii?Q?KJrbqJvxJH8aOrzguG5MyV+Hzzsh91FxlpzMKcjdcbcU/IKo8HbexV4XI7Qk?=
 =?us-ascii?Q?dhl8qdfsrH8CVK58tBDgRRbeuIoOSMMSRThW4Y6gzyqtNFJUyPOEAUjx5Zqb?=
 =?us-ascii?Q?0UaY+KVVvDnJr+ZcwBH3R3lmgssgTVd5nCXxUWsjhGE+5wGvBlmx1xT/Bl3A?=
 =?us-ascii?Q?JuqAyVBNv4nAoktdsGz10AigXnv/82b9WFvP9qiUGLvfmXsyoPRtLNuVSmj1?=
 =?us-ascii?Q?z0248h0AqeTofdlsZony/fdrCM1fjk1QBg2fMx/oHlXfamTPozHEqIz6kigy?=
 =?us-ascii?Q?WZeZwL8qdaVfK6nZJ5msZk1h2dKhN3Kq3AwJ/MGVQQh40W62XyqaPahcxUpw?=
 =?us-ascii?Q?cE7iola3XmadZHLWgSCMaOSbkVN2oTN4aU4cogEXIqQui/k4kLG/FXsCqaBd?=
 =?us-ascii?Q?XyVsT+qGacRV3Jh6dKbao/+7E3SpRO8GpAAA7owcq2hk5vxzmPBLNaTgzX5l?=
 =?us-ascii?Q?GesfSb7iqOgp3HYF6lGeFk+u+pYx3kxv2t8N7mAPcn71m3Uqi6nP07KpiSUM?=
 =?us-ascii?Q?Vh17ovj9WepWm9Hu8Y0ofYm08ZU096dObeurBOQ1u7AgHTXb8TgYhq9TmA2X?=
 =?us-ascii?Q?7ZoynqqXCni036ZDeq22gd+ob6dB4jcoWqm1vQnWsfTAYOdtw6ARxn5cr19/?=
 =?us-ascii?Q?3JryLgcuy7Enwswh1a8ptp3ep51dUQb1Jehbs3qBCyc/I5JFSig1huExr2zt?=
 =?us-ascii?Q?OAg72mzrRXbnGSVewgoEuU11N81tI7CtfIX654QAY8oLb6meM0j9yM2SkdvL?=
 =?us-ascii?Q?UPdMiYBCxLP0pJsB2Q4VGQC7Wk1b+OOar3k2OjiGiBWPPLAakPyhJoOIFM3F?=
 =?us-ascii?Q?lusAeiKDxzb+ZNgtN6S6aHmHP4nG7QOG/C81R8g8BYWqyPNPdMne51FCUnar?=
 =?us-ascii?Q?dDkwBJGdTB1uwmRTGUXZFNamWyQf6Q0csNwkF1c/7ejgIX2K7ZT5IV6o6Xed?=
 =?us-ascii?Q?h6JgvybKk6SuT4ScbyKKNb59S8q0/xd0djN2oD4MWtWSsrXRFQRb5F4NHWi+?=
 =?us-ascii?Q?pz9n40g4QG1Lbzk+U3c/7o26Mh3QRXwAQvBfG6Ag79Rcx1Hl4jnDv/uTjtMB?=
 =?us-ascii?Q?gGfULRoyV3M7jrf5DWTXEEOjWmEifx8fUg11+O2EGtJAvcaZz9n8iQFA8DOz?=
 =?us-ascii?Q?w/5rfIGChzPeWDZUJejqCHfVKkH6qSl2eWaFYv8OfuQ/xH9YmrH3a3GO7nn8?=
 =?us-ascii?Q?a3uVlFFn26zJP0+XibhTSgHY96CQq1fGcVFqED+si9seQqYIgwKvLrMLXuoZ?=
 =?us-ascii?Q?D0wg3kuatnBnPqJS2l1TfNbiDI01OmxtWmt+a7vuTmcv/6rZeiBuz4OQTKKJ?=
 =?us-ascii?Q?fMK/c/6EyJfYYhaYBieo2GvQcMKcqOxNYJ4hPkjV6fwPpfsVnQtn/pFJONcl?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F0VoCEKeZDUg4tjXdMTqyiho0mJzA5BTwFclMWfVRrMtfpodOH9tlkZu/Pz/5hrFucGFXCoRyJQUz1yvUJDGQ+AN0MffF6MLu4t4iLpsU5Qronu5OK4Crv5NGM5AK2ZbP+SdCP6rg2Vjb0duIXvp3jAXGALoYHZak8kRVS906aoeG1mD9rmYBzTJqhyK/h/z1pNjB6wnRyWZNRMLO3N8b8ZqVKnJcjgKHHD6jfJGwXrYj4LTKdAJjzq0Vckw2pZf4iv0P1WjUfttWdknX4VeGA8WV6TQiKYtJAGXU9VbZgHljAQUxpFDG7ZiPtQGStclqmAwHOUNiQMXeTu5pGV+CWsazLcMXnGh+cxJSvB5m7YA7wVN6JgY2bAcTwBq52AMX9ZG90zmV4oNuewGDDmJGyUBOdbobdnCxpZEXzM5UxmLypQgXOhZ97QY4AYSy3ZQFS94al4wW/dD1l+mUrcKWZL10U9OpXKkvQOzEl6EAymleA1F/YygYcrRdjfgjin0f2wQYUb5s4XVcPhb2FD1bZhZIUmliA8J5H2ov/TH2hgG7Z67INGT7oOGz7JM2yCq7e4QybqASLIH37+LGLIFa+j2sBZC01ok7vmUjqf70Rg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1897913-d9bc-4bc2-fefd-08dcfddccba9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 20:59:53.2508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JSV2p3uvhkxD+pE5M2QkzhXQpsq+lnCjVcu9n7e0AUl05CzzPFQyZgyOGL6pb6nXOxw0UYJVyIYkRWsdVJrg2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6295
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-05_06,2024-11-05_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411050162
X-Proofpoint-GUID: b1NSHu17P_xHG-qNE04jr1dY1Km0slsr
X-Proofpoint-ORIG-GUID: b1NSHu17P_xHG-qNE04jr1dY1Km0slsr

Before now, argument mapping was restricted to the args[] array, and was
implemented in dt_cg_array_op in the same place where we decide whether
to automatically copyin() userspace strings.

But existing DTrace testcases suggest that arg mapping is also applied to
argN for USDT, even though this is inconsistent with SDT and arguably less
flexible than having argN be the unmapped arguments in all cases.  Add a new
function dt_cg_tramp_map_args(), which can be called from trampolines to
apply mappings (destructively, but it keeps a copy of the old args in the
save area so you can unapply them if you need to).  No existing providers do
any mapping, so this is not yet called, but it's about to be.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 libdtrace/dt_cg.c | 25 +++++++++++++++++++++++++
 libdtrace/dt_cg.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 39c27ab0ec0b..aa230dcbae36 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -831,6 +831,29 @@ dt_cg_tramp_restore_args(dt_pcb_t *pcb)
 	}
 }
 
+/*
+ * Populate the probe arguments based on the provided dt_argdesc_t array.  The
+ * caller must save the arguments because argument mapping copies values from
+ * the saved arguments to the current arguments.  After this function returns,
+ * the caller should adjust the mapping to reflect that shuffling has been done.
+ *
+ * The caller must ensure that %r7 contains the value set by the
+ * dt_cg_tramp_prologue*() functions.
+ */
+void
+dt_cg_tramp_map_args(dt_pcb_t *pcb, dt_argdesc_t *args, size_t nargs)
+{
+	dt_irlist_t	*dlp = &pcb->pcb_ir;
+	int		i;
+
+	for (i = 0; i < nargs; i++) {
+		if (args[i].mapping != i) {
+			emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ORIG_ARG(args[i].mapping)));
+			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(i), BPF_REG_0));
+		}
+	}
+}
+
 typedef struct {
 	dt_irlist_t	*dlp;
 	dt_activity_t	act;
@@ -5061,6 +5084,8 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
 	 * unless the argument reference is provided by a dynamic translator.
 	 * If we're using a dynamic translator for args[], then just set dn_reg
 	 * to an invalid reg and return: DIF_OP_XLARG will fetch the arg later.
+	 *
+	 * If this is a userland variable, note that we need to copy it in.
 	 */
 	if (idp->di_id == DIF_VAR_ARGS) {
 		if ((idp->di_kind == DT_IDENT_XLPTR ||
diff --git a/libdtrace/dt_cg.h b/libdtrace/dt_cg.h
index 0a7c7ba6a8c5..fb26c125adbc 100644
--- a/libdtrace/dt_cg.h
+++ b/libdtrace/dt_cg.h
@@ -34,6 +34,7 @@ extern void dt_cg_tramp_get_var(dt_pcb_t *pcb, const char *name, int isstore,
 extern void dt_cg_tramp_del_var(dt_pcb_t *pcb, const char *name);
 extern void dt_cg_tramp_save_args(dt_pcb_t *pcb);
 extern void dt_cg_tramp_restore_args(dt_pcb_t *pcb);
+extern void dt_cg_tramp_map_args(dt_pcb_t *pcb, dt_argdesc_t *args, size_t nargs);
 extern void dt_cg_tramp_call_clauses(dt_pcb_t *pcb, const dt_probe_t *prp,
 				     dt_activity_t act);
 extern void dt_cg_tramp_return(dt_pcb_t *pcb);
-- 
2.46.0.278.g36e3a12567

