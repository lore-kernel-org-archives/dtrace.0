Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E268F4A
	for <dtrace@lists.linux.dev>; Wed,  8 Jan 2025 01:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736300906; cv=fail; b=Hzb3DH4KxWR4/UFmOCNWq7FnLzfJGEV09S0MzYhK2PM48fpiAIs2qcs4xQcKirIuTD5OYN+HfslTG33uraypYan7T3a4GOxItO2OKl4YMZxa58yTezBKUWdKM0DKgdAOTe9Mb6RcASjyeJIDKxYPGgHJFBpIhkcRQ3Qhn8FXBqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736300906; c=relaxed/simple;
	bh=+JuJhAiE3AYaXVZsZivpiR+Wldm/T7L5uuTHFeXln0M=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r84/EiojY6Xbi3GnOt1cZ1b2P3bcAwniB1L0MgskUVusMMWQOjbb9eXRM2i6LtFIEj2l/puEm/1Q2X7eYRTX2JwJkod4Vs5xJWTT6I1KjxuMMlD9DDD7BIYQeskKlDSkA9Tv9onVWKzDKfxUJTXEvdu7fqcAmgEj7AQZnVc9g0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hlvESYcT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=QQ8Rpg1u; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hlvESYcT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="QQ8Rpg1u"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507MMj2N029158
	for <dtrace@lists.linux.dev>; Wed, 8 Jan 2025 01:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=SHad+2+VVbu2oeFkUJwZtH2gGo7VMHaFPZDdEUE63r8=; b=
	hlvESYcTy+TYtfzCTMwoIDsou3+qFZqvM5GXLgaOs+fdE1fxw+1PKSvYqtsN+Wbu
	P4Bu2UWID6SeASHNJq/pXIC06MqWDI87o7cRB+iDHUaqW8J+ESv6z/dXU2usYdue
	iloPNEzwJtprRRIbXvIK8LgCwNo7MmMCfh0HhtDeGOvpeQdh7taUqzTlc2StL+wq
	P5vEzbcsiyYudJQQ+mtKAYt22PVB5/nAPnZ8nDgk2Y4m2NPVXTFDmrRoXZzjEXLr
	R7DkleMM0yi038HpEz1UL3n71S/UcwmjlozS1gBjuwB82y8JurmADnX3nnUpF0MP
	+lMNBRkQtGncg+HySCkSvQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xw1bwt59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 08 Jan 2025 01:48:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5080mScC019811
	for <dtrace@lists.linux.dev>; Wed, 8 Jan 2025 01:48:21 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xuefh3rh-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 08 Jan 2025 01:48:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NSH6yhF7ctgixWaExqaq6WyYGrYNkmrxL08TjIvSBQlM83AwNQy4IVT2/HlETQ779G/U43e9sTASWtTuxfbY167uUOlYiwCYNKuloiX74+tNUbDSSKHfQ7qKCsWNRPxP8Skhj+/Rn4oClWFF4XMpanF5aU8tiYt7euvrvYWDfNbwkTPcRavODVqElu51pv7Atb50ZiyYloblfOYYs8ZzGRh1vC5Rb3Z7wd8q7+DD7BDuqsbbyLXWdP9LFyGb0VGF73Vl0eCBI6oLAEe1pMU+5Sz1quh/+jUUpgNyI/YmTgnGMUfqxkhndpVDCEJ44qH7mHgT6fqJs/YCAvlrHMEe8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHad+2+VVbu2oeFkUJwZtH2gGo7VMHaFPZDdEUE63r8=;
 b=EORmgzCMka2PrsgnFYM1IvJH8kg6PBMOF+EG+U8Oj+z/sPmjYMr7++vY9GTEqCdlBLY3Z3GDvNZZyqYdveoZsNsZH8ZPGdRZ1tUs56ZkrfFcB8+C48zGRat+UekrgkI+ODnfd5n9JlY8pRVnLDXAM3Hgash8F3YYrbspz2umFYYoNuK7C7Nm0sS6MEWr+mrd3bVod/eOXLcAHBJlDQOGn816UW5s7XkuDlJ8OzWF/WCEQmKo6Fzfzc00e5pb0+EqeqzWW1bxl5o8SbtTebUHLisdARuMmZyyKpBd8fXwaMoMKV/cgDi9sWY19Vf82E4aA7YNQCNsLSTDNV3rUo1lzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SHad+2+VVbu2oeFkUJwZtH2gGo7VMHaFPZDdEUE63r8=;
 b=QQ8Rpg1uAgl+VJv9Nk9Fl/8TN0vIdcSHbnPRVnztac0uFNb1x9uD4eDEBjpxoGgEzzG4uRTNu2iqRJHPkbGTmuAWm/5W/Kpe4/74FIxNYbx9XCex6hkBbe5HrrYmO+umqWwVkuq0IBrunbrwCY6xOoljFHr/JMEIcbp1lHSUMPY=
