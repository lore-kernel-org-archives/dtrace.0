Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCB6481B1
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909190; cv=fail; b=b+etXZHs4SvYElo9RDeWaiaUQ2tKDgNMs00t2Kdnh7TRoIVDPHsSnC2IL9+5OonAx7PSEXGUWE7AtZl0rAEmQum780Li6uAzuzs37K0eP2wdSEB5al5oisaLVRudssC7HIm05pGaymsDOKvRcuyeVb2u0FFx0KDzAhSpIQ6Qrio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909190; c=relaxed/simple;
	bh=q5HsKXkCZz1cKx4PCRd1qqyQSFj1o4xQV673nvSVMlQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fPFa9+gjHjZGa24Xz8mUzwLIj6tzuPhCtHdIdjXN7rw7KEDBkFhzoN7y7z9i3JGh1tTLTm0r6DNqWiIrjJ/ymy53lcylBlMyu937+OIzFtl2BS06uleoOrVYIrwLxHm+/sL/SWCv3oQct2vAf90n+23zy5IhPfbRNyKgdyKe0NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mRLwlvy7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nOUfWsAU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mRLwlvy7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nOUfWsAU"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fV3H013622
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=47uOBCDM+i3g3w
	XvLuuVudTCJbdruFUkmTe6QEcU/kA=; b=mRLwlvy7kLzfXKv+eoHsJBLYX4hI0+
	aZNUhLmiG0wV6zUVs11kj86m2tAJlmv97uDpFWPY4QeHE5xb3xqKal2Rx15RNvMb
	+5yLxs7d+T2Z5TExWlVwBpzCI+45S25YEeHbdd61WsBbAP06ZVQRVM1tMe69bVDU
	uDo+H91jU6oDyg7rcrYBYhPUX78saIQYoRWfx5baSE+2gGOJnnJdCbbex4YWFSgI
	t/A5OBM0+IT0Lt1Qbs7STUrHFFkFTrcqcGRnZn4pFCxaT4rRhf1qKSaTG9I2okpw
	V3M+UlU7zQSSSpMv/4AirVNh3tOP0s9d22PbRyFn0PC3vWf+/UAHA/6g==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pus39m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:26 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T4Bsju034954
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4189svfp66-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YaqTGys0STRsL1LecO4pns4iLA1XqS26FXOTL/oNfleFsVlTbnfyYZXhWvDpE4J5cFvDGryjT+ZWf1kmNtckGHwO04EktLbd0AWX1KGDrtI1x9aHJJ1DduNaFKILpI8WTvdAO3rYJIp8CwSbT+TjKPcPYeUFpoEUx/K1LHVJvL1AdettiL5je7HnZT9B8NIkBbv3V9WN9MS7vbO27HQHCv/aFSW43E9dwwcgCI5f81f69UvMbtHTdb9F4BxRY9Igk0A/8e8OVvEdvFSkMWdnXm0sj25eKLjzDge2YNy/wh/sXoReY7rs5s176dEOo/LopnCbw5dwV8Ohfdpu3cN+Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47uOBCDM+i3g3wXvLuuVudTCJbdruFUkmTe6QEcU/kA=;
 b=v1Qr9ST/P4XE6Nvyv2ExXIGcv03n0nri37SWvMTJo/BVFXUjGoN/q+D0iJ3JD6YvD+P+jOOKVLkK+ss0CE67Z8/888x/CYv+pESguhHu1Y7tyv0zidlA6Gby4I7MkwpvZBDyt6Hx3wBh9faU2olsI+407L77KwjGP4OppRp4YS7Jn17xNGY9ThB99j9mGvVSskjHpkOO7FoJnura+D93nu/hZr6PCS9Dg3TDbPl9tfwf6ClYowg/5gcdnXZaLhq4d3Ms8+sm1rW51pI43ie1I4HsLzG/7N1YMf3yVxmxwRtUCfZTSLkTLO9Uw7tfySH4rU1TGPp72G+4792nUxlR9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47uOBCDM+i3g3wXvLuuVudTCJbdruFUkmTe6QEcU/kA=;
 b=nOUfWsAU9n1mYPAeChXqRfCKwYlMhdHmJ13HqgYFclKubyNjMoCwXy4EgQAk1T6VAWriBDyGAwMEMJrQ5e/CbGmixP02VraEH2+mQjNGdZpf7BMxhjomgTKxDzsLzQ/vmCtx7Fms4sy9E6jUJpLleirS82qtsCY4X8+YbmFTNrw=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CO1PR10MB4577.namprd10.prod.outlook.com (2603:10b6:303:97::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 05:26:21 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:21 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 08/19] Support multiple overlying probes in the uprobe trampoline
