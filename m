Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB14380FD6
	for <dtrace@lists.linux.dev>; Sat,  3 Oct 2026 08:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791016942; cv=fail; b=SKyTNaAPhVVBrpqUkphBhGyXt/Yk+EHd/5BsIAPRtejMGetUSjMD5NhWXDF0Wa7quyMJZSRQlU7xXTRlw4YQLZI53+0Xp74E2MH5mpj8Tu+xS/9EShKtSdAFTS+d0wh3Qal6W2LW5vKL3ofelD7nBSQZf/oFJ5nzeimGMlq8h4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791016942; c=relaxed/simple;
	bh=JXOj7RDSTsrVpSDNyOFx7FTDH4sCTa3F15lMaGTZYZs=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ukf0fFc3/i1nnWueDaBecmPqYrbBrnd4WWLWIfYif5vkrSOOGZdzAcJqReINqb5Jm4stQwjuJ2XYF5hasfEZX8WEmBc8oolqnh8EoOITUoFBP7BduBqgYzIBKTn/yYsPr0ubEIXLBe8cvVEG6BhTd7OQVUbSLG4xp2HVx6xmuQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ifT+FtWI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aJhcLwaB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ifT+FtWI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aJhcLwaB"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6936C2x33080400
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=taMbgN8NJ15UZfAc84rHhTAyJex4OGZNGaKQTsIqetg=; b=
	ifT+FtWIETUd3Xr90ZXwc4LFDjOwGbYRxsF9Hw6SacseDQ9qLD3kU9jrDZAX8d1h
	Mr3LJ2t/Y77jLIAXG4JJecKNlo2t3031/ypdBRrfNuLCAUhoPXPcauBppaJD/ulX
	XA8Y8OHtzsuh6QkWmWHnAUYQoC/r1Bleq/yIoPuwRoiiwiC9GxExIBAYGE6+QBdw
	lpry6EOP8UbuO5PjQb9uQWxZh4XUtEN59JXEaarqjNQqOdrnOoX5bhiGziCpzqI9
	XszukCkqnPhc9JC7duivAl510Y2xkGm3eFHVwZ8em/npz8octQzg9zBHkyhCF3gZ
	RmvypjWmzUcq82+gpHluPg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4h2r9xr552-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:42:20 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 6938ZK1T020500
	for <dtrace@lists.linux.dev>; Sat, 3 Oct 2026 08:42:19 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012022.outbound.protection.outlook.com [52.101.53.22])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4h2r5kwyh4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <dtrace@lists.linux.dev>; Sat, 03 Oct 2026 08:42:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kx/EHcg77ly8llBSU++I1wwIDopqZOLxdNasnx3ya9tpD8N3bit9d3XYKOzKTwZhmofYsNk2NNMoG4g0zfTflUvT8SmgsCVfRkP57/n/6SwMJq8Uhj4iN39kWJh2EXXIZyA0/5t4S4g7f4pOkTt+t4IqlvZHGxftk3yc7I+qGgc8qmhJUb9qNmGJdDLgOn3TAof10iiUughiWXp/HpCkC8F57Hy44JoMJ1PSgpj7ag0eSUMGW0LCnYn8mGcUkBnYpHpTL92osz336451l+Y5nWeS7/t3Y9o1Ie37KJGnbfXcWarpputa3/fTKNz+Y48QLdRugU8oUmo6vKAsErWE4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taMbgN8NJ15UZfAc84rHhTAyJex4OGZNGaKQTsIqetg=;
 b=th5RD9W28j62DM2V9JvHSdJWyTU6ToFliZO113azS/jC8gXfIu/gof2TjL+Zy6RqQMELO2Q9Kk7Sm9OG2pl1tJabyXy2H4dbYytz9kAWaXOVxkUgtPkZFgviyZoy71G1Jtg5ZrpjvpL/WUMtXuXZ3lnldBQDhcU+QYssam0I5bR3A7WD0LXyn8bUIsK7GTpBHTrUL0qF7LngArwDqSrdt0iBKuWzoDYWKK0N0j78XTwjYPzfIwavwWvDPKVhG4skqWMFxsZzhALEZ1rQKZOUtOqG39N10Npzo04Z/I8/jFOMTC6A7/sgTWAGqjygrNCVwWyk2SVLyR8iMbcwxVx3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taMbgN8NJ15UZfAc84rHhTAyJex4OGZNGaKQTsIqetg=;
 b=aJhcLwaBKfbEWCWkpGx2qqQTeAeu5z4sG+GuSIlvsmhWSy11hkkHBTskmKzn0VviDkNpdS1B5JYlXkFOec5eP4GNVUryr008CwegK7Z0WhI7PRmCTK6/S5zMd2dkfk3ckrJcliyklPYuELG2hEB1QyMavJC67DuTX5sG4J3j2PY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from BLAPR10MB5075.namprd10.prod.outlook.com (2603:10b6:208:322::19)
 by CH3PR10MB7680.namprd10.prod.outlook.com (2603:10b6:610:179::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.13; Sat, 3 Oct
 2026 08:42:16 +0000
Received: from BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6]) by BLAPR10MB5075.namprd10.prod.outlook.com
 ([fe80::8f5:4de9:81ce:f5c6%4]) with mapi id 15.21.0496.008; Sat, 3 Oct 2026
 08:42:16 +0000
