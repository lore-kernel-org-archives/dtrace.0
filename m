Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8055F2673AF
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103408; cv=fail; b=qyKJ7AT+V8bD50BueRL/RYv9iVaoJxJOkXlb9GforWHmImQcCohpM8TokwfaaPkux0jbo5Lohm2oa3a1lTfZ7aUlJ715AE561AcrVNEjvHbX+snffJwx4KXOnjTv9mmLTAlRtunuw8UOjG1Sd+QnMUqXEa/0gCq9n9yOjXKN/Wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103408; c=relaxed/simple;
	bh=5zbCIZMHyZ64RVybtTxy01Xvw5k14izld4FeYmFBSVk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Su1sfAmCtX0rRHC3krtAc4tuV204c6d+WrKyJmRSY4x4mSGRDhsNV6uWKF2n5OuSCTpKtoas+TPQMKzEuqmgX5hdMGEVPmLhRU5ZgfckiSqEQR8Ce/Nh572BleaafOXOeKl2CUirRI7YANO8e4F6iaCQtXH1zyDV4oInu/NyZNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X/mo8RNi; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ndeFNhFO; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X/mo8RNi";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ndeFNhFO"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3NOOb010848
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=s/SYd5Kcegdq1NK26tBJmSafJVDuNNWocMznHBHo77g=; b=
	X/mo8RNiOpaspQHWxzd4kDt9IOmb0Tez7718mL/LZLqs/0CBwuc/csa4MwcZrZTy
	QPVd/D9vGCIJ/iepsdolfjYRiXl/eAawczMdYJrkuvWUYKVzuB8qvHTuIT54YSfT
	TLugUexAv1r7yykiTQ5x+5auWSDMz8hqcEYjnOG7VFS7mhnQxpy5wIC3Lusprnm7
	51Td7Rq828uUQvBiDPH5pB7eE4ZdJehKmCuN31Un5k7bkjYC3cH5IcpuSaXRscJq
	HXM17YC3W+Ht6ZlY6gMyO4UCau/P904Wt7vIfN3ycRKu2QBXfZafkrqsNk7vc52+
	BRNLSurPuljOG7K3jPGfmg==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49v2ypxsuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59M22P7j025454
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:23 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49v1bcmj4k-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 22 Oct 2025 03:23:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WRgxRakyelG23eso2BOaRWPsUPlNooZVJDDtuUAn2vfmLQt9vdH50xcWU9T7f6I5pSh9ofAHK6z4ZzbHVtIvwjz2xfp2J2m6ep0IlmuZ5QyatP0n0zTfUJMbgS7Xo60cmOaozb3ssZahM2X0LFlmww4eXL7ydNSZrgNmdDTkw/8xLly8cJNQ88dLhLqeLhy/rjWIvqqaeneHHJ9bf0iRvVqMZJTAQ2CTaQ7Gn8TSmVFwNejvToVNQxdd5X6N4iJ1cbsOwnyxqVY4uCp4/Zdqdhj6pVh41VuDWvlDdSpsOuUHovyEWo3CT3V27pEiIapt3Q4mmybCaMp8DQPLQx42Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/SYd5Kcegdq1NK26tBJmSafJVDuNNWocMznHBHo77g=;
 b=pn2Ye93S0HRHIgBpqUHDFVfIwGKUj3RcdPR0qPrv8Ur/0/85zOs4d8dSMSylCoukBTCyoT+qb9a++y4FDWC9ksW4r+9Lxzevsgze7nAWI9kLVKMhvwBg5nZQYp9RqTeVPofmR+BRzUD1vvjgX5wHsWLU0vpPfa7Dyl9yQz6KkIJ2qyFOzpAKefh8BF/RmoFUfwsvk8b1P/3YyQBaUzH2/JwWokpy5r7y9ypQJ8LBkNjyYha3QRt6kzoQ/WDQZi6fqnegYv8jZQ4i2OsDreGJTwkDNzFOk35WqjsAJzuVVWQFHr7LhvGZkPiku1+XDeV5zAkKe1zKy4pTIRgIm3PhkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/SYd5Kcegdq1NK26tBJmSafJVDuNNWocMznHBHo77g=;
 b=ndeFNhFOOVyUZpVNDcgSG2RwVX98XOn0Psey/ot5u6rubJ70YJPHvCX5AlE8g6Hdcjd8YwO/XK4UR68Y5dl2TlZOJQ6mXEGyWiWgiYDSLa6baXCCFXzwRMXlLjTlhfsiEgH081Ds8CkaUtMisJUxl0NhrpYlwhYsVQTPg+Rh3nM=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Wed, 22 Oct
 2025 03:22:59 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 03:22:59 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 09/20] doc: Fix anchor links for providers