Date: Thu, 29 Aug 2024 01:25:47 -0400
Message-Id: <20240829052558.3525-8-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::12) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CO1PR10MB4577:EE_
X-MS-Office365-Filtering-Correlation-Id: f08b2fe1-76b1-4d57-b0ad-08dcc7eb1e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+fJLqhQC6oC0PA/ziGGzKzAsJC626Xr50FMknUZl0w8eOBdL+JUr3YAZF1nn?=
 =?us-ascii?Q?lgX53MJ0xfDqZrl4jW/5oV7AGsd02m5DZhZh7nxSAbCdu57NHSQPhg/N8rD7?=
 =?us-ascii?Q?P4kONba+dR+RVB4+nFX/JA15RfSRINZGopprFASuum61aWiivPGzi3CVPV72?=
 =?us-ascii?Q?VLjDf/v3LFmQtBGvLR1rK+itFo4LBLRDAz5vKvcFYIit8psKh2uoTFEnuXA3?=
 =?us-ascii?Q?dO7eXezaTAo+SgTnuQcScQJAdJ3r6UmDNOPDvPOm019A6c8RMnqyyOD59lCa?=
 =?us-ascii?Q?FkYH/vL7GiIIC50XtnPxLrz3hUd40a1ckMxR8A8WLaH/XXiUogbqTQ9Fe7m2?=
 =?us-ascii?Q?n7MoD1sceaD46yVw0J1wX/BojbvFGlPXubjuP1hN3AY4tqp+i2xD6P4XuXy8?=
 =?us-ascii?Q?h1yv8oVG6w0IctlQIF+YazO5SJX9CPFb2EhVFe1QzIkQKpvgkhd8JFOruorw?=
 =?us-ascii?Q?x3KEBy+vH4uye2jw/fpp/VioA/dRKv9aeTtNcYfpF90lHE29eprrekStwld/?=
 =?us-ascii?Q?wHh5k0XVaEsTMoClavT/POJoF1KDzpix3qBTuHiE/AWaj3XCxOF05mgpeScP?=
 =?us-ascii?Q?tCSCDj0bMvNN1bbSghesxlXrMs2vaPzXBYeKuoXw9jbxAVyjCCLK0QZxj/wm?=
 =?us-ascii?Q?AHXwukeBTaOvnxidkl6bPH4aZLJXq5WBaM/022sYXTYQ5rTEg9UFqrM3Rrgk?=
 =?us-ascii?Q?mjPok8Hn+rFPHrCMKLTXde+M+CX6PWw7PL2Q6bEHj3oUpbmIbDpUwCIS+DHi?=
 =?us-ascii?Q?CEaiQeMS9xK5zF0uBI7jAsDD9h30qWsiZnJtl6JlrS0Vs+ZuXMK7ejOPU9Dt?=
 =?us-ascii?Q?oia/8Qros+utOzU9o8wk9bBmeBnXiIkWUTmqjN1BEebUts8B3whWtfdNTL3Y?=
 =?us-ascii?Q?k4fzLGhTDulRkpOCh0OpIyWqJNDtCvGXI3slJYVFB2w6AKmWrFMs+jtqDOTz?=
 =?us-ascii?Q?ywkc8NfBdyo2al976Oi8z1lArqZrgmxeeCFS3xrdhUCl0hF3FjzxKW+75AgM?=
 =?us-ascii?Q?69Lb7GEztBAzwkXfG5JF5pxwEZVyTqo+i4JZcGFscF94/mLG/N9ozA6B8HLy?=
 =?us-ascii?Q?ZMRrANHi37bXLAzIRbITxwi1o1yve2XRX4QOPkxfz7m1Kggl51oUYn7DsqvC?=
 =?us-ascii?Q?MHp+ywuVs40yp6lH3AaX5uBQ6d50oiZH+ZC9q+dJKWsu2qV9KcpJS4MxMIhw?=
 =?us-ascii?Q?EsZXGEGKv7yimK1AgvrWQOiXZJesdtDFYupeCMkCQsbFRZ0lSqvIBrZJDhDP?=
 =?us-ascii?Q?0OfmobjAHTbwacOjd60LcWN5g+lMpCXDBC7SsR7ccyb0hi6sPZO1d1HYPaG4?=
 =?us-ascii?Q?WOI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KKrSgsw1EFK8v28iaJ92RXlnmNbHzMHhbQTCjlv37zMhF7Oz0nnSauJNOALg?=
 =?us-ascii?Q?6l9CxmHaOBRxieTmrLClFrI9tzlIJYO3pr+fOLNqvxxL3YyQXnOdfXJR/LQd?=
 =?us-ascii?Q?vWqgHj+sTHroCEcvTwgKaQDFOanwAWJx5XjR5gQhlceK0PyjS8Ou+QrwPcxY?=
 =?us-ascii?Q?LrQOpuO/oQEQEyQl9t9HEQAmGb+j7Y7O1akn/MYlEf1pk/jksCa6AHJvaoD+?=
 =?us-ascii?Q?nXT/x9VuG/dmB6gqYHOkNkpSvmHsKFGVGbLUbcBBHa/dEuH3nPP3+5zyE4Zv?=
 =?us-ascii?Q?AUq5shHGq1UDLFBAH25KxnDZ9aKOYFbtIXJldZcys6YKurpiQOA1J9gospzi?=
 =?us-ascii?Q?R1qCv6xICKPji6MmwEH2ieFQIB3T8Rlv5Y0WUYu3SyMWOvPygJ567JpaRSir?=
 =?us-ascii?Q?obc4MKG7llivUvqTyOLpaXxgJRIAGQzZHY1KFgq3U5kuov/qa1njhqpQry/S?=
 =?us-ascii?Q?bL+n1OvCHOlKZEaef2bisbrI1KVV5oL6shDSk+Nxngj8ve6epcvihlo5XJr0?=
 =?us-ascii?Q?RgVSczyajap+Lj2SVWYTp9H1/TdEjI+uKLzOqiek2+0VOJCq5APOV9KCQNzR?=
 =?us-ascii?Q?CpLYbkWMCFLin7pfe49VK/PqZED2X+/CNA9FYe9MPo1GonVgA5oeHKSVg2UB?=
 =?us-ascii?Q?sNJnUMhvsk6dH6/vUx88dCvbom1bOWwOva3IRx1BTUVvRNAeD58uHptqDfCg?=
 =?us-ascii?Q?ZNq8dCr87AKuK+ZdRm3e7rFozyyfrjCmdz0UAFLGadb9FKlE2f7r7M8gl/C5?=
 =?us-ascii?Q?28kWUhpcot11Kk6pWxyF/jIYKnP937DjPj7NufFSow8JMX0cfnqSSJXFiLa+?=
 =?us-ascii?Q?6h4OZFC2wjQVgqPM9r4MLCsakvdYrPfttK/Gkv5QaPGRPX42ZjMRnC40Mxn7?=
 =?us-ascii?Q?wZedP9fP/C5514sL3qd90ULg9zbSoXX/MrI4xgzQS9yTgvxvAuC6r5q/tMBb?=
 =?us-ascii?Q?Wqg39O+LBADnq92eSIJcq9FFGFkSQo4wbdlRSipyNF8ZEvUy2+4CfqHZi55F?=
 =?us-ascii?Q?Na6MAaxalhV8ySZ7cYYXny7NPNmTitbIrQd8f9pjjQCu6MBZHH6tfn8at4np?=
 =?us-ascii?Q?mOmJdjWSeIDPvjiANzXqycnOsCJ2LHaXB/RBluFSMLyQgngp0BcfT0htA3b8?=
 =?us-ascii?Q?FuetG97qMb0DNPmd88KT3oeizv+qhF7UHlFVW+3EBWmLKmPGgVdJtaY0Juxq?=
 =?us-ascii?Q?9jIEuN6Ln6VeapnPNTANwPZFPflXOZBNq6DHpI9ruO3yjQ3T/C0Q4wzyChZr?=
 =?us-ascii?Q?H2/xP8FJ517BaJCT1Nmg1gY+pgl+F1+E6Sr61v5iGDRXk7V5SOa+6TnOEEh9?=
 =?us-ascii?Q?x+0OB8YYWolXEl5hacJI2kEaS3FNG0Zf8ic0ANNcNakFAkDEU6swPoJolnDc?=
 =?us-ascii?Q?vrrMmOzAf9s27s+29WT9ApCX2e9j4iwgwhWW5hxEh9eTJO+blUKVtep7kyO1?=
 =?us-ascii?Q?YaPTeogviKjdgHGeW7/1ESFEMqCobzX5jVSmTYnJS+HSzgnG0BxfJHkIadBU?=
 =?us-ascii?Q?Yf3uf+U8N3x2roqbytL8+cdH5JISu/1bX/fZG4Ju74Lm1/aLYX2ayFQwnji5?=
 =?us-ascii?Q?oJnXt3sUiwqOfQrvYbIVdVKOlrNvJGNL/K8lCBDP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RTSlt+ZqWvTp6ZNAfoWplQCzGMfZS6EoSORzpk1zBKcRFeFshRxCGfNe+PBXF4avmmBXV7WlYb3EL6lGPOFcit74iFJ9JWEVn1xWdRBPkbVDsfkk6J9gzffcszwHMhVBbVl93Gl3VAUB8W723+F5OkfnQFSJra16oHXhj6ykKTNW4iTlKAfEx+ZFza1SmdEoQFR1EOCXGiJrU5OdgGiYLQdef4vLRDp6eCW2oPTdRmASwDLHeR6K8S3NChi4ffMCq3UebD5qe4rMNO9asAuofZlHIDmmpsfJb/nvhsTIkayEX2YgkVP2L7DuF4W6OAuDz3eglZBImxRrhZn7gWAqxvzQWFPhwx1tV90hjP3zOAfiWOGvmRtXIcKALLm6VLDgPwXVUeK1uGQ4pjecysntwAHtk+fNk7jrK3MCyKgl3nyd7CbSjD0qiD8bGMV8cTTfhq51gF2LnxFgPM/99Rs5TxHAQfi0mGb0oag5/X5eM/2rB4pR4ggKtWJ5FUfEgtyzBysa1aQ19vII1je59T2EKk79/Im8My2V14+2iPSPCJ4EtiJ4WWXczHa+P+QmTBy04YipkyrI/4Q/Og8RLlkpAUedRlmeYcuoyWTu1xCz+Hc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08b2fe1-76b1-4d57-b0ad-08dcc7eb1e1f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:21.6956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2d4JjgdlE3ixyKfImi89lg2LbBek14E9zgQJcAkCjLTTABM1sfCxSGn7bk9UZcgw+yUnC/I1BeEn+g4xZomKGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4577
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-GUID: 8sY2jJSamP8XtwHfCUq1OSq53SxY3x7b
X-Proofpoint-ORIG-GUID: 8sY2jJSamP8XtwHfCUq1OSq53SxY3x7b