Message-ID: <49f86339-0ba0-4843-acea-4f7e701b8d76@oracle.com>
Date: Sat, 3 Oct 2026 02:42:12 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH 7/8] test: improve kernel read and
 subroutine coverage
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <8b9d322753c7742be97236428c026bcb@oracle.com>
Content-Language: en-US
From: Elena Zannoni <elena.zannoni@oracle.com>
Organization: Oracle USA Inc.
In-Reply-To: <8b9d322753c7742be97236428c026bcb@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0024.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:354::7) To BLAPR10MB5075.namprd10.prod.outlook.com
 (2603:10b6:208:322::19)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5075:EE_|CH3PR10MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd7486c-0ce2-45a6-a23e-08df212a3a8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FVcaOkqjImL02dP7Q5/uZxZSuAp7m5ALTKrtoh+j/vOPu3HY5a9yZrpZQXu7HU5hDvoHGwdDvtUwSfgyi17e1+2XRHJtTN+5xM7PZwUta+JNV+pr4LsQL1wK307nUs0jFTaumSovvzeQWZbJlEMfy0KpmvaauU+/fOIPrRCq+BcKcENWENBLmKqeVjnv+Esu7hAAPi59X8h1FIS4Sci/7NwR24/P4fhgNkXfvFkT/J8DaKrCYptByhzQv3zJrZxutLcjYETEi9vVGq0nh3UPjgAh00M70Q4DPyKwWTAk93Nc4+k7sJrYANjRkb9sTTdG65nt8Z6DtO6Sx3KgnRmbjKE4zpg5Zk5xhAeqFsjhGdobLcnPW0Kxqh2EyXEKlXfiiawwYmaytk/hE0VzH3TQyoFZutEFoaV2yBaMqQ6okcKasSOBra/zJHlIDGQHncVDJ05pBvSUMLAVGBUE2h/133l2tJRYdkz1RTxq7iOq9o48F3QHkBBTbY8HQm1cAUfcrt8Kv8qSaJUe9ZDVeHEg9nS0Sy0hyeXkUGVny3ZrEsK/ffSFoB5diqOKo3rE9MBdyXTofBcvPuHomkSsCFbRmg7iLACj8PUG73zBFKDCnyHHDi3SQ5/PYV6nYlsQdsmYmmjqBCtO8x4dyNUkig+4xnfhx8lQx2LGf6x+9iFxAJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5075.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dStaZzFkNm5uRHdJZE95c3lWcEhVUHZpRFY4UXNYanBNOUZDOUtUbW10S1dl?=
 =?utf-8?B?STBONURnMVFLZ2FDb1hNR3V6am0zaHQzdFNzcnF2L2E4c1NEanUzZ0I3Q1dx?=
 =?utf-8?B?a0N4bm1nUEJtQXFURWNoTG45TFJ1VUdDdkkrQUlmK0lyWmt4N0JTb2ZXYkZE?=
 =?utf-8?B?NXdYUFFPNnVNZ2hCeVVEZm11MUR1Mm45cWJaMTh5YzFTUnNnZUF6WFA4ZTAr?=
 =?utf-8?B?ZzQyMUF0UzMrdUsrUWtSYnJSRXZLNW5XQ3dOd01DM2w1OWtmd1BVa2dpYUhH?=
 =?utf-8?B?alFCSzFBeE01d3JjandEQW8xUjdjNUFjc0ZVUHljc0dzTXg0Y3lsVG9lMm4z?=
 =?utf-8?B?NExXT1BGRHkxY2RzQzhXak1kSUIzRi83dk1WWjFVcWZidFZzOFBHbkNMR3hQ?=
 =?utf-8?B?UjU3ZDNzdENVc1JxWGcvUnpwQzI4OTFQNDI3bTFCbEJMeDlFTkZ0blJ5bk00?=
 =?utf-8?B?T3B3aFU5VFh4Si9EWFVKaDNSVXFBc1NKL0RnbVd5T1JlOEJONVpHc3VtSkxT?=
 =?utf-8?B?UmJPMVdwY21zVWdvelFDbkNEMHZBWFVtZk95czZIQ2JDYTZsOVd2WEhPSlYw?=
 =?utf-8?B?TGF6dmZuMDRuT0dtVXlNTkNWSkhGK0lIOEJkWUpLVXZlRE9rTnVmTFJTcjJL?=
 =?utf-8?B?Q3hJeE9iT2paTTlmUlYwWUE4eXloekhtcHZPSXpHendLc0VNSk51TzRWaG80?=
 =?utf-8?B?ZWtFcmJYYjQ3bzNjbFhYUXZyNCtiTVFHZitESy9Mc1RiR0JDN0hvOUxMQnZD?=
 =?utf-8?B?SnB6NEFUd09NVVE4QWRYbExRNnF2bE5GMS9EQVlYa05Yb2F0Vjc2NVNuY014?=
 =?utf-8?B?bU5kNXBlL1ZtZXN0eFJPRUIxUTdNcFlBWTJjTm9WRzR2NTIxYVJndjZJQkYw?=
 =?utf-8?B?VURPQUlsT2JLVVErSXpSOWMraFVEekI1RWh4dktGWHhkdlNuRHM2K3lXbDlB?=
 =?utf-8?B?YU9Xbk44ZmtaRHI0MXo5NE10WTIrV0UyNVhsRlJBTGFwMFcreWdkRFhvc002?=
 =?utf-8?B?dUJ4WGtkMCswYWExZTVCRnZTUWJPaGZOQ2YvK3NzdStiNzN4UjZpMWU5ODZs?=
 =?utf-8?B?eUc1aE9FS0VybCtUYS9ZN2tZVDJuQnBaNFZNeFlraG1CM1ViQ1F0M0t6MWp2?=
 =?utf-8?B?ck85N05pM0Rud2xhM09zQThhSVFIajRoYWZmaDRqM3padDBnb2VBejJnYjZF?=
 =?utf-8?B?aFVyVDRiMWgvcWEzcWRLa29acERzUkc4NW1Na3dLWHBZSFM1SDV2S0hGbStt?=
 =?utf-8?B?OU8xWjIyTEFpNXgvcGJvb3E2SG9JTzUzWFpob3dMUHpZUzhUOC95VWtmT1pl?=
 =?utf-8?B?eml0WXY0NkZieEluQlpCaFJ2ZFJqMzI2L0I1bzFHWEdiL0RYRllhSFRENElJ?=
 =?utf-8?B?K1RpdzNYbHlnd3RBTmo4RjhsTWNaRnhOQ2c4aFhSekNiYk53QzByRzVtRFNz?=
 =?utf-8?B?QmxNUXpMYklUVjg3M2lRRjVxZkdEaXpNWXV0a2lXbHRoVGlucVBWbmltNzNP?=
 =?utf-8?B?UTB2aTB5MTUwNnVBL0xLMWhuVThtaHFTWWhZTmd4ZnpRYjVKbFljWDVyT2l6?=
 =?utf-8?B?NTI3T2hwc2VxVDQ1UUtIU3R4a3M2enNxMW5kWlBkeGtFamRPUFpjNDBWZi9z?=
 =?utf-8?B?T3dxaCt3dUwrWE82R05KNHVGaGpOVXBPeHptWWVBdVYzeWtVQUtkVWRxS0dP?=
 =?utf-8?B?dDJ6blorSlEyci9MaHhKanoybitiSFJKWmhMUHp0a0h1NThFWWhNVHV0eWVx?=
 =?utf-8?B?QXZUWDFaaXA2dW00cy9hRHpjaURuN2VYWWk3MkU5azhsYytyeWhsL2s3Wm95?=
 =?utf-8?B?SEdLYXpLcTBCQ2oyNlRvcFdWajByb2ZKNVQ4MHRzUTkxVjdXU1l4WGszcXV1?=
 =?utf-8?B?akJHTjlTekw5d1VRZ3VLc3FMK1o4L0lzZStWQW1pd0JKZ3ZGZDNzdDdqSHJF?=
 =?utf-8?B?QUpCYkdzMnhpNUk3NExSYlZkc1RjaVNQMk1STmdBaFZaeTFCYlBRME8waFhz?=
 =?utf-8?B?RlVISHl0TGdGdXRBVzExVWJ3b0tLUDV6R00rbkNkNStFMjNoTjMxU1VBbmpU?=
 =?utf-8?B?eEF3WWpyVVc5SjZIOE9xSXI0YzlFN2xSZkpBcVBaZVF1RHVzbUhrWmc1RGhI?=
 =?utf-8?B?OG01VmZhWEhQMkUxU3ArdXptU3NVTytHR2RHL1o0SmFWSXF0RG1HVkk3OGRu?=
 =?utf-8?B?QnVyZGFRamFsYWpKbDZlQjhZZ0VNSlZqc2ViR2NCUHhBekpqL3lEbEhKTmk5?=
 =?utf-8?B?enhwb25QdFNEVm1RUUVzaUxoRkdRdFlpTXRHSWdFSGVVcEp2Y3o4OHN2NFBJ?=
 =?utf-8?B?VmJlcDhySE1kRVAvRUZJYUc1R1djSHNpWWFvdUNPcjhrNHl6a0pOUT09?=