Date: Tue, 21 Oct 2025 23:22:39 -0400
Message-Id: <20251022032251.2010-4-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20251022032251.2010-1-eugene.loh@oracle.com>
References: <20251022032251.2010-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd86f20-7587-4da2-4f99-08de111a4d3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2dOeCtIcE9qb2djK09VZTZKSFUxejNEdlYyd2RTdVVmT0oxa3NzSFg4dFE5?=
 =?utf-8?B?SW11OHFXelpYNC9KOWR4MG5Wc1hFS2s0WUgxUWhmU3dFSzFRUEV4MzZWNkxq?=
 =?utf-8?B?N2VDQ0l4YktVZ1VBdlJuNHBLSlN1VllPZkVIUW4raGxPbUNqME9BNWN6ZzQr?=
 =?utf-8?B?bXNodGlWemRJcy9xSmdyQmxIb2hvTUxQZWU5aGZRalFyMHhDbGM5cW9GTnRi?=
 =?utf-8?B?dnZJRDV0YXZzWUw2UlhjTmJxOTlIMWRlVHUrN2N3MktKNjZna0ZnMjdwSjZa?=
 =?utf-8?B?N1Z6NlM0QytYTVZUUVFlQ3FLbWFKK0t2eUFyUzZqRWM1MjhpOGVwTXlkKzg3?=
 =?utf-8?B?SjdsbFZsQ0h0NldYdHF1ZC9vTXo0TkVGdHgwRVJ1K0x1Ukt4cUtZdzlPZTda?=
 =?utf-8?B?a1ZaYVFSVGpWOGlQRGlTUEFtSFRUVHhERVJKY0crcStjWFc4QllPbzN2djVm?=
 =?utf-8?B?SVZNTitHajhtWlB5bHhCNDZvemphbHBodmRzbU1HeDJ2N0Nubmg4Vk5YYzk3?=
 =?utf-8?B?bkZmZ2hvbzg4VXcydmlCMzgyaU9MbDl0RGlXZUhrTXJZS3NydjJMMzgzVGxF?=
 =?utf-8?B?SlppMmZrOUFYWXBYU08wWnlxQ0tacVpzRzlDOXJKS05KSXo5YkJDOUtDWWdQ?=
 =?utf-8?B?bUs0SlQ5K05GbFRaOEdmejBSRTFIdW5Zd3Q5WVVmWE5TVFVVYWpkQTJUMHRO?=
 =?utf-8?B?L2VvTklsUWRtR2tWV1JoY2xSckpyN1ZJN0V5UmM0Z3NaaWVaay81b2JWamta?=
 =?utf-8?B?dGE1TVJxQmQ4TmZoMms3WUtXR2hlNE01UG93MkVES1pIOThBdk1iUlRoNHlU?=
 =?utf-8?B?MFZUTUxKeUVkaHN0b3RLQWRCMnFYRU1QcmFwSXdvcTV4K1doWGZob0pyZG5p?=
 =?utf-8?B?N1h6Qm5BcjI2bnJlUHljWlJIZE5IOFF1UEpmUy9HOUxISkd6WnhhblhFRVlp?=
 =?utf-8?B?L1kxeGdXQUNIbEVETFg0MTIyMnZsSkhxUjdtLzlmUmF3bWI3NlJXdFFkVlNm?=
 =?utf-8?B?WmZyaTJndlYzVEhGU2o1cDJ4THl3MVpPZEtFbkkzZ1IzU3ZDUy9KbHdGRHVp?=
 =?utf-8?B?N3h2b1pJR0FIRnNoMWNpZTlRNWJoUWdBQTJhVzNkZHBlL2NhVWE5Q1VLcUMz?=
 =?utf-8?B?RzEzVll1MFJ2NkVjM2lNWFR4VnhUR3gyVGg5TWFvcmtrNUJJNHlMaTU2S09G?=
 =?utf-8?B?c3U5UVBZUERqQlRVREVtUXlXbWlFcGp0V3VSZVpJMUliTEJPNW1KeTFJODVF?=
 =?utf-8?B?N0dTT1NTeXJHQ0NWWWR5NXhybnNVVlp4bU94cWZUaWxUN2ZHQ016d2I2UEcw?=
 =?utf-8?B?ejF6MVhkZTh2U0JWSU5SY1JybVRabXBqQnNFc1p0R1J4N1JtQ3VJLzM4d1FY?=
 =?utf-8?B?Z08rVlQrRUlMSGpGS0o4dkxxN0xrUDFOTjkyVDNaelNPYXhhdkdvNlVMZ0Zj?=
 =?utf-8?B?UkwwTXFCZGtKYXRlUzdNWUtTWU1MR1g4SCtOYWE4QklyMEZGV0RwazRjeVBO?=
 =?utf-8?B?VW1LaEd5U3p0SnVEUUd4WXN3VjF1eENtbURTRzlZc3paRjdmRVFoRHR3MFYr?=
 =?utf-8?B?WVVIK0ZTdFpyM2lIU0Q5Tm1vSm95M1c3RERpbnFWM2lRSW9ON0hqcTZJekFC?=
 =?utf-8?B?NXFFRFRXM1ZHdXhGblErSmVkT2N3Z2VYSGRtSmJHdHhaQmhHMUk1cEpMYldY?=
 =?utf-8?B?YXhWZmp4K0krNWM4bTh3THVWTFNSeE9NR3diWFVDNEY0ZFhRNEoxVHpsRWJN?=
 =?utf-8?B?bHBvM2hhWGpkTGpQeXpkUEI3UVJmVWdYdCt5TXRUNzZKc2hoSEtNSWdZUDlG?=
 =?utf-8?B?ZzY4KzRTNGQwZlVpNkpaQTMySGsrZzBDMnVSNkhtSUtaOFIwV1ZpbmMrWEZC?=
 =?utf-8?B?Vm0wdjlkLzRrTjRrdVM1TkxoZnlOeWE3T2Z6T2JJeXd1ZUxDc3UzOUtPZjBB?=
 =?utf-8?Q?7esvZup1zn2JAih/kBs0ibJDNvgwu12r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NDdZVmJNWXR6ZE1aMmxQOVh0TVJkV29rNm1qdkI2dWJHem5OdEZJV2NWZWox?=
 =?utf-8?B?NC9GalY0WTdJUVVTTFllM21LSW0yaFhzYmRub0dNMHkzUm1GbVJObFo3aXRw?=
 =?utf-8?B?UVdscTZuKzdLYU1INWFoZUFWZ3Ric1U5R0h3cVRBWGVpdHpVcGtxbmdxYlFw?=
 =?utf-8?B?U3gyYWhCcVlLLzRqam43Um02M080OXZPc3pCSjBTTWgxMjNRYmU2YlAyMlVj?=
 =?utf-8?B?SFp0VG53amp6aW5Ic0hPOER5SUQ4N21scEZKT0FrOEw3Q1djVjFDQ1BUWXpS?=
 =?utf-8?B?V0ZKb1h3TjRsQjhCQXpTckl1TUdvT3N0OVpjazYyU3BpdkpDVXBPdmpZWkJE?=
 =?utf-8?B?QmhuNW1VZTRBWTVLenMyK3lDdENYbnQ2MUgzc0ZnZGNqQ1k1OTRCNXMraHFi?=
 =?utf-8?B?QkR6SVkxSW1UY2pkSVlpVjdqcUZJd2FEazdkWE1sdllROWV3UHJpMnFvZi82?=
 =?utf-8?B?QnVGaDJUK1hZR2N4SXdCQzNXTmFVOVEra012VDNUem1hV0pJZTVzUXBRT2Zu?=
 =?utf-8?B?ampXZDk3KzlSaC93Q3p0aWJBdHhaNy92eFE5ZHVtWHRLekk2NjdhZE9TQ0dE?=
 =?utf-8?B?S3RodXpVWVQvZlUzUkFuUmNwRVFXQW1CR2FKOVRMSWMzOU5VakNpL3M5dkxT?=
 =?utf-8?B?eUNpelpKMEZaeWJlaUgzMnZpTEVMQU9hZlJEL1JwdlRXWWhWMG1lOGU2bFdF?=
 =?utf-8?B?enBhVUZ1c3Z1cEFSeEZ6TFNJVS8zRysreE1sM3dzeXZ2N2JpSzc3K0hZVXcx?=
 =?utf-8?B?RCtjazNtc3ZTL0o2dVAyTHRITUdlYUFkK2Q5OGE1ZHdFbkMyRmh1SVhPRUxs?=
 =?utf-8?B?QUV4YlcreVFVYmJiMmkzR3BsZDZoL3NrU2ZBeVBNNklxbi9RU0Fnc1ZxR3Zl?=
 =?utf-8?B?Vk1QdGJsY3V0SjZXdkFBbnE5dWY1TDFQQWVDUWFJSEtya0dDa21LcTVpTlZL?=
 =?utf-8?B?ZHVqQVp4Uk96MENSNVpHRWRDVktaODRidWdBYTZpdUlEaFQxd3ZsN1k1N1VQ?=
 =?utf-8?B?MFpybXVXUjNIODcvdUYvdFJhcXE1UnFTd2JONitNWFREUzhOSTZxUWh3ZCt0?=
 =?utf-8?B?RDd3dThEeFpadEJpaWFvMlJEWFFCeHhJNCtEZmNucUdoM0N3SEVPTG5sTGQr?=
 =?utf-8?B?Q3JXam55YzFPMGpCbzVCTGhRNUJ1Q1YwQkYxR3Z2M0RtZkdSL1BySjRITnhV?=
 =?utf-8?B?S1RudExlSXY0SE5leVk3cjV2YW4yeHBIb2VIaTdrZkljS0lBR3F4VEkzK21x?=
 =?utf-8?B?Q3l0ZUZ1aWZCZ3FKRWlIR2RpR1RYekNlQldONi9QRkd4OXRrK29tcmFGM2hx?=
 =?utf-8?B?dFNQeU1oZWd2UzRETTcxN3FQbW53SmM0VWxGWElMRDZ5LzM2TlE1bGRpZWJ1?=
 =?utf-8?B?Z1p6bk1TWGNsVHg2cEUrZHJ5RHFtb1Y2dWY4bTJLVDArTzV1dkxYaDZyTGh4?=
 =?utf-8?B?QUFRdTBRYzhOaDZuS3BzUElzVkJBSjh4ZlF0RzVPdlJORnhDWFE2UFdNSUJz?=
 =?utf-8?B?V2hqZ2JqcnZORWpscE8yVWFGRjRVQ1VCQ2FoMmpXbHlhSDgxdm9Ea3oxNVFa?=
 =?utf-8?B?bFZoR0JqQTNRVU1GaXJ3WTBReThyZjVLU25mTjY5bTZ6aTNGWWhMa2RhOTBo?=
 =?utf-8?B?MDlXVHg5WGtzd2liajJmbDA2N0xsWjgwYlhQSzB4YmZscHlObUlXR2JMK1JJ?=
 =?utf-8?B?Ykh2NDV4TlJVNWs1NzNrSER6R3kvd3Exb3NxOWJLSGc4UzE5b0Y2S0NkRzQ1?=
 =?utf-8?B?MTRIWldwLzludHA0S2xlOG5JT2VodjU5Y2pQVlJ0VTJyODV4QWVjT1JGR1oy?=
 =?utf-8?B?bjdtTWxHdXA0RDJBTm1kZVNnUVR0YUZ4QWpYakR0bjNjd1pBWHFrdytJMkM1?=
 =?utf-8?B?c1lleEQzaWo3UlFidHBLcmZUYlRGeTJVb3AvYlZzSjZRbVFPdnBWVGZBL0tu?=
 =?utf-8?B?L0MwSVFUWTYzZTVpT2FCVGFKejFQRjJzNGJUMGNVekxzMFBFZlB1ZGtZczk2?=
 =?utf-8?B?aGszTkhrMkNWZ0ZnVjg2UUNkSUJhazlmTitZdjdudnBobno4NnRxajNJMkdN?=
 =?utf-8?B?cnFZNUlJb2hNVlgzQWt3cjNESWlQQmdUdUlxNVU1ZzY5WG1Pdkk3S2NwWHRo?=
 =?utf-8?Q?FcAhwYsT8LWqBvhbFSSxo5j+c?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Nm7hK932EsTJXpgd5bLascsSBLm3cBvypR03e7q2Sj73+dHjz7swCIx8hsej+4hNlQZKyIvU6T2q18z17hIzAF609qLu7soUHmP2uZM0efOw7YwkHA+US4RYjlNCrmmwvdr5r/QDrnv2crdu3B9nnpji6pdLsDcv8Pe6kyD5IpJwVaeDsk7dfGDS3cCF7SqJ8TkrcbamxZY1QBQs8J9ZAI3aNfXvwjd+taomnLaUz7jwV/rWEt97owmoFg1PCNv9zgn6HEVdk50Lpm3qcgsKU1G1tIsIgh0Lh2VJ/IkMjzIcNA4y+0RnOD1lnwFvYZz2B9Az1ASc3jW0UTfWuIA0n7fPD+z0XyKraBBkOeE4eLKEiaA/eVN9qxctRKFqYPOCuj3MY6QYjD9Fw6gXhugl6RE0p1YBkSWCwgAw0MJhC4itdgUFC21knvX+4FfomWFay/UFMOsSt7Ttx+fczFddG81GNUuDN0bJj8xnbBzSP9lZkP6c28tE5Ub5ML0HPkaxX5eJvqRtvKzw9xV0Z55VgB4tRQC0c66kB4+J7wI+VwEgg2933+lv+cUqecqtrYwsqNbYr/iZqq3mk3bJMcmsfRYjEc0vtoWfkKndGFlXjmo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd86f20-7587-4da2-4f99-08de111a4d3a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 03:22:59.7523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qvq9hapba+CmVrLHTr4tS8zNkzYdsM/v8oLLHX5FQ5Spo7qjRAAE4oM3eHaYdpLrhq7VslkZFr2CmYcoe7WHAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6974
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510220025
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX13xXcnIsHMwr
 IHruSIVh46kC5L3UEcAWmUXT9UHwKm2awzJEmUn7nXqcxTyEem0NCsN09LMMLqfsgaKMKolKjHm
 cG6orKxLXWBMtwxLew/samqauQ09JHE7rGJIlTZQxlEcjiELHU2jKSepKY0r6xDwgGerSWnLrb4
 Q1/4k2JQzvCd+77+SKQbyNa5bMp9KdInzGxLmHb/dN1R7lJUcmv4EsMv4z2qJM7fZj6lIEjWsU/
 iBzHRSudo0rpWnN+1TkACzCZY98TkltThyBQdUP/pSWq6LrCCTA8wkIWqZsZEpPUs06ch4JSiQ4
 Cy3E04F8gtzdi0pb85th8wD8R1ScWwe5Ce25L0MpiXY54JXelkZ2FEHKXToY4DdezLmOPPnvK5E
 nzOImwbE+kSYZdDXfcE/SQgiBP0stg==