From: Eugene Loh <eugene.loh@oracle.com>

An underlying probe could support all sorts of overlying probes:
  - pid entry
  - pid return
  - pid offset
  - USDT
  - USDT is-enabled

The overlying probes belonging to an underlying probe match the
underlying probe -- except possibly in pid.  So, an underlying
probe loops over its overlying probes, looking for a pid match.

The trampoline would look for only one match.

However, more than one overlying probe might match.  Therefore,
change the loop to keep going even after a match has been found.

Incidentally, it is actually only pid offset probes that could
"collide" with any other overlying probes for a given pid:

-)  pid return probes are implemented with uretprobes
    and so cannot "collide" with any other probes

-)  no two USDT probes -- is-enabled or not -- can map
    to the same underlying probe for any pid

-)  no USDT probe -- is-enabled or not -- can map to
    to the same underlying probe as a pid entry

So, possibly one could optimize the trampoline -- e.g., by adding
BPF code to exit once two matches have been made.

Incidentally, there is a small error in the patch.  The flag we
pass in to dt_cg_tramp_copy_args_from_regs() should depend on
whether the overlying probe is a pid or USDT probe.  We used to
check PP_IS_FUNCALL, the upp could be for both.  Instead of
fixing this problem, let us simply pretend it's a pid probe --
a later patch will move USDT probes to a different mechanism anyhow.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c          |  53 +++++-------
 test/unittest/pid/tst.entry_off0.sh | 125 ++++++++++++++++++++++++++++
 2 files changed, 147 insertions(+), 31 deletions(-)
 create mode 100755 test/unittest/pid/tst.entry_off0.sh

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index 70e5c32d..bc5545fb 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -687,45 +687,23 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	const list_probe_t	*pop;
 	uint_t			lbl_exit = pcb->pcb_exitlbl;
 
