Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D572376A13
	for <dtrace@lists.linux.dev>; Sat,  3 Oct 2026 08:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016714; cv=fail; b=BWrppWCAduViErqgwkr19ipXNAlIqjYcBsPg4vpdX3djnxdQdUUpBm+uIpWGvlz3DNIluiUAnBh3wnFJKmBsVNT8EytEXdU2M/hWtwQ3FvM4ylR7QjqLCD9qNfe4+HBSNY9zBoQ7zIocYW3nOir7sMiOS9SU/54WCFs3Xjp/fAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016714; c=relaxed/simple;
	bh=L9+Y7xOmkSvFrDDXU1+6JNw2tekBaUlBrP1hmrS1Khc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q7IFgNEDCNpkOe6ySNLYvRifYABL/Mdsxr+xTZkMmCGl8H42n55M6Wr22wobMTZqp2zVqtMcQzzkPNMVfonNoXMFQ7TZJSoM5mI6XIiDxnAjPdDbFfOEMZz8bVHNnGLJdHOq3mtZbw+bMFTvoElnLhr2J1RuGl7DSTk0MJ1qbB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bXH2MOiZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cjJn1EUL; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bXH2MOiZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cjJn1EUL"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6938IJrM702962
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=2Obf9bu54iSb2T6stfMFssD6VYv0lPh2gSmpaQZxtsY=; b=
	bXH2MOiZE5RYHLNn+JQQTTbFEJtzX8W2cpU4v4y7kK8pNJ1WfgvFad5EBLj5Oo4J
	bJe1uTfdTGmXn04HtuZzK9PTeAVxjZU3Xoi3uy8nfHF+y7hqWbzbi2jlqGprOZ4y
	nGTvP3cNkOVUG1o1rGjsmJoVgNu2r+feYeNcvj5/lQJ6RWI5SjqC0DJhdW5it2+0
	SPnxdPd9xEog2pEHarURb1USgeKOG+42/1ShHfdNzDiSQVr17+C7R7j16NUJkLA2
	RvxbnwegdZfDp/EY4/I3ZTlW1wkPFc0pHZX6oFgDyCC101ZNPH7BAbrLvTCTabB0
	UPzkvJ0s0PPvOf9lTCHRog==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2t8rr3h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:38:31 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6938YwK4018266
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:38:30 GMT
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010014.outbound.protection.outlook.com [52.101.61.14])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4h2r58ed1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:38:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2uPjhr8IIUVEO3XeQ3OWFp5TWHyzSOF+4Pozp0MWFoDbIbW7Jzhv+A3vPrUjb0TBwvGui14wDZkTnBQCTTvS75cvLwt7ODSU3dEw6y/I69FUGfOUvjnAv+dOV8vx4jDn0sMWqzzjbYSBGMJtQPLrFWNzgsew/TBnMStpuk7od4YpQ0v5XW0G09GDoeDAtrBxrFrZYmALmla8JKQsquHntCREyyUj+f9NNeg4oydD5h6PLQ2jca5e2N7IJR872RclhycF9idbJlxeZz5ovZL6t2/6vtSE8W1O+Xp1HdtRF9Jrw0hCnr1ys06kPWfHA7mwfudmpUy/AWbfW4xzMlxug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Obf9bu54iSb2T6stfMFssD6VYv0lPh2gSmpaQZxtsY=;
 b=CNzsIkPBkumoPBFTZPzB9O5j9bJyoL9AG/W+rhO/oz0fiRj2s3EfFLueGZeiFL6/CliEo721JWcyELDbdhYgJieG48EL+YkN+6+p1759JpSXB1yendT/hTBt5S2AhoAzR8z8/I2xwwAw7cq+HK5cRo6EP3GxygbWUkPAE97E8q3iMettmZs+HGexn95V0+eZ35b/X6i+s8+Imw+Ya4raPZ7BDmqOCFx+Sbol56CMAvAUg+yn+aIb1J5ukOyNIqW+HduVOxMX8Rmmdb+lx5QW92BVk5GrzrdaG99ObhxL1a22UQQlrqc9xTn10EoPYmhPoPJdc1hAue4KhX9Jtc/ZFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Obf9bu54iSb2T6stfMFssD6VYv0lPh2gSmpaQZxtsY=;
 b=cjJn1EULs5bIuRS4hP0XoYzsHdZqIYzp2vhxBsEgg3GjHwCNi146wncfhuUq3HpmMQSN/neBVoltmhwVad5ZFA/XPKgebo6pxTNVbPE+/Ma+6XjHnh2hNy3S+esvPFEvjEd3Usl9EPEWyuwCeQORNXoZ3I9Sg8GfmdnpVuIS7os=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by CH3PR10MB7680.namprd10.prod.outlook.com (2603:10b6:610:179::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.13; Sat, 3 Oct
 2026 08:38:26 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%4]) with mapi id 15.21.0496.008; Sat, 3 Oct 2026
 08:38:19 +0000