X-Proofpoint-GUID: m7qxJjbHSFaIhTmJHQMDogoGehY32LSh
X-Authority-Analysis: v=2.4 cv=Db8aa/tW c=1 sm=1 tr=0 ts=68f84e2c cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=XdSJ5s3OWavoLpNdR0QA:9 a=R9yh0YoDam0GcCW_:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: m7qxJjbHSFaIhTmJHQMDogoGehY32LSh

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 ...StaticallyDefinedTracingofUserApplications.md | 10 +++++-----
 doc/userguide/reference/dtrace_providers_cpc.md  | 10 +++++-----
 .../reference/dtrace_providers_dtrace.md         | 10 +++++-----
 doc/userguide/reference/dtrace_providers_fbt.md  | 10 +++++-----
 doc/userguide/reference/dtrace_providers_io.md   | 16 ++++++++--------
 .../reference/dtrace_providers_lockstat.md       | 10 +++++-----
 doc/userguide/reference/dtrace_providers_pid.md  | 10 +++++-----
 doc/userguide/reference/dtrace_providers_proc.md | 14 +++++++-------
 .../reference/dtrace_providers_profile.md        | 12 ++++++------
 .../reference/dtrace_providers_rawtp.md          |  4 ++--
 .../reference/dtrace_providers_sched.md          | 14 +++++++-------
 doc/userguide/reference/dtrace_providers_sdt.md  | 10 +++++-----
 .../reference/dtrace_providers_syscall.md        |  8 ++++----
 13 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