X-Exchange-RoutingPolicyChecked:
	d+yySyK2Goh6cajB55++5bUeBd+NS/LrOyX82q8jGRKrT74rrQ7cjorVMMv2gf0Du7xmJMkE9efdPr3Z7Fk934TK9+X6AlcifZONRHsvhS2afwPn1DwMdzQoYLeaLqFLBmflooKp2iRNxMlNTQx7JqoYc0qhayr433MVCCmxB2ftYvDqz8tI/AyNwrgRhBsqgsxpdZ4Etzye16SdDlOrr7T9HT3I7ySDgRpd90AEH2xa8N03Dy4EHuJ8+tM+NYgz+tCOx801tDj9jSF2P1MUsp8wBVB4bqwwvc8Imcs3LN4pMsD9IOOjApGSWXg6ZDE7PiLnbMFDzJZFMmuTO8Gf/g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	jU0xAHtQPNvbnxuwb+507esfEYiJnwrGzU48ESTvNTpre4Od3LY9vf7SRR1EVQ1MNGWLlopo87r/3FZFtzZOZg+uBEGp65v4zkPWsvQO5XgDInTTCXCFItfityo/1J7fdMatnm83KED9GmIwATJiFI0f+LH2byVMuRFET5BdGYm1WH+0xFoEh49h7MH2IKKq0vKJAri57u47SIjPkFhFxFpS2dX6I6+KfX3RulFjMJJFxeJubHVYfC+ZNe93+fVMIq4KOGV7T26d0H5rXLMhN2rGWewW4FMhyN5POywl3XmexUZtRs/dKPX/XQBWOIucL53C1vM0jXjI5LXBqvFx+7Eam7ujkKO721KqgKgitxzmvQf4AxRcnMrku9su+8zFIapxuC2TYUQGQ4m/fUysy8wlj1J0iui5zm9jfSyGzqwQwkoGASOSDgUwk3vBeJA8vMoOz6E250DJtUpZM3SaCfnrIADjVNTPcLSKd6bdfpG8y9HhoTuiEA5+A6RbT08cvqJ0LxucjUmnCKmb0EViwqBidgV8FswhGIfMubKPlWMET+cSH1D1brq6lni3+Z+oTo5/6ezV0nwodynYDd+JHBqXuz+XCH70rw1AH5RfK+g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd7486c-0ce2-45a6-a23e-08df212a3a8d
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5075.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 08:42:16.6592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZnsMKhq1vp4lGkyBL1fKTwX404LeXBvAYQsRgYqGKCJza8M5BssspTSMdcReJnccTilsyvw8vvG+zqhqflkQgleMeLdVHw6vJgrH9UiAsE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7680
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2610030034
X-Proofpoint-ORIG-GUID: JcAbWQD5QLZiHy_RzVWxwqUSxHR2bWPW
X-Proofpoint-GUID: JcAbWQD5QLZiHy_RzVWxwqUSxHR2bWPW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfX4e6FhVBb0jyB
 r68PQmF+NXWlI+Ga0/6h+c4CQPfwzggGIwLpoaJM03Z1bkShvcK4o8KVO+XCALX/GUOoQSj9Dqb
 8KZUj/yhf8uY02AAEje+IHzoc1/lBe83RvGBY52Vir1Uu6apE9fvaSSnXE9pZ7GvYvq0FTPT51p
 d5AypGtbzvvmSozNO1BzH/1bZGdSBXSE5JS6wnR/wmubTZMGdqqwK7i3HSM95ibYs7vqD041Pmj
 NmNAJAtSa0JBBoS6hJO8UVNLE6VNxrHi8LvqYks4uMC8FIRV3aQakSM2HEcSS7DiB6VlkC+W7TO
 Un77qRttjPsM9YwkJGUSssDSOTxLTXAsmSX3ZNbQztVOtbNRZA3f3NCPmq7hJgF0efFuyzExXhJ
 kj2/55SyRUteJcNrWK8HFAuR6FQ1lHmDhMS5YTSgQIHhaqmy/5vPwJ/YBQ4iXka2WcEWBNYV+9s
 odnl9FVjk+64fs+WSpMNIS5J9aZzV7vhbXOtb08w=