-	dt_cg_tramp_prologue(pcb);
+	dt_cg_tramp_prologue(pcb);                             // call this only once... is PRID set/relocated correctly?
 
 	/*
 	 * After the dt_cg_tramp_prologue() call, we have:
 	 *				//     (%r7 = dctx->mst)
 	 *				//     (%r8 = dctx->ctx)
 	 */
-
-	dt_cg_tramp_copy_regs(pcb);
-	if (upp->flags & PP_IS_RETURN)
-		dt_cg_tramp_copy_rval_from_regs(pcb);
-	else
-		dt_cg_tramp_copy_args_from_regs(pcb,
-						!(upp->flags & PP_IS_FUNCALL));
-
-	/*
-	 * Retrieve the PID of the process that caused the probe to fire.
-	 */
-	emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
-	emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
+	dt_cg_tramp_copy_regs(pcb);                            // call this only once for all clauses?
 
 	/*
-	 * Generate a composite conditional clause:
-	 *
-	 *	if (pid == PID1) {
-	 *		dctx->mst->prid = PRID1;
-	 *		< any number of clause calls >
-	 *		goto exit;
-	 *	} else if (pid == PID2) {
-	 *		dctx->mst->prid = PRID2;
-	 *		< any number of clause calls >
-	 *		goto exit;
-	 *	} else if (pid == ...) {
-	 *		< ... >
-	 *	}
+	 * Loop over overlying probes, calling clauses for those that match:
 	 *
-	 * It is valid and safe to use %r0 to hold the pid value because there
-	 * are no assignments to %r0 possible in between the conditional
-	 * statements.
+	 *	for overlying probes (that match except possibly for pid)
+	 *		if (pid matches) {
+	 *			dctx->mst->prid = PRID1;
+	 *			< any number of clause calls >
+	 *		}
 	 */
 	for (pop = dt_list_next(&upp->probes); pop != NULL;
 	     pop = dt_list_next(pop)) {
@@ -740,6 +718,20 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		idp = dt_dlib_add_probe_var(pcb->pcb_hdl, prp);
 		assert(idp != NULL);
 
+		/*
+		 * Register copies.  FIXME:  What can be optimized?
+		 */
+		if (upp->flags & PP_IS_RETURN)
+			dt_cg_tramp_copy_rval_from_regs(pcb);
+		else
+			dt_cg_tramp_copy_args_from_regs(pcb, 1);
+
+		/*
+		 * Retrieve the PID of the process that caused the probe to fire.
+		 */
+		emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_get_current_pid_tgid));
+		emit(dlp,  BPF_ALU64_IMM(BPF_RSH, BPF_REG_0, 32));
+
 		/*
 		 * Check whether this pid-provider probe serves the current
 		 * process, and emit a sequence of clauses for it when it does.
@@ -747,7 +739,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 		emit(dlp,  BPF_BRANCH_IMM(BPF_JNE, BPF_REG_0, pid, lbl_next));
 		emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_7, DMST_PRID, prp->desc->id), idp);
 		dt_cg_tramp_call_clauses(pcb, prp, DT_ACTIVITY_ACTIVE);
-		emit(dlp,  BPF_JUMP(lbl_exit));
 		emitl(dlp, lbl_next,
 			   BPF_NOP());
 	}
diff --git a/test/unittest/pid/tst.entry_off0.sh b/test/unittest/pid/tst.entry_off0.sh
new file mode 100755
index 00000000..f1a75b6a
--- /dev/null
+++ b/test/unittest/pid/tst.entry_off0.sh
@@ -0,0 +1,125 @@
+#!/bin/bash
+#
+# Oracle Linux DTrace.
+# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
+# Licensed under the Universal Permissive License v 1.0 as shown at
+# http://oss.oracle.com/licenses/upl.
+#
+
+dtrace=$1
+
+trig=`pwd`/test/triggers/ustack-tst-basic
+
+DIRNAME="$tmpdir/enter_off0.$$.$RANDOM"
+mkdir -p $DIRNAME
+cd $DIRNAME
+
+# Run DTrace, dumping all probe functions and names, plus PC, in a.out.
+
+$dtrace $dt_flags -c $trig -n '
+pid$target:a.out::
+{
+	@[probefunc, probename, uregs[R_PC]] = count();
+}
+
+profile:::tick-1s
+{
+	exit(0);
+}' > D.out
+if [ $? -ne 0 ]; then
+	echo ERROR: dtrace
+	cat D.out
+	exit 1
+fi
+
+# Generate the expected list of functions for our trigger program.
+
+echo main > expected.tmp
+echo mycallee >> expected.tmp
+for x in 0 1 2 3 4 5 6 7 8 9 \
+         a b c d e f g h i j k l m n o p q r s t u v w x y z \
+         A B C D E F G H I J K L M N O P Q R S T U V W X Y Z; do
+    echo myfunc_$x >> expected.tmp
+done
+sort expected.tmp > expected.txt
+
+# Check output for probe name "0" or "entry".
+
+awk '$2 == "0" || $2 == "entry"' D.out | awk '
+{
+	fun = $1;
+	prb = $2;
+	PC = $3;
+	cnt = $4;
+}
+
+# Check that the count is 1.
+cnt != 1 {
+	print "ERROR: count is not 1";
+	print;
+	exit(1);
+}
+
+# Check that we have not gotten the same (fun,prb) already.
+prb == "0" && fun in PC0 {
+	print "ERROR: already have offset 0 for this func";
+	print;
+	exit(1);
+}
+prb == "entry" && fun in PCentry {
+	print "ERROR: already have entry for this func";
+	print;
+	exit(1);
+}
+
+# Record the PC.
+prb ==   "0"   { PC0[fun] = PC; }
+prb == "entry" { PCentry[fun] = PC; }
+
+# Do final matchup.
+END {
+	# Walk functions for the offset-0 probes.
+	for (fun in PC0) {
+		# Make sure each offset-0 probe has a matching entry probe.
+		if (!(fun in PCentry)) {
+			print "ERROR: func", fun, "has offset-0 but no entry";
+			exit(1);
+		}
+
+		# Make sure the matching probes report the same PC.
+		if (PC0[fun] != PCentry[fun]) {
+			print "ERROR: func", fun, "has mismatching PCs for offset-0 and entry:", PC0[fun], PCentry[fun];
+			exit(1);
+		}
+
+		# Dump the function name and delete these entries.
+		print fun;
+		delete PC0[fun];
+		delete PCentry[fun];
+	}
+
+	# Check if there are any leftover entry probes.
+	for (fun in PCentry) {
+		print "ERROR: func", fun, "has entry but no offset-0";
+		exit(1);
+	}
+}
+' | sort > awk.out
+
+# Report any problems.
+
+if ! diff -q awk.out expected.txt; then
+	echo ERROR: diff failure
+	echo ==== function list
+	cat awk.out
+	echo ==== expected function list
+	cat expected.txt
+	echo ==== diff
+	diff awk.out expected.txt
+	echo ==== DTrace output
+	cat D.out
+	exit 1
+fi
+
+echo success
+exit 0
-- 
2.43.5