index 7548bad83..e8298dea8 100644
--- a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
+++ b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
@@ -1,5 +1,5 @@
 
-# USDT Provider {#dt_ref_usdt_prov}
+# USDT Provider <a id="dt_ref_usdt_prov">
 
 Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
 
@@ -9,7 +9,7 @@ USDT is for user space processes. For kernel modules, statically defined tracing
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## Defining USDT Providers and Probes {#dt_ref_usdtprobes_prov}
+## Defining USDT Providers and Probes <a id="dt_ref_usdtprobes_prov">
 
 Define USDT providers and probes in a `.d` file that you add to the source code. For example, a file `myproviders.d` contains:
 
@@ -37,7 +37,7 @@ The following example traces all processes with `myprov` probes, even if they ha
 sudo dtrace -Z -n 'myprov*:::my-put { printf("put %d %d\n", arg0, arg1); }'
 ```
 
-## Adding USDT Probes to Application Code {#dt_ref_usdt_probe_add_prov}
+## Adding USDT Probes to Application Code <a id="dt_ref_usdt_probe_add_prov">
 
 Consider this C code `func.c`:
 
@@ -66,7 +66,7 @@ You can place probes in the code, referring to the probes by using the macros, w
 
 An optional optimization is to test if a probe is enabled. While the computational overhead of a disabled DTrace probe is often similar to a few no-op instructions, setting up probe arguments can be expensive. In this example, `bar(1111)` and `bar(2222)`might be costly function calls. Therefore, for each probe, DTrace also supplies an `is-enabled` macro, named by appending `_ENABLED`. In the example, `MYPROV_MY_PUT_ENABLED()` for the `my-put` probe, to help minimize the cost of any work associated with disabled probes.
 
-## Building Applications With USDT Probes {#dt_ref_usdt_build_prov}
+## Building Applications With USDT Probes <a id="dt_ref_usdt_build_prov">
 
 The `dtrace` command becomes part of the build procedure, which can be thought of in four parts:
 
@@ -101,7 +101,7 @@ The `dtrace` command becomes part of the build procedure, which can be thought o
     ```
 
 
-## USDT Examples {#dt_ref_usdtexamples_prov}
+## USDT Examples <a id="dt_ref_usdtexamples_prov">
 
 1.  Create a file `myproviders.d` that contains:
 
diff --git a/doc/userguide/reference/dtrace_providers_cpc.md b/doc/userguide/reference/dtrace_providers_cpc.md
index 39b2ca6f5..742fd001b 100644
--- a/doc/userguide/reference/dtrace_providers_cpc.md
+++ b/doc/userguide/reference/dtrace_providers_cpc.md
@@ -1,5 +1,5 @@
 
-# CPC Provider {#dt_ref_cpc_prov}
+# CPC Provider <a id="dt_ref_cpc_prov">
 
 The CPU performance counter \(`cpc`\) provider makes available probes that are associated with CPU performance counter events.
 
@@ -11,7 +11,7 @@ Start with higher event counter values for CPC probes and reduce them through tr
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## cpc Probes {#dt_ref_cpcprobes_prov}
+## cpc Probes <a id="dt_ref_cpcprobes_prov">
 
 Probes made available by the `cpc` provider have the following probe description format:
 
@@ -29,7 +29,7 @@ The definitions of the components of the probe name are listed in table.
 
 Note that when you list CPC probes, example count values are provided in the probe listings. The count values are artificially set high as a guideline.
 
-## cpc Probe Arguments {#dt_ref_cpcargs_prov}
+## cpc Probe Arguments <a id="dt_ref_cpcargs_prov">
 
 The following table lists the argument types for the `cpc` probes.
 
@@ -40,7 +40,7 @@ The following table lists the argument types for the `cpc` probes.
 
 As the descriptions imply, if `arg0` is non-zero then `arg1` is zero; if `arg0` is zero then `arg1` is non-zero.
 
-## cpc Examples {#dt_ref_cpcexamples_prov}
+## cpc Examples <a id="dt_ref_cpcexamples_prov">
 
 The following example illustrates the use of a probe published by the `cpc` provider.
 
