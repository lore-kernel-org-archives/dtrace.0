Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F0D3F23AF
	for <dtrace@lists.linux.dev>; Wed,  4 Feb 2026 15:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770220224; cv=fail; b=sN0JOkcpTWyvss5/f+9iYpXNT5kqMp4p0wCwMCRLkbwAKCzKmyD1qbqnCYFlND1tMR6j4WqfrazuDuAGSFRnOwwS/R4m6FXGT/rHCPRZYBRmdEvaFaNxMXjV4yFfPJU9MLOObT6X+WJGrSFtObMFCnNuUu9U2qJdsYPKuUK/oyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770220224; c=relaxed/simple;
	bh=93cqApvb9rq8MWub6fP6m69dJh7FoZ+UJuQeQZxnkrU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LGXx39KYj6JZlJb/5Juz9+RR1BYoLi/IhqN1S1J4pp2rIEXi3nRzN/AM1t9IYieXsYZisCBIXgUhhwT/LaV+RwOsyRXkicc/8VUfMy9mPbnhZjYde8NnUA0DfeCpmgjtVJaB8E7pmu7gK8Ecex//ROdWspg0nY92WnlWP93cFmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WaRCyJwd; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eJ9tAnjd; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WaRCyJwd";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eJ9tAnjd"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614DOGJL2146435
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 15:50:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=MSCqhefmKQBGAIVIYhWD8kYn/bhJijL5fViwsL4DRkI=; b=
	WaRCyJwdMIY2kBj3UDdt28k+KAAziCkzTXdwRXaR/NQeUTrwRUhxPqr0+aEi6JyL
	6u+rxdz9abLvN9GIY35wPIpV8HeZuwiREUOa31KVEQHV5EMbmoyuFwf5cyFfkuHn
	2Vk3Lj6J7BHYIEGMybtCteuKULDjfNvKnmKWceIMKlHlqg8+6ZNjtP2H0xCLtJgw
	XV487E7iqTiPSVJypbsP/lz3T+Y5y+zHb5bjYIpVOanIca8cyQ89qeZjCZzHnzec
	EJfVinpJiDFYSLVEkR4TJnS0SrtkRhAN9wSkcwWhoQ8XRA2uESbVCNbC5Q27nrGp
	lI7JaGcvgl3/KDQ8PmnChw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3k7uj1c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 15:50:23 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 614E0XdH001347
	for <dtrace@lists.linux.dev>; Wed, 4 Feb 2026 15:50:22 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012002.outbound.protection.outlook.com [40.93.195.2])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4c186bkbvc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 04 Feb 2026 15:50:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdGEYa024n+34TEk1zejYr1HUvycFE8/+Xsd1tIbD6KDm3W5REQRXUoX/5maKdwEWD4UJApepmrYGqCstTaqhxyrWwh1eMYSzhPNHASekbDHP7qEgjHZQdmvgnx5aj2jiJdakE98iUpjYJ48Z8qX+TaRZRypUfLlGjcqpwj8rdm3Kvipf7V/TsNVwyIFIpEOtchiP/MFpeb5xuHuxsgB+moyjpyx6KPYI7h1Upr0a7dQKJZn45C9nMwidllVHkRt2qyDTXgfM0wdUHuB3KtARKAhCJPxgmhnYAmHkd9FGOzXDlC+s1geBc/RjIY7uGwlQKqXqidJjY4U3wRElFK54g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSCqhefmKQBGAIVIYhWD8kYn/bhJijL5fViwsL4DRkI=;
 b=N0Mgy/b19/npVh1q33tBiV54FhjfCFdm1amb7K+pF06xPTHaz6vJMvRIUSJ5kWVWuETvdkGiP1Vizm+SKjs8HBfSAm6lSkaqfB/06/IwgMUI7rBx+XysejOcX1z2HV6RRpp5G00BV1sVr2FfNJCYNupHIV6FZ+mSwhbobnCGGn4oURNOLgCXrqwmLJbvzoZi0eUPdwKvwHR6Rmkbxvfiw1RbgWfMPzabU8tu/513S3/gl9HrpjLS4ux86aEJ61yQ4Jgt2+Nevv5JdOFwnnkxaVaOGO/BfJJO8e4+Br7m8ZzCbTDsab1fZDsTP0OMRfXDPeyNriaO70FTD93BukUqhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSCqhefmKQBGAIVIYhWD8kYn/bhJijL5fViwsL4DRkI=;
 b=eJ9tAnjdk80Z4GE8ejkKzZpn91f7hMoTaHC/fKVM4gIygh3XJ7kpAF3wVpTm5UGKbPb4sPctnV9Uo5XbMA1hGEDwaReJ8IG95giFLqq1gGnffnfhxa52a4WaNFhUMq3JMu7wLottyy7hZ85mVMkV1nsKTHqk4bfWNxQ9dxEivPw=
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by PH7PR10MB6155.namprd10.prod.outlook.com (2603:10b6:510:1f4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 15:50:14 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%3]) with mapi id 15.20.9587.013; Wed, 4 Feb 2026
 15:50:14 +0000