Message-ID: <c2791992-bb09-4108-befb-4ca1409b9c98@oracle.com>
Date: Sat, 3 Oct 2026 02:38:13 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 3/8] parser: validate scoped external names
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <8f28ccd1f4fdb30ab6054c7d3f51355b@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <8f28ccd1f4fdb30ab6054c7d3f51355b@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0016.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34e::18) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|CH3PR10MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 95197735-118b-4692-4f49-08df2129abe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|18002099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info:
	0oHGZQsiols0wy++YFbfCossj3IDZAocE4eoN7r63y/MIr5PX9ZQW8hlvgSXpnvFMGS79PM6dJacrJvmRYWJgAFrA4ELd9Y1ZiHMUewljIqvtPs+C59b1U8umgy43wcwiyq/arR8OHbLHDaDvIihd+Y83NjF/70OR7rRs9NuNaSn9NVGvAhu5TkLHkbxtyh61tBG95tJEqXCcHmX4xZhEmmcdFQ8k26zm38COOwAtnoOF/+mNEayK05HXlnLgm5dRA96Tc00seFFqnsvDylLtDetuEmJJFFvMSZZ+PAvcVy3kWNumtjiwzgYVFyL+Uy2WBxWB6f9cK0FNQT1izRMevjvYG9CZQ9uXBt2tZKnrP/pbCT97dQNeCS05qASTGlOVXLPa3X3ZQ81bIlhopsKwVeMGoMwSmfyinnh6dvcbjCq475b+b3C+pVgyuDOWu/gKYJ7BeMoxPmCrAva49eC2TVY7RzEpYnRyDTOMvjlNmJ5Ik0O04JJPt6FPELPgWemG1LWqKZUgwz2zZkbWGSR4/Ffyq/4iRsTrrkPFBHAWNY7hGxqJoj9lWuVLGpBj1Vi7AqHCwW1qlR1IqdCkELm/hhpMNw3IRnNIbSjcxLl+MbfzjwIMRJMydY2KjkPQc0pDem1pLmJPe1rjkiofa/TZGSD6w33XiXPDuyIkUgLPxs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzBGR2NIdWJBQ3gwU2FuNFlDMmd4Z2JTVW9UbWNSN0FwNWhWRy9aeFB6MUJF?=
 =?utf-8?B?dVZSUGdtV1lDSTIwUHRzVlJaZFFNMEtPdWRnWnA4dWcrUG95NjdHYTN4Qy9D?=
 =?utf-8?B?dU9SV2xESHdobXVEdEZnZEdjZTB6MkxMbXdPOXYrODM4SGhiNFE0dEFPeHZy?=
 =?utf-8?B?clVVb2lKWFVMc2FyUkhReUdaRnF5Q3MrcU14cnlwdW91dURqd3JEak1qY0Zo?=
 =?utf-8?B?OEtjeWt2QklsODdzWXE5c2psSjNXSk9zcktaMG5vZ3FPVWM2bG9qNGF6dGtB?=
 =?utf-8?B?TG1lNmVLYTg4b09IeDJ5VW1CbG56UGZacEphNjloQVdDTDlLQTFiMjNWaTFo?=
 =?utf-8?B?SFl5MXd6RjZFalhzWE9YNW45b3grb05RZzBjb1FSNmc5QUljaTA3MklPdE9j?=
 =?utf-8?B?UW1xV1c1QkU0S2ZPSStHWmt4WE8ydm04bzdoRkRzbDAxSTB5WHhhM2J6U2dS?=
 =?utf-8?B?elo1K3JDbEl0NndCejNhN28wRUQ5a2F0YVlxRHJUMlM2K1E5c2ZNTTRRKzVY?=
 =?utf-8?B?dFliYjE5SGMvMTZ6cVdYTXhCY3dESi91UzhWWlBDKzd6QUFmZjZVNU40QnJG?=
 =?utf-8?B?b2lJaVNLbmxWTEZpcWFQSzlHaGV5SUZWbXlYMWw4amNPSjFua1dmeXk0c1Fq?=
 =?utf-8?B?WlNFdFZqcVdtcXFob05lZ3ZYMk5UQjUrUEx4UVRyUlVDMTRTL2N3U1h0eWdY?=
 =?utf-8?B?Z1Z5MnduZHFxVUdwaFVKYnVJSlRNWEhwTFZmalZDQWxKSzdXRFBMTDF0QjBv?=
 =?utf-8?B?dUhOLzl0L1lWUlN3QTVkVWNHaFU5Wm5YcGlTZDZnVjhwVzZ0YXRVMEhPVklo?=
 =?utf-8?B?MGRKN2RHUXdSWEJucnFJY1lpSnZLWEZ3WmkrRnRmOVRzdVdHTkx0elRyVU0y?=
 =?utf-8?B?MXBjMDRUVzBPTk5OeVBkNVRWajRDNzVmOUg5dWdGeC9uMmdkdzZWZmR4MFRy?=
 =?utf-8?B?UGVDOFAwa3YrejBHZWdzL24rMU5wVGZjY0xZOTliUk9LUEdNREwvWnVUdkxa?=
 =?utf-8?B?dG56eWlIeGwvVWQvRGJOSWdSelc0YmZnZXZJMDJuRVl3WGsvOHFFT0Uzbnpt?=
 =?utf-8?B?VkFPUEJ3ZWpPN2RBQklka2tIVlNlUGJuVlM4azAwNWp6Y3U0anpqU2VrMWZK?=
 =?utf-8?B?Um0vVHFNQ0VlbHdGWkdDYXkzODgzWmVYTVliL2pFTkJxTnFXUWJBRklJWTZC?=
 =?utf-8?B?MVRSbm0zdEVIRnRMdEVJRXRDVWpLZU1lRkQ5a1NBNFBYMkZRWm0xRGVFU2RD?=
 =?utf-8?B?Z2JSY2ZoTEFiaUI4RHpZUWo0Q242Ky9FdHdoTjRncG9LMENzMXVvenBuTzFM?=
 =?utf-8?B?ZURMK21vd2xKeHZUZ0lRek9XWHk0Y0tFS051dVNnekd3d0dqL2dOWEh2cTdz?=
 =?utf-8?B?cmtwWnErTWs2a09WNEJwTER6V3RtQVJYUFBCY2ZzOWtDRW5WMm0yNmxKNHNT?=
 =?utf-8?B?dWNNUElwMDU3SzRIcFBvclBvbHRBSVdwV3F5b3ROdEgwaDBNQkQ3MDhLek1r?=
 =?utf-8?B?UUhWeTJVS0xDZlk5b2JkaEs4Q1ZwU3diREVEQlBmRHlkUjlpMWhHdXpuRGNL?=
 =?utf-8?B?YklXVlIreU54SGJYLzl0bTN4alQzeUNZS1dtUWpheUoxajdBeVc4N2lrbWNq?=
 =?utf-8?B?MnJtdGUzZmxxbG56VGdPU1psRkJ3UCthbzVPellRRFlHVlM4bm9adE9jc3NH?=
 =?utf-8?B?ZVVqS25tWElGZDFCOGJFVFVJQk4vRWJCNkR5d1hkQmtLREdFbkN0OXhJUDNW?=
 =?utf-8?B?VmgxUnU4Wnk2TmYrT0poTCtZekdLaFBTN3RvN1NNWmljSFc3OWZ5eFNySC85?=
 =?utf-8?B?c011VXJpSDd2R2F0VnBuamUwZCt4ejVsSVpid0NMQXNxZDhQTkpGK09TTk5u?=
 =?utf-8?B?UHp0alZrWlkvOERQcmdJYTlKOFFtNER3Y09nWks1cXVxd25TaHFpUDNDUUM0?=
 =?utf-8?B?bUpmaVY1WW5MTy9KYzI2K0JFazZkcFpIL2FscEJSYXZTMUh0V0gyUXNyUldD?=
 =?utf-8?B?L1N6NHhVeTJOcVdMTmFQby9hYkFaTXg0c2ZuUHdxNUhocVRVcFZIZURKM29R?=
 =?utf-8?B?S3MwcDRkR09CanN5ZG5mTU1JMnRSQzgwOTlJWDVDTFFnRWRabEdETU9XajlX?=
 =?utf-8?B?QjlCVlBSMTF5dGpJUXZBUjVnWWVXK1A0UTRGVEhRTzFVcnY2c01NNENYd3lR?=
 =?utf-8?B?a3Q1YmZIdUg4TlF6ZW1RUktLbitsN3F2V2J2aDNXNUdGOXRIT2hhYTBDS3E4?=
 =?utf-8?B?c1VadmhOZytRaWY3ei9GbklQY3dhNWw2ZFh0UlVzaEJPTzBVSzNFRWlOcVg1?=
 =?utf-8?B?eVM1SW45azFBZE96S3A0TXcxQngyOXAwZlYzMmNmTDh6amFWNU5MbEJFci93?=
 =?utf-8?Q?sm8CfGqmqQXyrCzQ=3D?=