@@ -56,7 +56,7 @@ cpc:::cycles-all-50000000
 
 ```
 
-## cpc Stability {#dt_ref_cpcstab_prov}
+## cpc Stability <a id="dt_ref_cpcstab_prov">
 
 The `cpc` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_dtrace.md b/doc/userguide/reference/dtrace_providers_dtrace.md
index ef62c5040..cfe485848 100644
--- a/doc/userguide/reference/dtrace_providers_dtrace.md
+++ b/doc/userguide/reference/dtrace_providers_dtrace.md
@@ -1,5 +1,5 @@
 
-# DTrace Provider {#dt_ref_dt_prov}
+# DTrace Provider <a id="dt_ref_dt_prov">
 
 The `dtrace` provider includes several probes that are specific to DTrace itself.
 
@@ -7,7 +7,7 @@ Use these probes to initialize state before tracing begins, process state after
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## BEGIN Probe {#dt_ref_begin_prov}
+## BEGIN Probe <a id="dt_ref_begin_prov">
 
 The `BEGIN` probe fires before any other probe.
 
@@ -34,7 +34,7 @@ syscall::mmap:entry
 
 The `BEGIN` probe fires in an unspecified context, which means the output of `stack` or `ustack`, and the value of context-specific variables such as `execname`, are all arbitrary. These values should not be relied upon or interpreted to infer any meaningful information. No arguments are defined for the `BEGIN` probe.
 
-## END Probe {#dt_ref_end_prov}
+## END Probe <a id="dt_ref_end_prov">
 
 The `END` probe fires after all other probes.
 
@@ -64,7 +64,7 @@ As with the `BEGIN` probe, no arguments are defined for the `END` probe. The con
 
 The `[exit](function_exit.md)` function causes tracing to stop and the `END` probe to fire. However, a delay exists between the invocation of the `exit` function and when the `END` probe fires. During this delay, no further probes can fire. After a probe invokes the `exit` function, the `END` probe isn't fired until DTrace determines that `exit` has been called and stops tracing. The rate at which the exit status is checked can be set by using `statusrate` option.
 
-## ERROR Probe {#dt_ref_error_prov}
+## ERROR Probe <a id="dt_ref_error_prov">
 
 The `ERROR` probe fires when a runtime error occurs during the processing of a clause for a DTrace probe.
 
@@ -311,7 +311,7 @@ None.
 </td></tr><tbody></table>
 If the actions that are taken in the `ERROR` probe cause an error, that error is silently dropped. The `ERROR` probe isn't recursively invoked.
 
-## dtrace Stability {#dt_ref_dtstability_prov}
+## dtrace Stability <a id="dt_ref_dtstability_prov">
 
 The `dtrace` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_fbt.md b/doc/userguide/reference/dtrace_providers_fbt.md
index 885d59230..295a21d83 100644
--- a/doc/userguide/reference/dtrace_providers_fbt.md
+++ b/doc/userguide/reference/dtrace_providers_fbt.md
@@ -1,5 +1,5 @@
 
-# FBT Provider {#dt_ref_fbt_prov}
+# FBT Provider <a id="dt_ref_fbt_prov">
 
 The `fbt` \(Function Boundary Tracing\) provider includes probes that are associated with the entry to and return from most functions in the Linux kernel. Therefore, there could be tens of thousands of `fbt` probes.
 
@@ -15,17 +15,17 @@ Because of the large number of FPB probes that are available, be specific about
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## fbt Probes {#dt_ref_fbtprobes_prov}
+## fbt Probes <a id="dt_ref_fbtprobes_prov">
 
 FBT provides an `entry` probe and a `return` probe for most functions in the kernel.
 
-## fbt Probe Arguments {#dt_ref_fbtargs_prov}
+## fbt Probe Arguments <a id="dt_ref_fbtargs_prov">
 
 The arguments to `entry` probes are the same as the arguments to the corresponding operating system kernel function. These arguments can be accessed as `int64_t` values by using the `arg0`, `arg1`, `arg2`, ... variables.
 
 If the function has a return value, the return value is stored in `arg1` of the `return` probe. If a function doesn't have a return value, `arg1` isn't defined.
 
-## fbt Examples {#dt_ref_fbtexamples_prov}
+## fbt Examples <a id="dt_ref_fbtexamples_prov">
 
 You can use the `fbt` provider to explore the kernel's implementation. The following example script creates an aggregation on the number of times different functions allocate kernel virtual memory. The results of the aggregation are printed when the script exits. This would help somebody to monitor what functions are memory intensive. Type the following D source code and save it in a file named `getkmemalloc.d`:
 
@@ -74,7 +74,7 @@ Running this script results in output similar to the following:
 
 The output shows the internal kernel functions that are making calls to the `kmem*alloc` system calls and can be used to find which kernel functions most often allocate kernel virtual memory on a system.
 
-## fbt Stability {#dt_ref_fbtstab_prov}
+## fbt Stability <a id="dt_ref_fbtstab_prov">
 
 The `fbt` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_io.md b/doc/userguide/reference/dtrace_providers_io.md
index a458ab284..40851042c 100644
--- a/doc/userguide/reference/dtrace_providers_io.md
+++ b/doc/userguide/reference/dtrace_providers_io.md
@@ -1,5 +1,5 @@
 
-# IO Provider {#dt_ref_io_prov}
+# IO Provider <a id="dt_ref_io_prov">
 
 The `io` provider makes available probes that relate to data input and output.
 
@@ -7,7 +7,7 @@ For example, you can use the `io` provider to understand I/O by device, I/O type
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## io Probes {#dt_ref_ioprobes_prov}
+## io Probes <a id="dt_ref_ioprobes_prov">
 
 The following table describes the probes for the `io` provider. For all `io` probes, the module is `vmlinux` and the function is an empty string.
 
@@ -54,7 +54,7 @@ Fires when a thread finishes waiting for the completion of an I/O request. The `
 </td></tr><tbody></table>
 The `io` probes fire for all I/O requests to peripheral devices, and for all file read and file write requests to an NFS server. Requests for metadata from an NFS server, for example, don't trigger `io` probes because of a `readdir()` request.
 
-## io Probe Arguments {#dt_ref_ioargs_prov}
+## io Probe Arguments <a id="dt_ref_ioargs_prov">
 
 The following table describes the arguments for the `io` probes. The `argN` are implementation specific. Use `args[]` to access the probe arguments.
 
@@ -143,7 +143,7 @@ Probe
 
 DTrace doesn't provide the option to use `fileinfo_t` with `io` probes. In Linux, no information is accessible at the level where the `io` probes fire about the file where an I/O request originated.
 
-### bufinfo\_t {#dt_ref_iobuf_prov}
+### bufinfo\_t <a id="dt_ref_iobuf_prov">
 
 The `bufinfo_t` structure is the abstraction that describes an I/O request. The buffer that corresponds to an I/O request is pointed to by `args[0]` in the `start`, `done`, `wait-start`, and `wait-done` probes. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/io.d`. The definition of `bufinfo_t` is as follows:
 
@@ -289,7 +289,7 @@ Indicates that the data is to be transferred from main memory to the peripheral
 
 `b_edev`: Contains the major and minor device numbers of the device accessed. You can use the D subroutines `getmajor` and `getminor` to extract the major and minor device numbers from the `b_edev` field.
 
-### devinfo\_t {#dt_ref_iodev_prov}
+### devinfo\_t <a id="dt_ref_iodev_prov">
 
 The `devinfo_t` structure provides information about a device. The `devinfo_t` structure that corresponds to the destination device of an I/O is pointed to by `args[1]` in the `start`, `done`, `wait-start`, and `wait-done` probes. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/io.d`. The definition of `devinfo_t` is as follows:
 
@@ -318,7 +318,7 @@ DTrace translates the members of `devinfo_t` from the `buffer_head` for the Linu
 
 `dev_pathname`: Is the full path of the device. The path that's specified by `dev_pathname` includes components expressing the device node, the instance number, and the minor node. However, note that all three of these elements aren't necessarily expressed in the statistics name. For some devices, the statistics name consists of the device name and the instance number. For other devices, the name consists of the device name and the number of the minor node. So, two devices that have the same `dev_statname` migh differ in their `dev_pathname`.
 
-### fileinfo\_t {#dt_ref_iofile_prov}
+### fileinfo\_t <a id="dt_ref_iofile_prov">
 
 **Note:**
 