Message-ID: <0f29b4ed-826e-4a1d-b97e-7937374e0944@oracle.com>
Date: Wed, 4 Feb 2026 08:50:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH v2 1/2] spec: fix missing attribution of
 patches
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <3569ca0edb3fd194d7e7e7232509f244@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <3569ca0edb3fd194d7e7e7232509f244@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR17CA0023.namprd17.prod.outlook.com
 (2603:10b6:930:8c::29) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|PH7PR10MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0dc760-4cb3-4c46-7dba-08de6405153f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZE9sUW1xbHErSng2UDIxVGlNWXNuSUU2NDR2dklmclA5UU91UnJiRDN6NExL?=
 =?utf-8?B?ajFXM1JCWkNTRkkvQ1pOQjBLYk5YYmtrVVBiUnoxOXNHM0lmWGVRRE1CbnZq?=
 =?utf-8?B?WDEyUTBlR2pjK3RwYWJPUnBKRVpyWjMxOXlIZkIyVWs3cnhDRldrSXZhanNZ?=
 =?utf-8?B?OVlDVTZLZkVBS254MjNmV3BWdjBxQlkvTGx0Ymg5K2xSdzU3VFhDV1hJNHF1?=
 =?utf-8?B?NFN4YUwxMW80Qm1zcjBTZVRDUVF1NTNkcWVlQ3hIQW4rNklFZC80b1RKSldz?=
 =?utf-8?B?NkFOenJtZjd5a0UyaWFKMnhHQzlrRS9JWk5iTTJFNGNXWUlRRHB4ZkI0RXVp?=
 =?utf-8?B?b0c5S05NRmtBbzFMRzNDTjZkWTI5OGV2eTJNTWJqWjJZbGxZblMxY3RqYWxj?=
 =?utf-8?B?RS9KbVlxSGxvVXU3K2t1NitjaitNaXhwUmxkY0FkK2tsM2w1NlByTGd2YWRD?=
 =?utf-8?B?SnBVbFU4SkZVemZ6MHZVUVN2TXdWVmJRNjVQWGlaUXRrckRwclpwb3l1Ynh4?=
 =?utf-8?B?cGdRTjFHL0o5WUM1OUpoUW9vYlFxWmgwZ1ZSUXZCSTVlaDYwWURXTlhoeTNs?=
 =?utf-8?B?czEwalJyRHJEMTloWFVpYWYvRlJ5SVRQZk5CYUt3U2dJL1NWQUt6T2JwMjhp?=
 =?utf-8?B?VTJpbGFrWTE0TzVEelZCRGZaR1FyYksxQXpiemV1UjJpOVgxWldwcGdMb3F0?=
 =?utf-8?B?WldDSFhNa3IyUlRXWHF5VzhKako0aDN4VXZEZG5OaW9HcjlXZ2h5djJ3UGsr?=
 =?utf-8?B?ZFZ6djJlTGt3bnl2Vk40bC8rZ2Yxd0hoOGlHVjBqdE43eEhkeVc0SjdOUk0z?=
 =?utf-8?B?RjZWNTQ1a281OGlqNnNNbndnUERnaE9EeHEvUndueWh6bkFYT0t6Tm9BSHcy?=
 =?utf-8?B?Y0c4cEE1ZHNDTXlDdlY5RmR3VTNHMTlmZDlqaUkyVFdQbS9IY2VCa3JROUZI?=
 =?utf-8?B?VUtPNUVGREw2elVocUk4VEY4eTRtbTF3VzQwTTExdGF0bmQyNkM0WnRhc2dB?=
 =?utf-8?B?SW53aVhuZldMckhObGNoRW1jb2N6ek01WVdsd3Rvd0IyTUg5UlB3czNRUDYz?=
 =?utf-8?B?cGNsNzIyZDBYS09QMzNibU1NbnlhbjkyUndRTVlEOSsrdm1WdWNxS0JvR0FU?=
 =?utf-8?B?ZHJSVGpCY042dEJGZ1dJd3ZrNkM5Tk1VeFdaeFh0Z3N2RlRVblV3VTZwbkVT?=
 =?utf-8?B?MkZ0c3ZqYjFYQVA0SG43NHg3UlYzOTBvcGRMdlJkR1VLaGFXblVtM0V3VnZ5?=
 =?utf-8?B?dGhvdVY4dzY1VkI0MUtkU0UzcjZ0OVB1dkNpai9GWlBDUzJOUm1admhpNzhk?=
 =?utf-8?B?R0d1VS9pTDlYcFd3OWYyeGQzRVlGeHlZWDFZUDRFUlIwYlpNL0VyNVYzY0lr?=
 =?utf-8?B?WjdIYUdTQ2ZnblVHd0pLS3JhR25uZEJ5a2RKSEt2QkMweC9SbVgxa0FEcVFi?=
 =?utf-8?B?dGxZQUc3LzArSTBnVG9UVUZkTlpnQWFsVWxZR2MxVGtHZFJXWGtFdEUycHFD?=
 =?utf-8?B?aWhVNk4rR1lyZmZNbHIzc3RtcnZnQ3N1MFNWU0kwRWIyNDdWcTIwOFl2KzRW?=
 =?utf-8?B?R0FXSGpRSWJxbmkrdWdrbCtFRXovYTAzK1JzUVEzQXY0SWdGUnZzUUlKK2VS?=
 =?utf-8?B?QWpmTU5xNGdHU1ZZS1B6Zko2cmpscno0dUJzR1ptMXZxa3dhY0hhSlIzQXNa?=
 =?utf-8?B?bm0yWDhXZ2dLeDl6L1p6b2JsdkFkaUVTV0dGVldRRHFSQTlSdTVIbFlTS1hP?=
 =?utf-8?B?bzdlRzM0SWJEdTJ6dnZ1SU1UN25ZeXp2ZlhCaWF3dnJDTDFlL1p4aEtCSjF3?=
 =?utf-8?B?b1U0TVR6czVONmNndWNxbTBrbW5tU0hZbW40K3licWxPTDk2anlGZXVZenNx?=
 =?utf-8?B?dGNDQ0Z1bTR5eklVV09JUjQyK0FYQXBLY004Y1FLVzlLa2V1ZmFuelF4ZFQw?=
 =?utf-8?B?NzVQSGVOMm9JTnBBalU0a3JtUlFqL2M2SVVxQ0lzdnVIbjhSSkdBeDdsZUxY?=
 =?utf-8?B?TWxGSVp1ZDkydmViMXRDRlVkT1N6czByN01PR2xPeGZYN2RYNGxRYVdIOFJ1?=
 =?utf-8?B?YjJqK3VEY3FJNjU0U1BYVWYxZDJBczdVN29XczhwRGhSN2E4RFFMKyswcWNV?=
 =?utf-8?Q?Zp0I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG1mQ2svUWplb3NBWjVnRXlKbURHYkxBd3EwSSsyNm5JUmh6U0ZUQ09PbExJ?=
 =?utf-8?B?V2xmOHVlYnlVajVBWUt1dytoeS9vNnVIaUhSVU5rRXlLZGRQTVI2dGtBN3cr?=
 =?utf-8?B?b2VPRFovWUNsTi9jc3JGbTlLNDgvVDBDdHlTS0Qxa0ZETUJ6WG1RbXZXY1Bu?=
 =?utf-8?B?emVZekp3TEk4TWd6ak1VWm9DQnpWTlNSaVhra2NVQjRtbkJRMVU4TjZMUUNx?=
 =?utf-8?B?L282eTNuc2xvZEo0Y1dQaUtKb1Z4dlFkUCs0QlJDTi92Vkp6Z0pyd2xnOEV3?=
 =?utf-8?B?NHBwVXZpa1Y0VVlIQXpIY3BSazhCSHJ3dVBqY21MRFZSRkJ6Tml0dGlNMFZw?=
 =?utf-8?B?OEFVbjdTWlNrTERqR0VLeFN3QVovWk5jZnR3bkFRMW9kRCtKMFRjRUpzcHdS?=
 =?utf-8?B?TTA5WUx4MGw5Y09JRWJ2L1ZrdHJETXNybXROTFhqakhjNmoxY3BlN0RVcEQ0?=
 =?utf-8?B?MXJiZi9ZT2ZMYmw2OWo3NGdOcjZiUHZlUVdUUVEyUUFSK0N6MVU0NE1qOXhK?=
 =?utf-8?B?YlI3Q1FvNkd3bzBFOGRjRXh6UmtKU2kxclUwUjVXV29PMUE5Q0V4NnU1Yjhz?=
 =?utf-8?B?MWZNelVnZkVWNUQwM2ZrekpHU1QyTFIvYUJibHBWNi9NOWZoVWdQT2YyYjQ5?=
 =?utf-8?B?WityRnEveFlrZUxiUlhpTGhxSU9YY2VhU1Q3UWFwQ2pxYnlMUkpmSFBaalFF?=
 =?utf-8?B?bXgyWjY2VHp5WTRkSVI0dkF5YWJOY3BmMGJrNXRZYUFQVE1TN0JJNm9nc3g5?=
 =?utf-8?B?UkhHdXpRNzBncWdUNitFU0JOdGl6OUl0RVNHMG5pZi95MmtrUGljcGZkd2pl?=
 =?utf-8?B?ZEdwTlhGaS93VjlDb3pEQ3o3aS9aeXN4dkpLQk1hMEY0VEFGby9NQ3ZMSFN3?=
 =?utf-8?B?cUM1bTZ4YlJLcXY2QkVUSStkckE1WTlEZnd5OGJCdFJkUStZdU9mYUg2Z244?=
 =?utf-8?B?dkpWd01jWnozM2JpaUxneW1HNGVqQ21yRTdVdWN1dnhnQmhMSmQ0anNRemRU?=
 =?utf-8?B?K2JYT0V5VWYwamd5d3pPSVU3ZUJoYjBZZFdJM3MwK1RKZWxqUmtNcTUwdE42?=
 =?utf-8?B?NEJLYW1RVmhnbGlOcGUyTnRvNElyaDh1UmNJMGpaZVFnV21sYXFwNnowNWhq?=
 =?utf-8?B?V2xsL3RDMXhZeFZMM2ZkOEpXNjBxNWFnQktPVEJnbGFkUjErQWxCNk1XRHFo?=
 =?utf-8?B?UUJhKy9RRG9IbFFmSWlQd2RaZFlmLzVycC94VXo1Y2Z6YUU0T3dvMEI1Y2dY?=
 =?utf-8?B?V2orcmJyZSswS1lXMDlEME5SVkxvNk1UQlJQWE9kY0FFTkxySVQ0aVhYQ0JK?=
 =?utf-8?B?QStrOVAwazFieFdRWWk1T2UxRmhsdXZYNHA3aEw0WnY2K2V3U3VNR3huQ3pl?=
 =?utf-8?B?aDRpdGd1dGhzTzZoSFR2bXgxOUgvc0FxUUlOY2JTdUlSTnppbjQ2M3FqWW5O?=
 =?utf-8?B?QWJ6MmZZQ3Y4a2l0TDVmSkY3N2lIUGs4bmtKT2pqaVVqekFXRjUwWmo0VXNW?=
 =?utf-8?B?UHRQUEloTFdWMVhmNUQ0WTA1MktIanVWbmJyMURNWUF1ZG9Vc05jVmFQT21T?=
 =?utf-8?B?TGF0c3YzMGVXNzB2N1JRWkhXTEJmcmxZMDlaWU1rWmZVUEJlZUl1a1RRbXVh?=
 =?utf-8?B?Y2pWeXN1NUNDU2ZYRVNrZDlYb2pITWZRTHVlNEpaQkZIRkFITUhDTVh6a1dF?=
 =?utf-8?B?VVVGMm15TTh3Qi81eitnN214SVFURVdzNkRwSDV1NW5LVGp6d0JNYVNLR3kw?=
 =?utf-8?B?Y0hPTkdLanM3TVJRWGx2ekJaNW9ZN0tDVkw4MTlsaXdXOHNuaFYxRlBUMXF6?=
 =?utf-8?B?bEZPaTl1NDJjdkdzdDBEY2tpYldZa2craFlQRVRVZWZtbFBURTU0OFhMOTE0?=
 =?utf-8?B?UlJOT0dJK1IvOWtqSStBTmdybmo3bXZkM2JUMjg2ZzRBNlF6RHBxaTNiK3JN?=
 =?utf-8?B?d3BmQkRyUG5FcUdidDR6ZmovSGZlUkZPS1luTkFjSXRlZlk3SFlqVUVORDJT?=
 =?utf-8?B?WDRFUVhIL1g0QTJyRmcvcWJBekpMR3BkT3kzZGFIbk85cDdNcXk3K0gwNlcr?=
 =?utf-8?B?cjZhaCtva1ZpeXQxNElKRWlXbDNKbWxoUUIvZFRhTUVNZm5iQWdPM2hnd3F6?=
 =?utf-8?B?dmRPc2IxckpTY05JZWVjWGJYdnE3THEvRFo3bnJXcVJRdi93WXF5djQxNmZP?=
 =?utf-8?B?NzBoOUordVV6RlF6eEtPWTZ5b3gwa3pyWWxuZHk5b2VhOC8ycDdqbG95YVA1?=
 =?utf-8?B?K25RS2llemhWV1kxTGU3dDhjRFErVDhYdEJKSnJ1bTBRdUFqTmpZTUt6NEdi?=
 =?utf-8?B?NGlDT0JyMStRNUFGakR3NEZaeE9ZU2Y2UGxoclRmeHpXUzJmSmJqdz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nCtcn+HbKWZQhFhkkHWL+t5zBNnZzLIzplTZzU2DJIG3J01ry40DU6i+zKPbcIstVts+gWhXPkFWfKFKk7TtD7LeOtufjPSr0uPgnyM1t0efh9/Woii0bUrlPn1wc6cSbA2jHNVC9KA3zMaNm5FLX1tOpM4cB6llGSHgzEeLzMuOQ+1cGIX2yyOPLzErykOALNTSI3Zfwoe2q9UEd31dHhLNQm5o7ne/dOqksbSLMj6AvgyVRpCwyjczkr+mTzRwO8DCzjJvWhmFoqF5km5JnyyEep353N5F1qUQ8k4uDaHBm46h2SV95UTyYQ9XsZ4SBZCFZ/9WZDzOErxON6AjcRJkH3tTWJ4cjvse9LhtiBRYRxjfyEt58BmPs/bqYLNGSyyT/DGfm/aHJCdRWF1Yq6k4xbYG46uLo6a69q2tkA0Ks5MN+EywTmuHcYLJYGvqzCVM6T5fSq6UGbvEBAIyqCCejJ3snjTGkD0nOdquqiOR9s1CvawYirezxTcrjv8xuwA8xMlV6Anw7AnOcoXLMJZKilUp77C/CIxQHQ5CU0zboopeKWLWJ7XzxXmk0YX1MCZhGJFMwbk5zw4TJcmzI6jCDtVTkvdA7CuJ02uisgE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0dc760-4cb3-4c46-7dba-08de6405153f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:50:13.7938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7V3K93RlfVDCtwEkygxS/pT59ll9Y10HruUVGjhFm5zEmDd3f3YFkTp5/Q12uN+5fYEko/x20qhZty6E5+KY5qaHXpwdWOv/nT30uX5QNIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6155
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_05,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 adultscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602040120
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyMCBTYWx0ZWRfX1bZyF2ZDkRnc
 XlNpFPjH0UC1uUVCcgUW//7Rc2vJtvcqnUv3TjyU+ZfHNf2umoCrlAaVHi4fm6+ulK70vX3Glh9
 IVb1CvU3HQsUJXdzV7R+ZUWe0vmMTOHc2fuuoQcQPeKu4BXQ/MLhomklUenPpcK3AWuTTTPOpxt
 ySm6oiZ2nyLcEvZLsX/rlNug5tgAd69GbjZ1mOAv3dHeZmg2wgWDs7ffVM293TbxEMLPrAU0F9b
 HUuGokCz/KXnxTA3OwEOHT4VV1W1TE+/boWpcKrr3t56pFJtFTK7n+RUN6XqI1/5vc+c5sp1aJN
 uG1S1CNX42xZ4nzuO/e87G1AaxNL+d5JxY/Im3BlfUy1jQrdQwSMcB1NjqrvmJyiUSFnL2Bb/CG
 Us6baXr4C9+L4dXc8g75X9R1LA/JS060zxPznrwi7IjCqqM8C031LaOwb76uUBSlS/bk19ZfSG+
 7s5KfiP6hVL9UB/ZLTA==