X-Authority-Analysis: v=2.4 cv=QbrzLcbv c=1 sm=1 tr=0 ts=6ac0bfec b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8
 a=N1i2jlqDsqh1JSf7zAcA:9 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12108
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNCBTYWx0ZWRfX87f9Vcwkf9N0
 isOy1w8yVNpTKtZYaBKSDUhZ76cQOw8ly2EsLn8bYsESipweh9B8fPzleWYNjwPsuBvO8HgqZBQ
 Kauz/t8m7LCV8swd+RbSNuxKqubT90FSIfmNB+SO5T+Y7Vk0h8KC

Reviewed-by: Elena Zannoni <elena.zannoni@oracle.com>

On 9/28/26 12:02 PM, Kris Van Hees via DTrace-devel wrote:

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  .../codegen/tst.kernel_read_deref_struct.d    |  1 +
>  .../codegen/tst.kernel_read_deref_struct.r.p  | 25 +++++++++++++++++++
>  test/unittest/funcs/tst.subr.d                | 17 ++++++++++---
>  test/unittest/funcs/tst.subr.r                | 13 ++++++++++
>  4 files changed, 52 insertions(+), 4 deletions(-)
>  create mode 100755 test/unittest/codegen/tst.kernel_read_deref_struct.r.p
>  create mode 100644 test/unittest/funcs/tst.subr.r
> 
> diff --git a/test/unittest/codegen/tst.kernel_read_deref_struct.d b/test/unittest/codegen/tst.kernel_read_deref_struct.d
> index c8ad5d3d..ca6b83cb 100644
> --- a/test/unittest/codegen/tst.kernel_read_deref_struct.d
> +++ b/test/unittest/codegen/tst.kernel_read_deref_struct.d
> @@ -9,6 +9,7 @@
>  
>  BEGIN
>  {
> +	trace(sizeof(struct pid));
>  	trace(*(struct pid *)`cad_pid);
>  	exit(0);
>  }
> diff --git a/test/unittest/codegen/tst.kernel_read_deref_struct.r.p b/test/unittest/codegen/tst.kernel_read_deref_struct.r.p
> new file mode 100755
> index 00000000..d45aefe4
> --- /dev/null
> +++ b/test/unittest/codegen/tst.kernel_read_deref_struct.r.p
> @@ -0,0 +1,25 @@
> +#!/usr/bin/gawk -f
> +
> +NR == 1 {
> +	expected = int($1);
> +	print "Expect " expected " bytes";
> +	next;
> +}
> +
> +$1 ~ /^[0-9][0-9]*:$/ {
> +	sub(/  .{16}$/, "");
> +	got += NF - 1;
> +
> +	for (i = 2; i <= NF; i++)
> +		not0 += ($i != "00");
> +}
> +
> +END {
> +	print "Got " got " bytes";
> +	if (not0 == 0)
> +		print "All zeros - read failure?";
> +	else if (expected != got)
> +		print "Data size mismatch";
> +	else if (not0 < got / 4)
> +		print "Too many zeros - check data?";
> +}
> diff --git a/test/unittest/funcs/tst.subr.d b/test/unittest/funcs/tst.subr.d
> index d97a0780..1b9a6263 100644
> --- a/test/unittest/funcs/tst.subr.d
> +++ b/test/unittest/funcs/tst.subr.d
> @@ -14,8 +14,17 @@
>  	BEGIN				\
>  	/*DSTYLED*/			\
>  	{				\
> +		this->ival = (long)(x);	\
>  		subr++;			\
> -		@[(long)x] = sum(1);	\
> +	/*DSTYLED*/			\
> +	}
> +
> +#define AINTFUNC(x)			\
> +	BEGIN				\
> +	/*DSTYLED*/			\
> +	{				\
> +		subr++;			\
> +		this->aval = (long)(x);	\
>  	/*DSTYLED*/			\
>  	}
>  
> @@ -24,7 +33,7 @@
>  	/*DSTYLED*/			\
>  	{				\
>  		subr++;			\
> -		@str[x] = sum(1);	\
> +		this->sval = (x);	\
>  	/*DSTYLED*/			\
>  	}
>  
> @@ -55,14 +64,14 @@ INTFUNC(mutex_type_spin((struct mutex *)&`bpf_verifier_lock))
>  INTFUNC(rw_read_held((rwlock_t *)&`tasklist_lock))
>  INTFUNC(rw_write_held((rwlock_t *)&`tasklist_lock))
>  INTFUNC(rw_iswriter((rwlock_t *)&`tasklist_lock))
> -INTFUNC(copyin(0, 1))
> +AINTFUNC(copyin(0, 1))
>  STRFUNC(copyinstr(0, 1))
>  INTFUNC(speculation())
>  INTFUNC(progenyof($pid))
>  INTFUNC(strlen("fooey"))
>  VOIDFUNC(copyout)
>  VOIDFUNC(copyoutstr)
> -INTFUNC(alloca(10))
> +AINTFUNC(alloca(10))
>  VOIDFUNC(bcopy)
>  VOIDFUNC(copyinto)
>  /* Not implemented.
> diff --git a/test/unittest/funcs/tst.subr.r b/test/unittest/funcs/tst.subr.r
> new file mode 100644
> index 00000000..9dfa4b0e
> --- /dev/null
> +++ b/test/unittest/funcs/tst.subr.r
> @@ -0,0 +1,13 @@
> +                   FUNCTION:NAME
> +                          :BEGIN 
> +
> +
> +                1
> +
> +              libdtrace.so.2.0.0`BEGIN_probe
> +              {ptr}
> +                1
> +-- @@stderr --
> +dtrace: script 'test/unittest/funcs/tst.subr.d' matched 43 probes
> +dtrace: error in dt_clause_8 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> +dtrace: error in dt_clause_9 for probe ID 1 (dtrace:::BEGIN): invalid address ({ptr}) at BPF pc NNN
> -- 
> 2.52.0
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
> 