@@ -352,7 +352,7 @@ The `fi_fs` field contains the name of the file system type, or `<none>`, if no
 
 The `fi_oflags` field contains the flags that were specified when opening the file.
 
-## io Examples {#dt_ref_ioexamples_prov}
+## io Examples <a id="dt_ref_ioexamples_prov">
 
 The following example script displays information for every I/O as it's issued. Type the following source code and save it in a file named `iosnoop.d`.
 
@@ -517,7 +517,7 @@ sdc1 (/dev/sdc1)
 
 The previous output shows that the USB drive \(`sdc1`\) is clearly the limiting device. The throughput of `sdc1` is between 256K/sec and 512K/sec, while `dm-00` delivered I/O at anywhere from 8 MB/second to over 64 MB/second.
 
-## io Stability {#dt_ref_iostab_prov}
+## io Stability <a id="dt_ref_iostab_prov">
 
 The `io` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_lockstat.md b/doc/userguide/reference/dtrace_providers_lockstat.md
index 98affd838..c1d3eb4de 100644
--- a/doc/userguide/reference/dtrace_providers_lockstat.md
+++ b/doc/userguide/reference/dtrace_providers_lockstat.md
@@ -1,11 +1,11 @@
 
-# Lockstat Provider {#dt_ref_lockstat_prov}
+# Lockstat Provider <a id="dt_ref_lockstat_prov">
 
 The `lockstat` provider provides probes that can be used to study lock usage and contention.
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## lockstat Probes {#dt_ref_lockstatprobes_prov}
+## lockstat Probes <a id="dt_ref_lockstatprobes_prov">
 
 For all `lockstat` probes, the module name is `vmlinux` and the function name is an empty string.
 
@@ -44,7 +44,7 @@ The following probe fires before a lock is acquired if there was contention for
 
 Finally, an `adaptive-acquire-error` probe indicates an error acquiring an adaptive lock.
 
-## lockstat Probe Arguments {#dt_ref_lockstatargs_prov}
+## lockstat Probe Arguments <a id="dt_ref_lockstatargs_prov">
 
 The following table lists the argument types for the `lockstat` probes. The `argN` are implementation specific. Use `args[]` to access the probe arguments.
 
@@ -245,7 +245,7 @@ Probe
 
 `args[0]` has a pointer to the lock in question. The probes that fire in case of contention report a `uint64_t` `args[1]`, which is the wait time in nanoseconds. The `rw` probes also report an `int` that's either `RW_READER` or `RW_WRITER`. Finally, `adaptive-acquire-error` reports an `int` with a non zero error.
 
-## lockstat Examples {#dt_ref_lockstatexamples_prov}
+## lockstat Examples <a id="dt_ref_lockstatexamples_prov">
 
 The following examples illustrate the use of the probes that are published by the `lockstat` provider.
 
@@ -271,7 +271,7 @@ Run the program on the `date` command using `sudo dtrace -qs whatlock.d -c date`
 
 It might be surprising that so many locks are acquired with the `date` command. The large number of locks is a natural artifact of the fine-grained locking required of a scalable system such as the Linux kernel.
 
-## lockstat Stability {#dt_ref_lockstatstab_prov}
+## lockstat Stability <a id="dt_ref_lockstatstab_prov">
 
 The `lockstat` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_pid.md b/doc/userguide/reference/dtrace_providers_pid.md
index c0c7bbb9a..184f2c081 100644
--- a/doc/userguide/reference/dtrace_providers_pid.md
+++ b/doc/userguide/reference/dtrace_providers_pid.md
@@ -1,11 +1,11 @@
 
-# Pid Provider {#dt_ref_pid_prov}
+# Pid Provider <a id="dt_ref_pid_prov">
 
 The `pid` provider traces a user process, both function `entry` and `return`, and an arbitrary instruction.
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## pid Probes {#dt_ref_pidprobes_prov}
+## pid Probes <a id="dt_ref_pidprobes_prov">
 
 A probe is fully specified by naming its provider, module, function, and name.
 
@@ -52,7 +52,7 @@ The probe name is one of:
 -   An instruction offset. The hexadecimal offset, without a leading `0x`, is relative to the named function, but it's an absolute offset when the function name is `-`.
 
 
-## pid Probe Arguments {#dt_ref_pidargs_prov}
+## pid Probe Arguments <a id="dt_ref_pidargs_prov">
 
 For `entry` probes, the probe arguments are the same arguments as those of the probed function.
 
@@ -60,7 +60,7 @@ For `return` probes, `arg1` is the return value of the probed function.
 
 For offset probes, there are no probe arguments.
 
-## pid Examples {#dt_ref_pidexamples_prov}
+## pid Examples <a id="dt_ref_pidexamples_prov">
 
 Consider the following program, named `main.c`, that calls a function `foo()`:
 
@@ -173,7 +173,7 @@ The output looks similar to:
 
 We probe on the chosen instruction, using both a relative offset `foo:4`, and an absolute offset `-:40110a`. Both probes fire, both reporting the same PC `0x40110a`.
 
-## pid Stability {#dt_ref_pidstab_prov}
+## pid Stability <a id="dt_ref_pidstab_prov">
 
 The `pid` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_proc.md b/doc/userguide/reference/dtrace_providers_proc.md
index 6c1fa8ecf..cf64bc28f 100644
--- a/doc/userguide/reference/dtrace_providers_proc.md
+++ b/doc/userguide/reference/dtrace_providers_proc.md
@@ -1,5 +1,5 @@
 
-# Proc Provider {#dt_ref_proc_prov}
+# Proc Provider <a id="dt_ref_proc_prov">
 
 The `proc` provider makes available the probes that pertain to the following activities: process creation and termination, LWP creation and termination, execution of new program images, and signal sending and handling.
 
@@ -7,7 +7,7 @@ The `proc` provider makes available the probes that pertain to the following act
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## proc Probes {#dt_ref_procprobes_prov}
+## proc Probes <a id="dt_ref_procprobes_prov">
 
 The probes for the `proc` provider are listed in the following table.
 
@@ -128,7 +128,7 @@ Fires in the context of a newly created process. The `start` probe fires before
 
 No fundamental difference between a process and a thread that a process creates, exists in Linux. The threads of a process are set up so that they can share resources, but each thread has its own entry in the process table with its own process ID.
 
-## proc Probe Arguments {#dt_ref_procargs_prov}
+## proc Probe Arguments <a id="dt_ref_procargs_prov">
 
 The following table lists the argument types for the `proc` probes. See [proc Probes](dtrace_providers_proc.md) for a description of the arguments. The `argN` are implementation specific. Use `args[]` to access the probe arguments.
 
@@ -357,7 +357,7 @@ Probe
 —
 
 </td></tr><tbody></table>