Received: from CH3PR10MB7575.namprd10.prod.outlook.com (2603:10b6:610:167::13)
 by PH7PR10MB6379.namprd10.prod.outlook.com (2603:10b6:510:1a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 01:47:59 +0000
Received: from CH3PR10MB7575.namprd10.prod.outlook.com
 ([fe80::40c6:cf84:4381:d08b]) by CH3PR10MB7575.namprd10.prod.outlook.com
 ([fe80::40c6:cf84:4381:d08b%5]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 01:47:59 +0000
Message-ID: <e1205a60-59db-46bd-890b-7f7d63476590@oracle.com>
Date: Tue, 7 Jan 2025 18:47:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] io: adjust io provider for NFS tracepoint variants
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>,
        DTrace mailing lists <dtrace@lists.linux.dev>,
        dtrace-devel@oss.oracle.com
References: <Z32uRw0BCaUdtVFm@kvh-deb-bpf.us.oracle.com>
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <Z32uRw0BCaUdtVFm@kvh-deb-bpf.us.oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR12CA0017.namprd12.prod.outlook.com
 (2603:10b6:930:8b::14) To CH3PR10MB7575.namprd10.prod.outlook.com
 (2603:10b6:610:167::13)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7575:EE_|PH7PR10MB6379:EE_
X-MS-Office365-Filtering-Correlation-Id: 72bca236-7f8f-4b8b-a858-08dd2f867ac4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUw5S0hrL2duWThmdHZJakVzeDJDNXdRK0VnZUs4c2ExQW9WeVErVWdnSlZV?=
 =?utf-8?B?WmxpWVY4ZXJTS2N2SVRnNFJiLzdpR2p5ZjhBR3Aza09nQnM0VnJ3cDhHU1hK?=
 =?utf-8?B?clU2RVYyRUIzZzUvQlFVakdQWWIzZzBFaDNBdnJRZHpVTUM2WUFBSW5lQmtk?=
 =?utf-8?B?dy9vQTViR1A2dkc3Vi94UDdxZElhUENINTJkdkZYcVhLUmdNMS9vL1JJVXNE?=
 =?utf-8?B?ZlcxdEc5aWx1dUY4bjhIRTRvZHJVc3ZTd3FQdjJOYnpoc2tZaFk1bUFsZUhn?=
 =?utf-8?B?N0lFaldyWGtKM1A0MnJBQlFIdUxhS0dTY1hwRjJ0NktaNStKVXJSQTUyNGFB?=
 =?utf-8?B?M0szRkNDcjFDQ0h1OVJrVys5KzVkdWZuaDJOTW4rTkFsN2xNVDcyajBVQ1A1?=
 =?utf-8?B?UHF0SU0wVzF2UW92ZElwRHExUzJVT3ZMdjVBT3ZqMzBIVEpNN2V6YnFMZ05Z?=
 =?utf-8?B?ek9Fbi9HdEZ5dGJibE5JNnZiZFRWUk5KejBURlliUlRPaTQxMktYSENnQ016?=
 =?utf-8?B?UTlTRXJVaW4wKzNnOTZmTTl6OUFBV0J3NjdycXQ1YkdlaGNWYkswWDAxUy92?=
 =?utf-8?B?aFRDbzlkV200NnZHRUxOUFdSVmhkREhVQXhBS2pmY1FzSW10YWlCVk5WMzFy?=
 =?utf-8?B?SVFQeXlOU2xsNlBNd205MUlUOWlLNU5NWldoOEpQQXJBeFA4WFIrbWhNekkr?=
 =?utf-8?B?MlRjTC8rdUJDNllnaFlwNXBFTWhtY2hXSFZIOHNOYXdrWWhRSEZDclk3LzQz?=
 =?utf-8?B?amc0T3phQmgvMlU2UmJoaEV0My9OWXBTWm9kZWVSU3JWRlVPV2R2UEN3N2JW?=
 =?utf-8?B?ckVqcUN3RWNLSFFvdEZwNlZsSnBnYndhVGJoRERyQW9Od2VSRHdZNS9MeVlJ?=
 =?utf-8?B?ZG5zbFBsOWhJdDlPTGp2QlZta2RaT0haTGY0TjFuWm1KZGY4cVNGZHpLZlhO?=
 =?utf-8?B?dC9LWXpDU1E2NzI5aG15SCs1bVJuN0tIeFJFcE1ocnBnUXVjOUIvSXJWdzJ1?=
 =?utf-8?B?NVgwSkVLS1huWE5tYzlicXpJZzFKMUtackdpMmlkTWt1USt2RElyTm1PWDN3?=
 =?utf-8?B?Tm5sSFFBblVBVnhncDd3RDZGZ25JS3lIR2gxTDJnU05GVFMyTkpCU1lxZUVX?=
 =?utf-8?B?d2x2K2xXR2ZhYmN4dWxrNnlyNUVZT3NGamR3TzJ4cC9IcElVODh4cThONGlP?=
 =?utf-8?B?dnRYVWY0VXlTV0FGV0xYbDROVFJhVUhqN1FXOGtiTDViWHdsOTl0SnBIWGVv?=
 =?utf-8?B?Mkl4Ui9nZ0c0aGFiSGVyc2lmYmNaeVhoYnQreGFEU0VBcllvcUpLZzA1SU1L?=
 =?utf-8?B?aWwxeU9rWmdjemh2RnZmQldURDEyYkJvdEZHRDkzZUVDdXVqd0J2UGJ3dU5C?=
 =?utf-8?B?Z1U3RFhwdzZremlOajFnVkxCVGgxYnpsNXlVUTE2WG1pMkNWN1AwbTBwSXJX?=
 =?utf-8?B?ZHNmaUxtQ3phQkpTTlgyM3ZFT1ZZdXAzakRocGxJdlNEWEZqWjRUbkV2TU94?=
 =?utf-8?B?VUNEbkV4WmgzMmppSEJDbEpEa000YXhhN2xKUkxHb0REY0RObDJnRW51TExW?=
 =?utf-8?B?blVpQ2lzUEtVOUtDeVJtdTF0ajVsMXkwdi9HQzdmWG83eU9VbjdLcHk2K0Q1?=
 =?utf-8?B?R21mV0Nkb0ovTWRYeTIvYWJKM1JrdTIwZm5KSWw1aUhFcHM3aTNEYnhOZ0No?=
 =?utf-8?B?LzZkOGltemJBNkY1UTJNYkZnajlvSUtVbnI0SFU5cHdaMFBFT2FmTHNOVGcx?=
 =?utf-8?B?eWxVR0hrdlR0dDZpa0NLWDk3RVp4Y2ZTWnhNWjR2emMvRy9qc1JUNWVnSm1m?=
 =?utf-8?B?OGFhUWM1ejNvLzQrQXh4VHZVaHRMMFg3YTlWbnFvcy9KdDI3a2kyNFVzTkFW?=
 =?utf-8?Q?SewQY489WZe2I?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR10MB7575.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEZUTWczN3pHaGhET2tyRmQ5aGRhSzlSbi9Yc09PWCtqTU9xdWJMeDRvYXlZ?=
 =?utf-8?B?MStjUWlEQ1IyOHE0RmZSM1ptN0FuL0pRYldRME0xZ1lYOElUQVNJV2o0VzJ4?=
 =?utf-8?B?NldpelFoNWpSK2FTY0wxL1Rab2pYbVAxQUh5NnM5RVJLSkNhaGZNeFNNam9Z?=
 =?utf-8?B?QmhoMnQyOUxPOHlaVDI2ME5Kd09NUFhHdlpZTUFPekZWcHlZY0RCdkdHcGpn?=
 =?utf-8?B?WFdOc1BvWFFOdUpqOTg5TUpZMnVraENmelVsdXhjVTVyNWc3dUlwOGhIMzQv?=
 =?utf-8?B?bTlsVGVkZ3VpOXEzTUF6dFh2TEpSY0dHWlg5ZmlEYkxGblBJS0JLVFg5dUlx?=
 =?utf-8?B?VnhWbmtlY0dsQ0Zrb2RaSkorbEZISUJhek1nbnptVUt3QUt3VnNwTDUwck9x?=
 =?utf-8?B?cDB5ckJpM2hiRWlGVXYxcWhVMTMzWG81UGJia3VwOTNJcG42aWlDdzdaWmNp?=
 =?utf-8?B?Vy93a1IzaVlHKzBTVWJqZWFMZWc5N2dKamh5TUZNbS81NTIwRWdBbUZoS0RR?=
 =?utf-8?B?WldReTZZY0Y1ZDA0Y0FwODVwMlNhb0RWU0Z4KzJGMXpEcG11WlhUKytCd2Ni?=
 =?utf-8?B?bjRJRGN5TGxHWHdBSjJ0ZzFyZzlXTE9ocnZuNGh3ME4za0ZlOEh0NnVVMTBv?=
 =?utf-8?B?QUs2SWt3b01RZGdtL3RxRDdidWc5aytoYnhPMTJMOWx2ZWtSMk5sbVhBMmc0?=
 =?utf-8?B?Vm1VcDJEY1ZiaURueVNIUWpySzk5cmNFQ2c2VVZlODVqeTV0UHNVS1MzKzV6?=
 =?utf-8?B?R09vWDBlS3FOZWwrcnNZUlA5OUtwa3cyS3JrK3pkU3pxL2tCU3ZsYTJHMHFU?=
 =?utf-8?B?Y0kzV05jelZXN21xbWFtSTZBQWRlbUtzbXN1Z0JJRWNteTcyMlJyelpPSnBs?=
 =?utf-8?B?eEYyTDBpbDJwV2lGZTM4U3VHcTRiN045UkdxeDY1WHhpc3NISFdhQUdWSzZP?=
 =?utf-8?B?ZVJwLzFXcEFYYlNPMVVPbUtDWXBPcDJvb1hlWDJ6OTA1VXl5TGo4K3lFSDE1?=
 =?utf-8?B?cW1oR0xtMlhZSXpCS0FOa2FqQ0Irdmw4U01oYmQ3SFFEUk5ndm5LVHZqTW1T?=
 =?utf-8?B?Z0FKaTNFWjRub0ZrSVNNMXcyYkpNWGZvU0R0THoyUW5Gb0JMcUx6ZGFOSS9l?=
 =?utf-8?B?WFVlOTduV1pQMlFQNUk4QlRRRmJMS2R0UllGeHhqVlZKYUNzVVZIVWtwTUNI?=
 =?utf-8?B?MVhqR2JIUXJmVmVxUlkwSXJFZ0Z0Y05Ydnd6SUxKM2pBVVBFS28wZFdxZXBz?=
 =?utf-8?B?dkQ1SnVteGNLV3VjQUdLbU1zbHRJR0VZR2lYdHNLUnQ0Uy9WRFdKdmk3ZjFi?=
 =?utf-8?B?NVJrT2UxVDR1Wk02RVYzeXJjUWMwd3hKZVhnNmsvdFQ3SkVEczR6dUxZQndG?=
 =?utf-8?B?Y0EvWXVtUmhCVFV4Ukg0dnJVK3ptUFQ3THNGYWl4U2ROTHhZd0d5dHRiZGNW?=
 =?utf-8?B?R3lPdTFBSUZxbTZHS1FSL1NLcU10dnlmbjFVdjFLc0ZmQ1gxbDlZWUtqYzFr?=
 =?utf-8?B?ZWxBTTBIcFB1aDRBWWhQVzZkWVc3Qk85akxNcUFDVEFxSVc4OFNqYUxGam0x?=
 =?utf-8?B?ckZIZ0NjWVo3cjNtZGFFNlluUzVCVWNyRjVpWWlUemxBbXVvbHBqcW91a0tI?=
 =?utf-8?B?RUJmNHhPZ0xuS1k0aW16cmdYN2ZveWNGT0RjOVRUa1VZaXVxM05uOUNIZHBw?=
 =?utf-8?B?WVorOEhBZzI3dnVzWm81eHBxR1NrMmtpSS9xOXlSeEV3ci9SdXk0MzAwbFJG?=
 =?utf-8?B?cFhDcFZhRENXNVU2eWx2RXd0RFdYejFweGFOOUhCUzhlNEYyK0hROTBDK3Zh?=
 =?utf-8?B?OGhBNG5yWFVNRkFPUnkrOGE3dnczQnNNa3M2NXA5bDZjajJ4eUNUZTliTVN3?=
 =?utf-8?B?bUU1Rk5ZUnhQUDRGb1VaRWthWFRHcnVzNnNpNm5OazFmME1NdmRYT2FLR3Y3?=
 =?utf-8?B?L1JZY2UyL2FZN3UwdmNQNEgrS1hzOUF5cEd5VTNoVFpWdzV1clF5OWdzb2Nx?=
 =?utf-8?B?QjNQelBZcDdCenIzUnMxUFZsNWQ0bVVMa1QxNXhKSkJYTi8zcnIza0VpMjZy?=
 =?utf-8?B?cmZyRmN5eWdlWGw2dmpmVWJvTUVhZmxnUEpJakFITnNnSGdxZVI2UzNwNUZJ?=
 =?utf-8?B?UzZGS282NnBrVHoraW54M1g3dEs5UE4vU1NtNHI5SGQ0SmVkRDVlNStYWFVT?=
 =?utf-8?Q?RPy8O2ACxlWtxTi0uRTYEXQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HPZaKzA7R0RxyEmt3KcOxK2zxH2IlQsNnL6IuTGqqQRg5LRjMa8Ixopxxzb/BZ/0RXEfUzcXuQzMPy/nNH2ImOux7b1g/Fb8blxDmLr7g4hEZI8RoutErjfps4Jmc2Mv4iXFY6KEwFolPFzOaYyQHLNOOJZyXIszeUkGbkl4knuqKLI6Up3UDmsQ/utEAgkJuS9yoidbyNx0OqfPGgUcQBll/MV5XwuxCqX3WGzsHSkTG/dFaaAsCUOWdz1/Bu04JqOue2grH/wiJWIRpZEQOJe9BazX79SV4h6yqo8BBS7mhb1hgZYNtsETvCKG3YW7vLjy9AQNz+NZVHbYhFtVzCvwBdV0MOIRB2UDUVgE0ji8Zataj0tOX9Av6TJ2zPIUkGSE9gcH7iJCUxFzy9/LzUvHvdCDaUzbg+m4/nJZpqylkxetZhwoe4teUwcjXr75istF/MOGiswSXcWAzTm1CLjXa6ryWWRSkq0y0Z3apbWKycZ6B9AoyFVbu6SzIaiWr5jnCJNnS+WxkV4Z2oo+SVtdSLZDhb3wcRQsUFxWIYuvtZK6t7yMTlqMMoPHHN7Ar1NadHzx7Y87IGKt9nKEcSdRZPgqoEVL7XPzoM0gLM0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bca236-7f8f-4b8b-a858-08dd2f867ac4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7575.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 01:47:59.1298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5lWXZ7yeJCfovOYfnz3UamHMS9GoLOD4OoYyYH0DeHSZwx8rIHdlfQvQBY23mKrXPcAqd8YVeJF0Vrao5ty2r+u5Xmf6BZFusbXC/lxjUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6379
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-07_06,2025-01-06_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501080011
X-Proofpoint-ORIG-GUID: htuYxuM8PBugrYtGI5A0-2spS_oROp7k
X-Proofpoint-GUID: htuYxuM8PBugrYtGI5A0-2spS_oROp7k


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

elena

On 1/7/25 15:44, Kris Van Hees wrote:
> Kernels prior to 5.6.0 pass 3 arguments (derived from the NFS hdr)
> to the nfs_initiate_read raw tracepoint, whereas kernels as of 5.6.0
> pass just the NFS hdr.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/dt_prov_io.c | 127 +++++++++++++++++++++++++++++++++++------
>  1 file changed, 108 insertions(+), 19 deletions(-)
> 
> diff --git a/libdtrace/dt_prov_io.c b/libdtrace/dt_prov_io.c
> index 385dc792..45cb875a 100644
> --- a/libdtrace/dt_prov_io.c
> +++ b/libdtrace/dt_prov_io.c
> @@ -63,17 +63,9 @@ static probe_dep_t	probes[] = {
>  	{ "start",
>  	  DTRACE_PROBESPEC_NAME,	"rawtp:block::block_bio_queue" },
>  	{ "start",
> -	  DTRACE_PROBESPEC_NAME,	"rawtp:nfs::nfs_initiate_read",
> -	  DT_VERSION_NUMBER(5, 6, 0), },
> +	  DTRACE_PROBESPEC_NAME,	"rawtp:nfs::nfs_initiate_read" },
>  	{ "start",
> -	  DTRACE_PROBESPEC_NAME,	"fbt:nfs:nfs_initiate_read:entry",
> -	  0, DT_VERSION_NUMBER(5, 5, 19) },
> -	{ "start",
> -	  DTRACE_PROBESPEC_NAME,	"rawtp:nfs::nfs_initiate_write",
> -	  DT_VERSION_NUMBER(5, 6, 0), },
> -	{ "start",
> -	  DTRACE_PROBESPEC_NAME,	"fbt:nfs:nfs_initiate_write:entry",
> -	  0, DT_VERSION_NUMBER(5, 5, 19) },
> +	  DTRACE_PROBESPEC_NAME,	"rawtp:nfs::nfs_initiate_write" },
>  	{ NULL, }
>  };
>  
> @@ -155,12 +147,109 @@ static void deref_r3(dt_irlist_t *dlp, uint_t exitlbl, int addend, int width,
>  	emit(dlp, BPF_LOAD(width, reg, BPF_REG_FP, DT_TRAMP_SP_SLOT(0)));
>  }
>  
> +/*
> + * For NFS events, we have to construct a fake struct bio, which we have to
> + * populate from the inode (arg0) and hdr->good_bytes (arg2) arguments the
> + * underlying probe provides.
> + */
> +static void io_nfs_args_v1(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl,
> +			   const char *prb, const char *uprb)
> +{
> +	int	off;
> +	size_t	siz;
> +
> +	/*
> +	 * Determine the various sizes and offsets we want.
> +	 *
> +	 *     // Access these fields relative to &bio.
> +	 *     struct bio bio = {
> +	 *         .bi_opf = ...,
> +	 *         .bi_iter.bi_size = ...,      // struct bvec_iter bi_iter
> +	 *         .bi_iter.bi_sector = ...,
> +	 *         .bi_bdev = 0,		// -or- .bi_disk = 0
> +	 *     };
> +	 *
> +	 *     // Access these fields relative to hdr.
> +	 *     struct nfs_pgio_header *hdr;
> +	 *     ... = hdr->res.count;            // struct nfs_pgio_res  res
> +	 */
> +
> +	/*
> +	 * Declare the -io-bio variable and store its address in %r6.
> +	 */
> +	dt_cg_tramp_decl_var(pcb, &v_bio);
> +	dt_cg_tramp_get_var(pcb, "this->-io-bio", 1, BPF_REG_6);
> +
> +	/* Fill in bi_opf */
> +	off = dt_cg_ctf_offsetof("struct bio", "bi_opf", &siz, 0);
> +	siz = bpf_ldst_size(siz, 1);
> +	if (strstr(uprb, "read"))
> +		emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, REQ_OP_READ));
> +	else
> +		emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, REQ_OP_WRITE));
> +
> +	/*
> +	 * bio.bi_iter.bi_size = hdr->foo.count;
> +	 *
> +	 * For the 'start' probe, count is arg2
> +	 * For the 'done' probe, count is hdr->res.count (hdr in arg1)
> +	 */
> +	if (strcmp(prb, "start") == 0) {
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_7, DMST_ARG(2)));
> +	} else {
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
> +		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "res", NULL, 0)
> +		    + dt_cg_ctf_offsetof("struct nfs_pgio_res", "count", &siz, 0);
> +		deref_r3(dlp, exitlbl, off, siz, BPF_REG_0);
> +	}
> +
> +	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, 0)
> +	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_size", &siz, 0);
> +	siz = bpf_ldst_size(siz, 1);
> +	emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
> +
> +	/*
> +	 * bio.bi_iter.bi_sector = inode;
> +	 */
> +	if (strcmp(prb, "start") == 0) {
> +		/* inode is arg0 */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(0)));
> +	} else {
> +		/* use hdr->inode, hdr is arg1 */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_3, BPF_REG_7, DMST_ARG(1)));
> +
> +		off = dt_cg_ctf_offsetof("struct nfs_pgio_header", "inode", &siz, 0);
> +		deref_r3(dlp, exitlbl, off, siz, BPF_REG_3);
> +	}
> +
> +	off = dt_cg_ctf_offsetof("struct nfs_inode", "fileid", &siz, 0)
> +	    - dt_cg_ctf_offsetof("struct nfs_inode", "vfs_inode", NULL, 0);
> +	deref_r3(dlp, exitlbl, off, siz, BPF_REG_0);
> +
> +	off = dt_cg_ctf_offsetof("struct bio", "bi_iter", NULL, 0)
> +	    + dt_cg_ctf_offsetof("struct bvec_iter", "bi_sector", &siz, 0);
> +	siz = bpf_ldst_size(siz, 1);
> +	emit(dlp, BPF_STORE(siz, BPF_REG_6, off, BPF_REG_0));
> +
> +	/*
> +	 * bio.bi_bdev = 0;
> +	 */
> +	off = dt_cg_ctf_offsetof("struct bio", "bi_bdev", &siz, 1);
> +	if (off == -1)
> +		off = dt_cg_ctf_offsetof("struct bio", "bi_disk", &siz, 0);
> +	siz = bpf_ldst_size(siz, 1);
> +	emit(dlp, BPF_STORE_IMM(siz, BPF_REG_6, off, 0));
> +
> +	/* Store a pointer to the fake bio in arg0. */
> +	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
> +}
> +
>  /*
>   * For NFS events, we have to construct a fake struct bio, which we have to
>   * populate from the nfs_pgio_header argument the underlying probe provides.
>   */
> -static void io_nfs_args(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl,
> -			const char *prb, const char *uprb)
> +static void io_nfs_args_v2(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl,
> +			   const char *prb, const char *uprb)
>  {
>  	int	off;
>  	size_t	siz;
> @@ -411,6 +500,7 @@ static void io_xfs_args(dt_pcb_t *pcb, dt_irlist_t *dlp, uint_t exitlbl)
>   */
>  static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  {
> +	dtrace_hdl_t	*dtp = pcb->pcb_hdl;
>  	dt_irlist_t	*dlp = &pcb->pcb_ir;
>  	dt_probe_t	*prp = pcb->pcb_probe;
>  	dt_probe_t	*uprp = pcb->pcb_parent_probe;
> @@ -420,13 +510,12 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>  	 * we need to synthesize one.
>  	 */
>  	if (strcmp(uprp->desc->mod, "nfs") == 0) {
> -		/*
> -		 * If the underlying probe is an FBT probe, we pass function
> -		 * name.  Otherwise, pass probe name.
> -		 */
> -		io_nfs_args(pcb, dlp, exitlbl, prp->desc->prb,
> -			    strcmp(uprp->desc->prb, "entry") == 0
> -				? uprp->desc->fun : uprp->desc->prb);
> +		if (dtp->dt_kernver < DT_VERSION_NUMBER(5, 6, 0))
> +			io_nfs_args_v1(pcb, dlp, exitlbl, prp->desc->prb,
> +				       uprp->desc->prb);
> +		else
> +			io_nfs_args_v2(pcb, dlp, exitlbl, prp->desc->prb,
> +				       uprp->desc->prb);
>  		goto done;
>  	} else if (strcmp(uprp->desc->mod, "xfs") == 0) {
>  		io_xfs_args(pcb, dlp, exitlbl);