X-Proofpoint-GUID: s-E9PrwFoWKMB-8myXtL6sipxjMpGzoz
X-Authority-Analysis: v=2.4 cv=Z7Dh3XRA c=1 sm=1 tr=0 ts=69836abf cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=-Y6H9wWR22EZEf9VnfgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: s-E9PrwFoWKMB-8myXtL6sipxjMpGzoz


Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>


On 1/28/26 9:44 AM, Kris Van Hees via DTrace-devel wrote:
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  dtrace.spec | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/dtrace.spec b/dtrace.spec
> index 6f0b0135..8a81e5f2 100644
> --- a/dtrace.spec
> +++ b/dtrace.spec
> @@ -231,8 +231,8 @@ systemctl start dtprobed || :
>  
>  %changelog
>  * Tue Jan 27 2026 Eugene Loh <eugene.loh@oracle.com> - 2.0.5-1
> -- Implement PID-specific uprobes.
> -- Allocate the buffers BPF map to fit highest CPU id.
> +- Implement PID-specific uprobes.  (Kris Van Hees)
> +- Allocate the buffers BPF map to fit highest CPU id.  (Kris Van Hees)
>  - Change the "stack skip" to 3 for fbt (fprobe) and rawtp providers.
>    [Orabug: 38776929]
>  - Fix prvname so that both rawfbt and fbt probes are seen.
> @@ -240,11 +240,11 @@ systemctl start dtprobed || :
>  - Do not convert "__" to "-" for stapsdt provider names.
>  - Fix printf formatting with non-monetary grouping chars.
>    [Orabug: 30430270]
> -- Discontinue -xversion=V as an option.  [Orabug: 38615307]
> +- Discontinue -xversion=V as an option.  (Kris Van Hees) [Orabug: 38615307]
>  - Add the DTrace Tutorial to the git repo and install package.
>  - Add missing documentation:  trunc(), stapsdt, usdt.h include path.
>  - Update LLM context files to forbid "if" statements.
> -- Test suite weakly pulls in kernel-uek-tools to get perf.
> +- Test suite weakly pulls in kernel-uek-tools to get perf.  (Nick Alcock)
>    [Orabug: 38064413]
>  
>  * Fri Oct 24 2025 Eugene Loh <eugene.loh@oracle.com> - 2.0.4-1