X-Exchange-RoutingPolicyChecked:
	3yKAlZkdOpMWbq79l3xodolG7xn+0Mtr9E+K7mE07JV4qqIn8/RtLFsFsl1EKM8OBAImUV8CAmA1y0Q9E5P7xMVXpBPl1ydew5dWQkdHI032GtxcjenM4akLRqPxfBCJlIP6LZ0qJwK5MeArp5tD7txTVyJkXzTFS4L3qgnnxkYOx0VzAxXd9BRRNUDecO1kErxbL75debKNMMBoFH46n8vUbgROgiRd4RUZMsPmc3tXeLh/T9eGYQhfN1KN7GSLz2ktEW0ey4XZ5L4wriLe5APwC1YIaqlb+JyoaNTzD9907qFtS2WqkxKQTGUWh6k7xKx58Fq9ZYIbgdd80Gureg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5q84uHuvgtulYtOd8vN35ZKtWlhi7h+nnF5tWr5GeWTm2OVUpGeAG90b5gkDjGaiIzgR3l4Lcihe4DnkYdfGF7Ph9NX61USU7J7HLkPjTwdboyc120YmYrY0B7hqueKVI5HVxLIdIemnKux6DnVngvs50YMl0iDCQ+KdapRrArbMs3pTW0ws56L3Qj/47ziOnnadaOKvBjJT8Vd39MuIW5OkaPne1/Pf8LYFgUmefmrUbfShvDit/feabImDvB+oewwkZEkydndvvq0AWyMf89+ftBPmatMf3HQSYGu9LlUK2hmPGUDgk2jOFFV2m4zic+x6im34i73MXFI+U7yVCyj34si+rW/pkkvoBKBJc7IjcoHvn1rGS7qDOEDYXR0S1+WxxgBQRJfyI+OLj7OQnoEtnYerrgioshN++JTJF+z7eJ+8jE+OyGAAr90CJXKCUz6zOqV/jK3cZHenb5gVDlFH0ohQIcjxRxi596IYM0c7OF8UlXxzaOg3nfIQZkw/I4M9sCWEaH4nc5vTpDFoLjFRq2/d88fyuxk73AYte+plVYYtcyPhOQMETtqbkPHjiOAlTeTQYYqYI7vXUzTlMbuiCy/6b7iJHHMVx3Px+WE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95197735-118b-4692-4f49-08df2129abe3
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 08:38:19.5104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dL9mCT2wMDThtNaOtoIBw13AwVicUJMx18oKZ5x6Bygl+PjpCBOP3ayqHJBd1iI1LyZP/d6uHp3CmDijlrv99TanhKUCsBM1ZgBq5tdguHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7680
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2610030034
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfX5QQDf1suFNnF
 dt5lPokno9Tl5FFH/h/Vwl35wbxYgzDfqe1r2Hswzb4+Naa3z/nni28YebW4SlLrHFDcaRrXzOR
 gGzLj/Q4hD9umJ7Kc4mKwVmluf3LINFAbQDOC3SjKdvd4kgLeMXY