-### lwpsinfo\_t {#dt_ref_lwpsinfoproc_prov}
+### lwpsinfo\_t <a id="dt_ref_lwpsinfoproc_prov">
 
 Several `proc` probes have arguments of type `lwpsinfo_t`. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/procfs.d`. Some structure members, while still recognized for historical reasons, aren't implemented. The definition of the `lwpsinfo_t` structure is as follows:
 
@@ -475,7 +475,7 @@ The thread is a zombie.
  The equivalent Linux task state is `EXIT_ZOMBIE`, `EXIT_DEAD`, or `TASK_DEAD`.
 
 </td></tr><tbody></table>
-### psinfo\_t {#dt_ref_procpsinfo_prov}
+### psinfo\_t <a id="dt_ref_procpsinfo_prov">
 
 Several `proc` probes have an argument of type `psinfo_t`. Detailed information about this data structure can be found in `/usr/lib64/dtrace/*version*/procfs.d`. The definition of the `psinfo_t` structure, is as follows:
 
@@ -527,7 +527,7 @@ Lightweight processes don't exist in Linux. In Linux, processes and threads are
 
 `pr_dmodel` is set to either `PR_MODEL_ILP32`, denoting a 32–bit process, or `PR_MODEL_LP64`, denoting a 64–bit process.
 
-## proc Examples {#dt_ref_procexamples_prov}
+## proc Examples <a id="dt_ref_procexamples_prov">
 
 The following examples illustrate the use of the probes that are published by the `proc` provider.
 
@@ -691,7 +691,7 @@ Running this script results in output similar to the following:
            swapper/6             pmlogger           14 1
 ```
 
-## proc Stability {#dt_ref_procstab_prov}
+## proc Stability <a id="dt_ref_procstab_prov">
 
 The `proc` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_profile.md b/doc/userguide/reference/dtrace_providers_profile.md
index bcc8c64d2..da83e8561 100644
--- a/doc/userguide/reference/dtrace_providers_profile.md
+++ b/doc/userguide/reference/dtrace_providers_profile.md
@@ -1,5 +1,5 @@
 
-# Profile Provider {#dt_ref_profile_prov}
+# Profile Provider <a id="dt_ref_profile_prov">
 
 The `profile` provider includes probes that are associated with an interrupt that fires at some regular, specified time interval.
 
@@ -7,7 +7,7 @@ Such probes aren't associated with any particular point of execution, but rather
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## profile-*n* Probes {#dt_ref_profile-n_prov}
+## profile-*n* Probes <a id="dt_ref_profile-n_prov">
 
 The `profile-*n*` probes fire at a fixed interval, at a high-interrupt level on all active CPUs.
 
@@ -86,7 +86,7 @@ days
 hertz \(frequency expressed as rate per second\)
 
 </td></tr><tbody></table>
-## tick-*n* Probes {#dt_ref_profile-tick-n_prov}
+## tick-*n* Probes <a id="dt_ref_profile-tick-n_prov">
 
 The `tick-*n*` probes fire at fixed intervals, at a high interrupt level on only one CPU per interval.
 
@@ -98,7 +98,7 @@ The `tick-*n*` probes have several uses, such as providing some periodic output
 
 The highest available tick frequency is 5000 Hz \(`tick-5000`\).
 
-## profile Probe Arguments {#dt_ref_profargs_prov}
+## profile Probe Arguments <a id="dt_ref_profargs_prov">
 
 The following table describes the arguments for the `profile` probes.
 
@@ -146,13 +146,13 @@ The arguments are as follows:
 -   `upc`: user-space program counter
 
 
-## profile Probe Creation {#dt_ref_profprobecreate_prov}
+## profile Probe Creation <a id="dt_ref_profprobecreate_prov">
 
 Unlike other providers, the `profile` provider creates probes dynamically on an as-needed basis. Thus, the preferred probe might not appear in a listing of all probes, for example, when using the `dtrace -l -P profile` command, but the probe is created when it's explicitly enabled.
 
 A time interval that's too short causes the machine to continuously field time-based interrupts and denies service on the machine. The `profile` provider refuses to create a probe that would result in an interval of less than two hundred microseconds and returns an error.
 
-## prof Stability {#dt_ref_profstab_prov}
+## prof Stability <a id="dt_ref_profstab_prov">
 
 The `profile` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_rawtp.md b/doc/userguide/reference/dtrace_providers_rawtp.md
index d85dd45a8..67cb0bedc 100644
--- a/doc/userguide/reference/dtrace_providers_rawtp.md
+++ b/doc/userguide/reference/dtrace_providers_rawtp.md
@@ -1,5 +1,5 @@
 
-# Rawtp Provider {#dt_ref_rawtp_prov}
+# Rawtp Provider <a id="dt_ref_rawtp_prov">
 
 The `rawtp` provider gives DTrace users access to the raw tracepoints exposed by the kernel tracing system, including access to the untranslated arguments of the associated tracepoint events.
 
@@ -17,7 +17,7 @@ sudo dtrace -lvP rawtp
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## rawtp Stability {#dt_ref_rawtpstab_prov}
+## rawtp Stability <a id="dt_ref_rawtpstab_prov">
 
 The `rawtp` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_sched.md b/doc/userguide/reference/dtrace_providers_sched.md
index f6d183708..42f318e77 100644
--- a/doc/userguide/reference/dtrace_providers_sched.md
+++ b/doc/userguide/reference/dtrace_providers_sched.md
@@ -1,5 +1,5 @@
 
-# Sched Provider {#dt_ref_sched_prov}
+# Sched Provider <a id="dt_ref_sched_prov">
 
 The `sched` provider makes available probes related to CPU scheduling.
 
@@ -7,7 +7,7 @@ Because CPUs are the one resource that all threads must consume, the `sched` pro
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## sched Probes {#dt_ref_schedprob_prov}
+## sched Probes <a id="dt_ref_schedprob_prov">
 
 The probes for the `sched` provider are listed in the following table. For all `sched` probes, the module is `vmlinux` and the function is an empty string.
 
@@ -76,7 +76,7 @@ Fires as a part of clock tick-based accounting. In clock tick-based accounting,
 Fires immediately before the current thread wakes a thread sleeping on a synchronization object. Here, `args[0]` and `args[1]` refer to the sleeping thread, as an `lwpsinfo_t *` and `psinfo_t *`, respectively. The type and address of the synchronization object are contained in the `pr_stype` and `pr_wchan` members of the `lwpsinfo_t` of the sleeping thread. The meaning of this address is a private implementation detail, but the address value might be treated as a token unique to the synchronization object.
 
 </td></tr><tbody></table>
-## sched Probe Arguments {#dt_ref_schedargs_prov}
+## sched Probe Arguments <a id="dt_ref_schedargs_prov">
 
 Many of these probes refer to a particular thread. For these probes, the thread's `lwpsinfo_t` is pointed to by `args[0]` and the `psinfo_t` of the process containing the thread by `args[1]`. A few probes refer to a particular CPU. Its `cpuinfo_t` is pointed to by `args[2]`. Only `enqueue` has an `args[3]`, and that argument is a Boolean, as described. The `argN` values are implementation specific. Instead, use `args[]` to access the probe arguments.
 
@@ -243,11 +243,11 @@ Probe
 —
 
 </td></tr><tbody></table>
-### lwpsinfo\_t and psinfo\_t {#dt_ref_lwpsinfo_t_psinfo_t_sched_prov}
+### lwpsinfo\_t and psinfo\_t <a id="dt_ref_lwpsinfo_t_psinfo_t_sched_prov">
 
 The `lwpsinfo_t` and `psinfo_t` structures are described in [Proc Provider](dtrace_providers_proc.md).
 
-### cpuinfo\_t {#dt_ref_cpuinfo_sched_prov}
+### cpuinfo\_t <a id="dt_ref_cpuinfo_sched_prov">
 
 The `cpuinfo_t` structure defines a CPU. The `args[2]` arguments for the `enqueue` and `dequeue` probes point to the `cpuinfo_t` for the CPU associated with the run queue, which is sometimes different from the current CPU, whose `cpuinfo_t` is pointed to by the `curcpu` variable.
 
@@ -262,7 +262,7 @@ typedef struct cpuinfo {
 } cpuinfo_t;
 ```
 
-## sched Examples {#dt_ref_schedexamples_prov}
+## sched Examples <a id="dt_ref_schedexamples_prov">
 
 The following examples illustrate the use of the probes that are published by the `sched` provider.
 
@@ -810,7 +810,7 @@ The output of the example script is two distributions of the millisecond offset
 
 The output histogram named `tick` shows that the clock tick is firing at a 1 millisecond offset. In this example, the output for `enqueue` is evenly spread across the ten millisecond interval and no spike is visible at 1 millisecond, so it seems the threads aren't being scheduled on a time basis.
 
-## sched Stability {#dt_ref_schedstab_prov}
+## sched Stability <a id="dt_ref_schedstab_prov">
 
 The `sched` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_sdt.md b/doc/userguide/reference/dtrace_providers_sdt.md
index 442911fc7..b4490401a 100644
--- a/doc/userguide/reference/dtrace_providers_sdt.md
+++ b/doc/userguide/reference/dtrace_providers_sdt.md
@@ -1,5 +1,5 @@
 
-# SDT Provider {#dt_ref_sdt_prov}
+# SDT Provider <a id="dt_ref_sdt_prov">
 
 The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
 
@@ -11,13 +11,13 @@ Both the name stability and the data stability of the probes are Private, which
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## Creating sdt Probes {#dt_ref_sdtcreatep_prov}
+## Creating sdt Probes <a id="dt_ref_sdtcreatep_prov">
 
 If you are a device driver developer, you might be interested in creating `sdt` probes for a Linux driver that you are working on. The disabled probe effect of SDT is only the cost of several no-operation machine instructions. You are therefore encouraged to add `sdt` probes to device driver code as needed. Unless these probes negatively affect performance, you can leave them in shipped code.
 
 DTrace also provides a mechanism for application developers to define user-space static probes.
 
-### Declaring Probes {#dt_ref_sdtdeclp_prov}
+### Declaring Probes <a id="dt_ref_sdtdeclp_prov">
 
 The `sdt` probes are declared by using the `DTRACE_PROBE` macro from `<linux/sdt.h>`.
 
@@ -34,11 +34,11 @@ SDT can also act as a metaprovider by registering probes so that they appear to
 
 Probes that use such macros appear to come from a provider other than `sdt`. The leading double underscore, provider name, and trailing underscore in the `name` argument are used to match the provider and aren't included in the probe name.
 
-### sdt Probe Arguments {#dt_ref_sdtparg_prov}
+### sdt Probe Arguments <a id="dt_ref_sdtparg_prov">
 
 The arguments for each `sdt` probe are the arguments that are specified in the kernel source code in the corresponding `DTRACE_PROBE` macro reference. When declaring `sdt` probes, you can minimize their disabled probe effect by not dereferencing pointers and by not loading from global variables in the probe arguments. Both pointer dereferencing and global variable loading can be done safely in D functions that enable probes, so DTrace users can request these functions only when they're needed.
 
-## sdt Stability {#dt_ref_sdtstab_prov}
+## sdt Stability <a id="dt_ref_sdtstab_prov">
 
 The `sdt` provider uses DTrace's stability mechanism to describe its stabilities. These values are listed in the following table.
 
diff --git a/doc/userguide/reference/dtrace_providers_syscall.md b/doc/userguide/reference/dtrace_providers_syscall.md
index 880b7de69..dbd90303e 100644
--- a/doc/userguide/reference/dtrace_providers_syscall.md
+++ b/doc/userguide/reference/dtrace_providers_syscall.md
@@ -1,5 +1,5 @@
 
-# Syscall Provider {#dt_ref_syscall_prov}
+# Syscall Provider <a id="dt_ref_syscall_prov">
 
 The `syscall` provider makes available a probe at the entry to and return from every system call in the system.
 
@@ -7,17 +7,17 @@ Because system calls are the primary interface between user-level applications a
 
 **Parent topic:**[DTrace Provider Reference](../reference/dtrace_providers.md)
 
-## syscall Probes {#dt_ref_syscallprobes_prov}
+## syscall Probes <a id="dt_ref_syscallprobes_prov">
 
 `syscall` provides a pair of probes for each system call: an `entry` probe that fires before the system call is entered, and a `return` probe that fires after the system call has completed, but before control has been transferred back to user-level. For all `syscall` probes, the function name is set as the name of the instrumented system call.
 
 Often, the system call names that are provided by `syscall` correspond to names in the Section 2 manual pages. However, some `syscall` provider probes don't directly correspond to any documented system call, such as the case where a system call might be a sub operation of another system call or where a system call might be private in that they span the user-kernel boundary.
 
-## syscall Probe Arguments {#dt_ref_syscallargs_prov}
+## syscall Probe Arguments <a id="dt_ref_syscallargs_prov">
 
 For `entry` probes, the arguments, `arg0` ... `arg*n*`, are arguments to the system call. For return probes, both `arg0` and `arg1` contain the return value. A non-zero value in the D variable `errno` indicates a system call failure.
 
-## syscall Stability {#dt_ref_syscallstab_prov}
+## syscall Stability <a id="dt_ref_syscallstab_prov">
 
 The `syscall` provider uses DTrace's stability mechanism to describe its stabilities. These stability values are listed in the following table.
 
-- 
2.47.3