X-Proofpoint-ORIG-GUID: 5lTVTn6HrgL5rXv2JZk0xHfBVO3f9QLD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfX4O+Rd13xlPvP
 o8eakCom3ozFUB+l0fcJNusZ1on1tzDHWiiDGRcr/BYg4CZ+AQde80gyCSVjPSvbcfZNASgjS6A
 0bCYUFFaeZglFLhx/hpCWgv5Dkwc+MLLNqHDGtfDkciqJoGhWr/TxSaHAnWiUrcwdaEShZ2a++f
 4N+JC1nddntukuD9Ccl6SThEG1EtiunjLU2DZw2BYbLrghl2gJtW/tpLhI79AMWNNK/whUJeJN8
 YGRJYnzpPjNwsrVoL3+wdKq9WcvYGahtLGQkYolB/Q50DDOE9xETkPoKZ3lindoiMe4IOqJgjlf
 sYIy/hhgwQAyUDuxeElXPUyk0gFLGGH2a3nKRwVTr0tfT+AMOm2jMLBbJJnO6DyxqrZcu+S17/g
 eFstbOi8ZkDxrnka+XVHPmD+XS9ZVUWuDtvD1Xfoqgr+sRodjQRMO06tawUuQQtOlUoa/C8sFAg
 mXnwsF7PEhXCzqIzWiQ==
X-Authority-Analysis: v=2.4 cv=Ys2a1IYX c=1 sm=1 tr=0 ts=6ac0bf07 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8
 a=-ns1qNvnEmm_TH0S-uIA:9 a=rEqNaWj0-quomjz8:21 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 5lTVTn6HrgL5rXv2JZk0xHfBVO3f9QLD

Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 9/28/26 12:01 PM, Kris Van Hees via DTrace-devel wrote:

> 
> Centralize parsing of D scoping markers used by external type and symbol
> references.  The helper now returns the resolved scope and identifier
> pieces, supports kernel and userspace markers for both type and symbol
> lookup, and rejects empty operands, runs longer than two backticks, and
> repeated scoping markers as D_SYNTAX instead of falling through to lookup
> failures.
> 
> Recognize dotted scoped identifiers as a single lexer token so module
> names like foo.bar resolve as one external symbol reference.
> 
> Add lexer and type regression tests for malformed scoped identifiers,
> dotted scopes, empty scope operands, scope-kind mismatches, and scoping
> operators in declarations.  Update the sizeof unknown-symbol test to use
> a non-empty symbol name.
> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  libdtrace/dt_decl.c                           |   6 +-
>  libdtrace/dt_lex.l                            |   5 +
>  libdtrace/dt_parser.c                         | 140 ++++++++++++------
>  libdtrace/dt_parser.h                         |   1 +
>  .../err.D_IDENT_UNDEF.scope-dot-kernel.d      |  19 +++
>  .../err.D_IDENT_UNDEF.scope-dot-kernel.r      |   2 +
>  .../lexer/err.D_IDENT_UNDEF.scope-dot.d       |  19 +++
>  .../lexer/err.D_IDENT_UNDEF.scope-dot.r       |   2 +
>  .../err.D_SYM_BADREF.scope-kernel-as-user.d   |  18 +++
>  .../err.D_SYM_BADREF.scope-kernel-as-user.r   |   2 +
>  .../err.D_SYM_BADREF.scope-user-as-kernel.d   |  20 +++
>  .../err.D_SYM_BADREF.scope-user-as-kernel.r   |   2 +
>  .../err.D_SYNTAX.scope-empty-bare-user.d      |  19 +++
>  .../err.D_SYNTAX.scope-empty-bare-user.r      |   2 +
>  .../lexer/err.D_SYNTAX.scope-empty-bare.d     |  19 +++
>  .../lexer/err.D_SYNTAX.scope-empty-bare.r     |   2 +
>  .../lexer/err.D_SYNTAX.scope-empty-dot-user.d |  19 +++
>  .../lexer/err.D_SYNTAX.scope-empty-dot-user.r |   2 +
>  .../lexer/err.D_SYNTAX.scope-empty-user.d     |  19 +++
>  .../lexer/err.D_SYNTAX.scope-empty-user.r     |   2 +
>  .../unittest/lexer/err.D_SYNTAX.scope-empty.d |  18 +++
>  .../unittest/lexer/err.D_SYNTAX.scope-empty.r |   2 +
>  .../lexer/err.D_SYNTAX.scope-multiple.d       |  19 +++
>  .../lexer/err.D_SYNTAX.scope-multiple.r       |   2 +
>  .../lexer/err.D_SYNTAX.scope-triple.d         |  19 +++
>  .../lexer/err.D_SYNTAX.scope-triple.r         |   2 +
>  test/unittest/lexer/tst.scope-user-explicit.d |  22 +++
>  .../sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d  |   2 +-
>  .../sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r  |   2 +-
>  .../err.D_DECL_SCOPE.scopeop-enumerator.d     |  16 ++
>  .../err.D_DECL_SCOPE.scopeop-enumerator.r     |   2 +
>  .../types/err.D_DECL_SCOPE.scopeop-ident.d    |  19 +++
>  .../types/err.D_DECL_SCOPE.scopeop-ident.r    |   2 +
>  .../types/err.D_DECL_SCOPE.scopeop-member.d   |  16 ++
>  .../types/err.D_DECL_SCOPE.scopeop-member.r   |   2 +
>  35 files changed, 414 insertions(+), 51 deletions(-)
>  create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
>  create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
>  create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
>  create mode 100644 test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
>  create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
>  create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
>  create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
>  create mode 100644 test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty.d
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-empty.r
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-triple.d
>  create mode 100644 test/unittest/lexer/err.D_SYNTAX.scope-triple.r
>  create mode 100644 test/unittest/lexer/tst.scope-user-explicit.d
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
>  create mode 100644 test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r
> 
> diff --git a/libdtrace/dt_decl.c b/libdtrace/dt_decl.c
> index 1f4936dd..68999422 100644
> --- a/libdtrace/dt_decl.c
> +++ b/libdtrace/dt_decl.c
> @@ -233,10 +233,8 @@ dt_decl_spec(ushort_t kind, char *name)
>  	ddp->dd_kind = kind;
>  	ddp->dd_name = name;
>  
> -	if (name != NULL && strchr(name, '`') != NULL) {
> -		xyerror(D_DECL_SCOPE, "D scoping operator may not be used "
> -		    "in a type name\n");
> -	}
> +	if (name != NULL && dt_scope_parse(name, NULL, NULL) < 0)
> +		xyerror(D_SYNTAX, "syntax error near \"%s\"\n", name);
>  
>  	return dt_decl_check(ddp);
>  }
> diff --git a/libdtrace/dt_lex.l b/libdtrace/dt_lex.l
> index fd70aa0a..bf133676 100644
> --- a/libdtrace/dt_lex.l
> +++ b/libdtrace/dt_lex.l
> @@ -50,6 +50,7 @@ static size_t dt_input(char *buf, size_t max_size);
>  RGX_AGG		"@"[a-zA-Z_][0-9a-zA-Z_]*
>  RGX_PSPEC	[-$:a-zA-Z_.?*\\\[\]!][-$:0-9a-zA-Z_.`?*\\\[\]!]*
>  RGX_IDENT	([a-zA-Z_`][0-9a-zA-Z_`]*)|([0-9][0-9a-zA-Z_]*`[0-9a-zA-Z_`]*)
> +RGX_SCOPE_IDENT	[0-9a-zA-Z_][0-9a-zA-Z_]*(\.[0-9a-zA-Z_]+)+``?[0-9a-zA-Z_]+
>  RGX_INT		([0-9]+|0[xX][0-9A-Fa-f]+)[uU]?[lL]?[lL]?
>  RGX_FP		([0-9]+("."?)[0-9]*|"."[0-9]+)((e|E)("+"|-)?[0-9]+)?[fFlL]?
>  RGX_WS		[\f\n\r\t\v ]
> @@ -299,6 +300,7 @@ if (yypcb->pcb_token != 0) {
>  			return DT_TOK_INT;
>  		}
>  
> +<S0>{RGX_SCOPE_IDENT} |
>  <S0,SIDENT>{RGX_IDENT}	{
>  			return id_or_type(yytext);
>  		}
> @@ -728,6 +730,9 @@ id_or_type(const char *s)
>  	int c0, c1;
>  	dt_ident_t *idp;
>  
> +	if (dt_scope_parse(s, NULL, NULL) < 0)
> +		xyerror(D_SYNTAX, "syntax error near \"%s\"\n", s);
> +
>  	if ((s = yylval.l_str = strdup(s)) == NULL)
>  		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
>  
> diff --git a/libdtrace/dt_parser.c b/libdtrace/dt_parser.c
> index e71c0985..1fd0f5b4 100644
> --- a/libdtrace/dt_parser.c
> +++ b/libdtrace/dt_parser.c
> @@ -168,45 +168,96 @@ opstr(int op)
>  	}
>  }
>  
> +/*
> + * Parse the D scoping mark used in external type and symbol names.  A scoped
> + * name can contain one mark only: ` for kernel scope, or `` for user scope.
> + * Longer runs and repeated marks are malformed.  Return the scope kind as 0
> + * for no scope, 1 for kernel scope, or 2 for user scope.
> + */
>  int
> -dt_type_lookup(const char *s, dtrace_typeinfo_t *tip)
> +dt_scope_parse(const char *s, const char **scopep, const char **identp)
>  {
> -	static const char delimiters[] = " \t\n\r\v\f*`";
> -	dtrace_hdl_t *dtp = yypcb->pcb_hdl;
> -	const char *p, *q, *end, *obj;
> +	static const char delimiters[] = " \t\n\r\v\f*";
> +	const char *mark = strchr(s, '`');
> +	const char *scope;
> +	size_t marklen = 1;
> +
> +	if (mark == NULL) {
> +		if (scopep != NULL)
> +			*scopep = DTRACE_OBJ_EXEC;
> +		if (identp != NULL)
> +			*identp = s;
> +		return 0;
> +	}
>  
> -	for (p = s, end = s + strlen(s); *p != '\0'; p = q) {
> -		while (isspace(*p))
> -			p++;	/* skip leading whitespace prior to token */
> +	if (mark[1] == '`') {
> +		marklen = 2;
> +		if (mark[2] == '`')
> +			return -1;
> +	}
>  
> -		if (p == end || (q = strpbrk(p + 1, delimiters)) == NULL)
> -			break;	/* empty string or single token remaining */
> +	if (mark[marklen] == '\0')
> +		return -1;
>  
> -		if (*q == '`') {
> -			char *object = alloca((size_t)(q - p) + 1);
> -			char *type = alloca((size_t)(end - s) + 1);
> +	if (strchr(mark + marklen, '`') != NULL)
> +		return -1;
>  
> -			/*
> -			 * Copy from the start of the token (p) to the location
> -			 * backquote (q) to extract the nul-terminated object.
> -			 */
> -			memcpy(object, p, (size_t)(q - p));
> -			object[(size_t)(q - p)] = '\0';
> +	for (scope = mark;
> +	    scope > s && strchr(delimiters, scope[-1]) == NULL; )
> +		scope--;
>  
> -			/*
> -			 * Copy the original string up to the start of this
> -			 * token (p) into type, and then concatenate everything
> -			 * after q.  This is the type name without the object.
> -			 */
> -			memcpy(type, s, (size_t)(p - s));
> -			memcpy(type + (size_t)(p - s), q + 1,
> -			    strlen(q + 1) + 1);
> +	if (scope == mark)
> +		scope = marklen == 2 ? DTRACE_OBJ_UMODS : DTRACE_OBJ_KMODS;
> +
> +	if (scopep != NULL)
> +		*scopep = scope;
> +	if (identp != NULL)
> +		*identp = mark + marklen;
> +
> +	return marklen;
> +}
> +
> +int
> +dt_type_lookup(const char *s, dtrace_typeinfo_t *tip)
> +{
> +	dtrace_hdl_t *dtp = yypcb->pcb_hdl;
> +	const char *scope, *ident, *start, *obj;
> +	int scopekind;
> +
> +	scopekind = dt_scope_parse(s, &scope, &ident);
> +	if (scopekind < 0)
> +		return dt_set_errno(dtp, EDT_BADSCOPE);
>  
> -			if (strchr(q + 1, '`') != NULL)
> -				return dt_set_errno(dtp, EDT_BADSCOPE);
> +	if (scopekind > 0) {
> +		char *type;
> +
> +		/*
> +		 * If there is no explicit object before the mark, search all
> +		 * kernel or user objects depending on the mark width.
> +		 */
> +		if (scope == DTRACE_OBJ_KMODS || scope == DTRACE_OBJ_UMODS) {
> +			start = ident - scopekind;
> +			obj = scope;
> +		} else {
> +			size_t objlen = (size_t)(ident - scope) - scopekind;
> +			char *object = alloca(objlen + 1);
>  
> -			return dtrace_lookup_by_type(dtp, object, type, tip);
> +			memcpy(object, scope, objlen);
> +			object[objlen] = '\0';
> +			start = scope;
> +			obj = object;
>  		}
> +
> +		/*
> +		 * Copy the original string up to the start of this token
> +		 * into type, and then concatenate everything after the scoping
> +		 * mark.  This is the type name without the object and mark.
> +		 */
> +		type = alloca((size_t)(start - s) + strlen(ident) + 1);
> +		memcpy(type, s, (size_t)(start - s));
> +		memcpy(type + (size_t)(start - s), ident, strlen(ident) + 1);
> +
> +		return dtrace_lookup_by_type(dtp, obj, type, tip);
>  	}
>  
>  	if (yypcb->pcb_idepth != 0)
> @@ -2767,9 +2818,10 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
>  	dtrace_syminfo_t dts;
>  	GElf_Sym sym;
>  
> -	const char *scope, *mark;
> +	const char *scope, *ident, *markstr;
>  	uchar_t dnkind;
>  	char *name;
> +	int scopekind;
>  
>  	/*
>  	 * Look for scoping marks in the identifier.  If one is found, set our
> @@ -2779,18 +2831,16 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
>  	 * Otherwise we set scope to DTRACE_OBJ_EXEC, indicating that normal
>  	 * scope is desired and we should search the specified idhash.
>  	 */
> -	if ((name = strrchr(dnp->dn_string, '`')) != NULL) {
> -		if (name > dnp->dn_string && name[-1] == '`') {
> -			uref++;
> -			name[-1] = '\0';
> -		}
> -
> -		if (name == dnp->dn_string + uref)
> -			scope = uref ? DTRACE_OBJ_UMODS : DTRACE_OBJ_KMODS;
> -		else
> -			scope = dnp->dn_string;
> +	scopekind = dt_scope_parse(dnp->dn_string, &scope, &ident);
> +	if (scopekind < 0) {
> +		xyerror(D_SYNTAX, "syntax error near \"%s\"\n",
> +		    dnp->dn_string);
> +	}
>  
> -		*name++ = '\0'; /* leave name pointing after scoping mark */
> +	if (scopekind > 0) {
> +		uref = scopekind == 2;
> +		name = (char *)ident;
> +		*(char *)(ident - scopekind) = '\0';
>  		dnkind = DT_NODE_VAR;
>  
>  	} else if (idkind == DT_IDENT_AGG) {
> @@ -2810,7 +2860,7 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
>  	 * errno appropriately and that error will be reported instead.
>  	 */
>  	dt_set_errno(dtp, EDT_NOVAR);
> -	mark = uref ? "``" : "`";
> +	markstr = uref ? "``" : "`";
>  
>  	if (scope == DTRACE_OBJ_EXEC && (
>  	    (dhp != dtp->dt_globals &&
> @@ -2902,13 +2952,13 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
>  				xyerror(D_SYM_MODEL, "cannot use %s symbol "
>  					"%s%s%s in a %s D program\n",
>  					dt_module_modelname(mp), dts.object,
> -					mark, dts.name,
> +					markstr, dts.name,
>  					dt_module_modelname(dtp->dt_ddefs));
>  			}
>  
>  			xyerror(D_SYM_NOTYPES, "no symbolic type information "
>  				"is available for %s%s%s: %s\n",
> -				dts.object, mark, dts.name,
> +				dts.object, markstr, dts.name,
>  				dtrace_errmsg(dtp, dtrace_errno(dtp)));
>  		}
>  
> @@ -3014,7 +3064,7 @@ dt_xcook_ident(dt_node_t *dnp, dt_idhash_t *dhp, uint_t idkind, int create)
>  
>  	} else if (scope != DTRACE_OBJ_EXEC) {
>  		xyerror(D_IDENT_UNDEF, "failed to resolve %s%s%s: %s\n",
> -		    dnp->dn_string, mark, name,
> +		    dnp->dn_string, markstr, name,
>  		    dtrace_errmsg(dtp, dtrace_errno(dtp)));
>  	} else {
>  		xyerror(D_IDENT_UNDEF, "failed to resolve %s: %s\n",
> diff --git a/libdtrace/dt_parser.h b/libdtrace/dt_parser.h
> index d74d658a..b9149220 100644
> --- a/libdtrace/dt_parser.h
> +++ b/libdtrace/dt_parser.h
> @@ -211,6 +211,7 @@ extern dt_node_t *dt_node_tstring(dt_node_t *, uintmax_t);
>  extern dt_node_t *dt_node_link(dt_node_t *, dt_node_t *);
>  extern dt_node_t *dt_node_cook(dt_node_t *, uint_t);
>  extern void dt_cook_taint_alloca(dt_node_t *, dt_ident_t *, dt_node_t *);
> +extern int dt_scope_parse(const char *, const char **, const char **);
>  
>  extern dt_node_t *dt_node_xalloc(dtrace_hdl_t *, int);
>  extern void dt_node_free(dt_node_t *);
> diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
> new file mode 100644
> index 00000000..2a267567
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Dotted kernel module scopes lex as a single external symbol
> + * reference.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(foo.bar`baz);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
> new file mode 100644
> index 00000000..89a9f9c5
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot-kernel.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar`baz: Module is no longer loaded
> diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
> new file mode 100644
> index 00000000..6b3dcfda
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Dotted userspace module scopes lex as a single external symbol
> + * reference.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(foo.bar``baz);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
> new file mode 100644
> index 00000000..7734e29f
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_IDENT_UNDEF.scope-dot.d: [D_IDENT_UNDEF] line 17: failed to resolve foo.bar``baz: Module is no longer loaded
> diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
> new file mode 100644
> index 00000000..d332191b
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d
> @@ -0,0 +1,18 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Kernel symbols cannot be referenced using userspace scoping.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(vmlinux``major_names);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
> new file mode 100644
> index 00000000..718b2b31
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYM_BADREF.scope-kernel-as-user.d: [D_SYM_BADREF] line 16: kernel module 'vmlinux' symbol 'major_names' may not be referenced as a user symbol
> diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
> new file mode 100644
> index 00000000..bc7e8b9f
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d
> @@ -0,0 +1,20 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: testprobe */
> +
> +/*
> + * ASSERTION: Userspace symbols cannot be referenced using kernel scoping.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(&testprobe`main);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
> new file mode 100644
> index 00000000..87169597
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYM_BADREF.scope-user-as-kernel.d: [D_SYM_BADREF] line 18: user module 'testprobe' symbol 'main' may not be referenced as a kernel symbol
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
> new file mode 100644
> index 00000000..d7cff89f
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: A bare userspace D scoping operator with an empty identifier is a
> + * syntax error.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(``);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
> new file mode 100644
> index 00000000..8e9cd1ff
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-bare-user.d: [D_SYNTAX] line 17: syntax error near "``"
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
> new file mode 100644
> index 00000000..44b4f60e
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: A bare D scoping operator with an empty identifier is a syntax
> + * error.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(`);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
> new file mode 100644
> index 00000000..bbba5fe8
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-bare.d: [D_SYNTAX] line 17: syntax error near "`"
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
> new file mode 100644
> index 00000000..5ead7b3e
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: A dotted userspace D scoping operator with an empty identifier is
> + * a syntax error.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(foo.bar``);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
> new file mode 100644
> index 00000000..b07c07b1
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-dot-user.d: [D_SYNTAX] line 17: syntax error near "bar``"
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
> new file mode 100644
> index 00000000..d3a927d7
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: A userspace D scoping operator with an empty identifier is a
> + * syntax error.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(bar``);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
> new file mode 100644
> index 00000000..dbf319ea
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty-user.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty-user.d: [D_SYNTAX] line 17: syntax error near "bar``"
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty.d b/test/unittest/lexer/err.D_SYNTAX.scope-empty.d
> new file mode 100644
> index 00000000..e32b3812
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty.d
> @@ -0,0 +1,18 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: A D scoping operator with an empty identifier is a syntax error.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(foo`);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-empty.r b/test/unittest/lexer/err.D_SYNTAX.scope-empty.r
> new file mode 100644
> index 00000000..d78728b2
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-empty.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-empty.d: [D_SYNTAX] line 16: syntax error near "foo`"
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-multiple.d b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
> new file mode 100644
> index 00000000..5e236c45
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: Multiple D scoping operators in one identifier are a syntax
> + * error.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(foo``bar``baz);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-multiple.r b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
> new file mode 100644
> index 00000000..cefc56ad
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-multiple.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-multiple.d: [D_SYNTAX] line 17: syntax error near "foo``bar``baz"
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-triple.d b/test/unittest/lexer/err.D_SYNTAX.scope-triple.d
> new file mode 100644
> index 00000000..41f7391c
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-triple.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: More than two consecutive D scoping operator characters are a
> + * syntax error.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(foo```bar);
> +	exit(0);
> +}
> diff --git a/test/unittest/lexer/err.D_SYNTAX.scope-triple.r b/test/unittest/lexer/err.D_SYNTAX.scope-triple.r
> new file mode 100644
> index 00000000..4474c502
> --- /dev/null
> +++ b/test/unittest/lexer/err.D_SYNTAX.scope-triple.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/lexer/err.D_SYNTAX.scope-triple.d: [D_SYNTAX] line 17: syntax error near "foo```bar"
> diff --git a/test/unittest/lexer/tst.scope-user-explicit.d b/test/unittest/lexer/tst.scope-user-explicit.d
> new file mode 100644
> index 00000000..2d649f6f
> --- /dev/null
> +++ b/test/unittest/lexer/tst.scope-user-explicit.d
> @@ -0,0 +1,22 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/* @@trigger: testprobe */
> +/* @@runtest-opts: -e */
> +
> +/*
> + * ASSERTION: Explicit userspace module scoping resolves as a userspace
> + * external symbol reference.
> + */
> +
> +#pragma D option quiet
> +
> +BEGIN
> +{
> +	trace(&testprobe``main);
> +	exit(0);
> +}
> diff --git a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
> index 56c93d43..4de9322d 100644
> --- a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
> +++ b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d
> @@ -16,6 +16,6 @@
>  
>  BEGIN
>  {
> -	printf("sizeof(`): %d\n", sizeof(`));
> +	printf("sizeof(`unknown_symbol): %d\n", sizeof(`unknown_symbol));
>  	exit(0);
>  }
> diff --git a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
> index 462469b7..0f46ad1e 100644
> --- a/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
> +++ b/test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.r
> @@ -1,2 +1,2 @@
>  -- @@stderr --
> -dtrace: failed to compile script test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d: [D_IDENT_UNDEF] line 19: failed to resolve `: Unknown symbol name
> +dtrace: failed to compile script test/unittest/sizeof/err.D_IDENT_UNDEF.UnknownSymbol.d: [D_IDENT_UNDEF] line 19: failed to resolve `unknown_symbol: Unknown symbol name
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
> new file mode 100644
> index 00000000..51068c20
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: D scoping operators are not permitted in enumerator names.
> + */
> +
> +#pragma D option quiet
> +
> +enum scopeop_enum {
> +	foo`bar
> +};
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
> new file mode 100644
> index 00000000..06ef912b
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-enumerator.d: [D_DECL_SCOPE] line 15: D scoping operator may not be used in an enumerator name (foo`bar)
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
> new file mode 100644
> index 00000000..6042e208
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d
> @@ -0,0 +1,19 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: D scoping operators are not permitted in declaration names.
> + */
> +
> +#pragma D option quiet
> +
> +int foo`bar;
> +
> +BEGIN
> +{
> +	exit(1);
> +}
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
> new file mode 100644
> index 00000000..7b2e6797
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-ident.d: [D_DECL_SCOPE] line 14: D scoping operator may not be used in a declaration name (foo`bar)
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
> new file mode 100644
> index 00000000..5fe36a00
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d
> @@ -0,0 +1,16 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2026, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: D scoping operators are not permitted in struct member names.
> + */
> +
> +#pragma D option quiet
> +
> +struct scopeop_struct {
> +	int foo`bar;
> +};
> diff --git a/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r
> new file mode 100644
> index 00000000..978ef79d
> --- /dev/null
> +++ b/test/unittest/types/err.D_DECL_SCOPE.scopeop-member.r
> @@ -0,0 +1,2 @@
> +-- @@stderr --
> +dtrace: failed to compile script test/unittest/types/err.D_DECL_SCOPE.scopeop-member.d: [D_DECL_SCOPE] line 15: D scoping operator may not be used in a member name (foo`bar)
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 

