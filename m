Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3543B287504
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 19:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752695518; cv=fail; b=kMvc+vOmBnU4BIi4/5VjgRUk7gz1cOjVhZI3mH6uOpEPQxXigCZAKc602DusaAVv8+omJFwdW0IZ37rVpPgf2FFaOPHVqjoznJjxAiAqeH1jPKCdrpF1gm5m84Dkutnxacem+/YmrmuLNsTwOxKZRuwxZd/YARuo2Esznrg2CK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752695518; c=relaxed/simple;
	bh=IQFA9WpiYmUCYGQGkxce0iGsXOLltp1LwiWmlnOiCvg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ODSybQ9kRlV5AypA2ttsGR9fr4UmGxIdRxceW+crgp8XQbY/r56KkXTj1k7JbnEDdL6WV6edLX453YnLUhT2SQ0lpfNf5pqub9n2ZHDnXGfVl0YlIPfileaXKztzJt8r3c3SKJMK8QFUlXxNsq/jT/sr6F7+NUpT8vtgmEbOJ6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mc5JRmgv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iiA3msSG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mc5JRmgv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iiA3msSG"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GHfoeL028678
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 19:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=1X0p3AQQncnKmnPTiR3yUCKo2fpl20b571MgPUl/3+4=; b=
	mc5JRmgvj7jxBot5m/kff13S/U+E78icx8la9M6QSgpHqnXS4JivPhBlbZ8Z0edU
	48hXvI4JuWAazYdPrLNr2aW6gwO6Say01XZYL26b73WGUEnn0uHO6dqxQliwww/d
	K+OgCeUVxWEN4oeAGTXjSE4ol0a6I6OKNJhJng+YK4L0//g8d2BqV8K/RK51ZnYw
	rmXQMTyHGOBn093w0ceZL+EdL5Tyu047x91NZcdsg2VHEvSL/q38PUFiiD+oVnGE
	zIJvsBtNAQkY9KTT5IHBGqpaPp6LMBwgGXi2nPKZV4TDjc9l15AlEiaZOwCyiwHU
	Dq7r68SOUYCg8m1LcC5ifw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uhx81vux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 19:51:55 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56GJal9F013526
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 19:51:55 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5bafbd-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 19:51:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gz43nIvbVVIYIJIi4+vCIrLQ74fULbnnzVG2nydRvfUPmkl9SRI4M4pLWNjh3LJkgYz6T9Ro/POhc7Oa+n3Fs69DIeP4USBMeru2UJR1s+NfL0Ge2U4o8UuHUC+QI0r5lcSoL5qCtysxvPUEqE4lMO2f9XClDqpYSufRUUwb3xN4mpO/D/q+RpOg5T8/Y231Mr0XprNtmheQ52ap3LTe1ZWhFQaMSBA7tyRGUlfU2USivDW+JiJfzct4Rdyb9Vs0qsiRyjogYwHUO/oxuzP4mdj43B44x9OnvZYRS1qpJnUBZDbMu+4KQOc8gD2lsYhIrMzMGrA6c/1oQ8AxIMJcGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1X0p3AQQncnKmnPTiR3yUCKo2fpl20b571MgPUl/3+4=;
 b=Uc+dLP9bcBRAp+zJSH1zNlkZxdmgRzPZ9goIRHA7jZEMpJW08Md4DEuJzVtaaX0OA3VyAuFQLTr4BCorr6Qvz+QV+B79n4tp6O0n5c+cDoD0td6vLNFh96RkX3Fxu7Ub+a/vxmh7UVyd9OTnxkqdho6DeE45hXDosxJI6xiU+IJIiEvD6384SqijK66zGJrerUG3a+itQuMk34T3fNYFy7zJ/BYv3McrJ+GLe4XdpcgKBQKRXExCOT7DfhfkUYDaMxOdPzD8NzQZ0svGWJxNpHlxiP96jYMkkAiJc9sVpcFt/qIKhOcqvSrF2AEV/wP20toA4kXMIW889H23VRz0PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1X0p3AQQncnKmnPTiR3yUCKo2fpl20b571MgPUl/3+4=;
 b=iiA3msSGIIQiAB9i8lbO1coIoKXTVGbsVGtOlqoEvUllZwh6RZkeEM663/ahHhrpYnaTQRL52nDyEx4EkINzUiIc7Eh2fnhGbVU+Jwld9Ed1hnyuiXBz6hxbG/HA2M3yPguzJIQWvfgpy8YXGaT6XDEzIvZUn/4qD/0ruoSIm1A=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN4PR10MB5637.namprd10.prod.outlook.com (2603:10b6:806:208::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 19:51:53 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.8922.035; Wed, 16 Jul 2025
 19:51:53 +0000
Message-ID: <9dedd415-965a-882d-806b-495427187938@oracle.com>
Date: Wed, 16 Jul 2025 15:51:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 3/3] test: Mimic dtrace arithmetic more
 closely for avg/stddev
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>,
        "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev
References: <20250501182252.27772-1-eugene.loh@oracle.com>
 <20250501182252.27772-3-eugene.loh@oracle.com> <87ms94mfrm.fsf@esperi.org.uk>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87ms94mfrm.fsf@esperi.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::29) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN4PR10MB5637:EE_
X-MS-Office365-Filtering-Correlation-Id: 91859b8c-19db-441e-5b78-08ddc4a23660
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N01aMkhhbUVPdFFIaDFVUEtRL3A2L29UcVB4cXZPWmxtVk53SkxaNW13ZWpi?=
 =?utf-8?B?bEpDbENRN28ySmNhMjAvVmg4VkVJblovaXJoMG5vN290K2ZPSUNBZmlnSzJK?=
 =?utf-8?B?b2lUbE1GRDFGbld5MElxbVBEZzlINlhIcU1sRjJBZW1MVUVLQUUrb0hHWmZI?=
 =?utf-8?B?dGk1NjhXUncvZnlTRVRtRzBhbTlrOUEyWXJIT1UzcjFpdGxOM21GM3EyYm9Z?=
 =?utf-8?B?dkdXNzlhbXB5UVRQQmxGNkxKckpIZkdDc2l6azRTOGZ6elI5SVFma1dWTVVQ?=
 =?utf-8?B?NXF1VlZQcTVzNUJNTUpTVjRqK2RJU0RTOUtiS3RxdE4wMkRsREZwZGdLUU9R?=
 =?utf-8?B?KytmRVdsSm1NWmFMVHN1bG5jbEpsMU92TXBYWDQ0NE5DemhWdUNFZk10M3hO?=
 =?utf-8?B?dVFXdWVwemd3ZWxtUFpQeFRZQnorWi9pcHNsWFRyM24zZUxtK0dUUlpreWJI?=
 =?utf-8?B?NkpDQzk5VWZFdmlEZW00Wi9ucm51OXFldTJaTDNCdFErdVdudFVVaTByY1VD?=
 =?utf-8?B?aDBESlFIQXZjV0VkMHk5NUUybzNFcmJGZEczMkpMd3JyQ2VmMnFIWm01WGFQ?=
 =?utf-8?B?TEhDeHlURHowSjJseEdNSERpQXhRQjhrMVB6SjRBS090Vkt2M0NhNVkwelR5?=
 =?utf-8?B?SCsvTTVuOVNvcDUwd1NmVTFQMTNZUWF6OUZ0THBiQXVwSmp2VTRWYVRlVFhj?=
 =?utf-8?B?S09keXVOa015d0xtL29JbTloK1AyQlJ2REh4M3FJdnZBRW9aRXVzZzh2aldX?=
 =?utf-8?B?UnNMcm1KdjBUbmg0T0Z0TUdheFpRMmovNnNIa01uM1NjbFlGTHhYYXcrSHBQ?=
 =?utf-8?B?Z1hmeFZCNlZRVXh0Q01uQjY5aUtqOWxONnN3YU1JWkpPZDFRYlhYcnFPVldj?=
 =?utf-8?B?SGcyWDZySjNZamMxdWgvRTloK0QxRGdEbjJXeXRoNDdaT01DS3JoTklPcUlK?=
 =?utf-8?B?Nm9Ia3NwVmErRkREbEQ1R1ZRdlVBRXIxT2gwL3RFVG9PbFpBSDBhU2hhY2k0?=
 =?utf-8?B?Wm9JcDhuVVlGa2RUS01ydG9NZkJGTXlvN3Z0Q21FRUQ3WW13WXQrQitDUTli?=
 =?utf-8?B?NmM2QjFQSFhCakwvTmdkckZpZ1FkOUkrK0xUZ2x3WWJqZjBmMm5ZNWFpcUx2?=
 =?utf-8?B?bFQvZTdOWkt5d2w1MjBTeldOK1dlbzNlcnFEOXZmQnRJdjlzNnJvd0pPZmZo?=
 =?utf-8?B?N2wvRWREUytpVDlYU0FTK1l1NTJvTytMbWxNMkN4aUF2TmJsU1JlK0lVTURV?=
 =?utf-8?B?R0U3SjdzM2x1ZlJEV3NDWHphMkE0em5tRnpxNXRWSFZEK2dGS1B4d080dDA1?=
 =?utf-8?B?aG13b3BtUWJMS2thMlp3L0ErNUdPVURwYStrbE1ndk52LzZsOEhOaGNCaFRP?=
 =?utf-8?B?OFVLblp6NkIxaVN5VngvWHk0bGpiaUhMY2JSL1lJTkNMWTdjcjRKMERleXdu?=
 =?utf-8?B?RS8rdTBiazl6VHVQMzVQdjNoY0w1aE1iaEpndHNDR3Y4Y05BcTRoQjVHUklJ?=
 =?utf-8?B?czUwWStHNGVRNTQ3SFViR1JzTDVwV2UrWHduV2dyRDBrUTJsZ3VoTEZKQU9q?=
 =?utf-8?B?b0hNejdZcmZla21tL3BncHB1TVdrVUlIam5SUjNkUmR0ckJ3WGR6QWdFME45?=
 =?utf-8?B?YmdINDdYSjdwblUyQ2VWMGl0Nmdyenpxb1FNUVJOaXllR0x3UE9PaFQxbmpt?=
 =?utf-8?B?dnpyZnFUaWtsWGR1Y1J2Umd5eWRoTzloM09oQW95eXgvMzdSK2VBR3prTHhV?=
 =?utf-8?B?cnpqdVpudGsxcnlwTVNWb0Z3K28vLzdzZzVCeDF0TmZVYkFjakJpbzVxL3ox?=
 =?utf-8?B?UTdoQTlkYUI2WmZGOWp2ckVYRHJXRTI1Yzd2aEhuMHVRRTBNT1UzMVRtVmZx?=
 =?utf-8?B?Rlk0RDFvRWpXd3l4QlNoWFR1bzJOMzZCZEI0MG1lSHJQNkVhV1JxQVh3c0xn?=
 =?utf-8?Q?NibzbYeHUko=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2RkN1gvZlV6Rlh3M1dXVFd6ZitEaW1XdFJzN05aUFpmTWVxRGJQQk1UNVlR?=
 =?utf-8?B?M0IvTUdmNmFXbjJsMC9heDFLYnp4cGJKc1lLU3lWL0NLODY3cmwwOXpHRzZW?=
 =?utf-8?B?SEwyYklKU2tTNXdpcWVTRDFkL2xkSkcyeEcrNHIxb1JXUGNxdkEvT3hSQ1A5?=
 =?utf-8?B?azZNTG9NL2VWZkltRTJLaEVrRkVDZTlnb2RuQU9tREJqdHkrVmFWOTJaWmo2?=
 =?utf-8?B?RjNYeTVqTVN1bzVuR29GMkRVMnhqd3M3UjR2dEYwWnlwcG1zZ1FlVnI0eGd1?=
 =?utf-8?B?cEVlQkpucENrVlFuMjRoVGQxaUUxcW5TMTI3VTdNUEhrRWRtaXhQN2R0MnVa?=
 =?utf-8?B?MW5HS1ZtZjY1emU5Y2RUNlQxU2QzemN4c0U0bzZpZkJmMDcvK2Izam80LzZ0?=
 =?utf-8?B?NjBvOXVuRXF4SVJ6QTB2MUs0b2tycVZTUlA3N2hsSDN0M21CWDFuQm5aTWd2?=
 =?utf-8?B?MTFqTktWUXk2ZmlWZS9iWDQ3N2gxUHBndXp1TnFlK2ExaDlBMWhHZnJ1Z2Y5?=
 =?utf-8?B?NGRtVmN6clBpMEptMTU4T2xFVlprbkxoaXlXbGN2dmpWbWRsR1RJckl6Z2J3?=
 =?utf-8?B?bnE0QXgxS1QvdDhMeDZVck1ZQmw5TTJ1M3ZDWmFJdzVXSk5uaUNHQUdUaTRv?=
 =?utf-8?B?bnRRVHZkNlZFVFpSMyt4QldhZ0Y3SjBRdTFidW1CdWN2bHJ1UXlCZTdhbUpB?=
 =?utf-8?B?WXBKVW1jcTNObGJZVVdKR0c0clJrb040NmFkSi9jUHNaODBncmUzS3dPR0hZ?=
 =?utf-8?B?OW9BaHdwSUpaS2kvZUIrVnpJRFdId215QUoraUZOQ1FVYlRycU1jY0VGRGJF?=
 =?utf-8?B?VmhnQitWV2RWblJJaldhWHZGTEJ3ckh4MDJJdG4xUWNmWTlSMEFsZERiRU1y?=
 =?utf-8?B?dW5ZL1pPKzdJQjNvTVNGWkc1Y0NTWGJUM0ZzTVBPbXg1dzI5VHBNOUR4SnB0?=
 =?utf-8?B?aXQzdFd3WWpnRm9NbG5MZ2pPWFJhZW1rcG5FSkc0ZHdsSFpHR0IxNCtTbHZ6?=
 =?utf-8?B?bWJxZ2VnUmVlSnIvMXhZYi9xV1NjTm13ZkJwSVgrK0VLSmVsUkRDenlkM0hy?=
 =?utf-8?B?cUpoQmRwVzdab1BvVjFZU3NvZGlacDhLQ2xyeFJpRDVEQW9pV1dXeTJIVzEx?=
 =?utf-8?B?eTcxYnRpbGpIdjdLaUhQYUpBcUZuaWJheTlOamRsS1V5SHpXTmQ2OFEwQ0po?=
 =?utf-8?B?aDQzWnAzd3g1SUwvd3FuOEw5azVpR1NEWTJWbFJxWWtudmVEWjhzSXNlQXNW?=
 =?utf-8?B?TUpsZHh3dFMvQ2R2RFpZbWZTT1RUVmFMT2c4dTA0WkUxdGRoUHdlVGhpdGZW?=
 =?utf-8?B?TlkyZGF6MjBRNzQvekZtS3hXYWJ1ZDZFQjZkTXlHbjVPdnBzdXZ6TzUxN2tB?=
 =?utf-8?B?Y0toUWJhMnRXOWFic096dTEvd0lqL3pLbmIvSjlBb0o0ZUp0ZVk1MUVITjFK?=
 =?utf-8?B?QnpTbUVMelVDOG96NzQrQkZBR0E1Zzdrb1NFMWozWkJTaUdkcFRKVGJjTHlN?=
 =?utf-8?B?UlRSb252MFBlUmkycFd6Zk15OHZFQ2RoTlMveTl4NWE5RkpFeWR6RGN1Ynpj?=
 =?utf-8?B?QXgzbEMwVzM2OWZPS2VJbUlvaHJTNkp1OFBYOGhMSXl0bUMzZlVpN2R5RFNz?=
 =?utf-8?B?RVZoUlozS1dOZDlmY0xLdzkyZWhtcVNlSCtRbStPSXdjQ1RxdWlXUkpubi9X?=
 =?utf-8?B?Z3VEeVQrRGZnWXpWdy9nMkYrK04yTkU2T2xRWHZOQzBWbCtpTjgvdGFOL0V5?=
 =?utf-8?B?N2tZcUR5MjA4ZVdHS1RpWU5XSzZydmFUQnQxU1kwaHl5RXZsMjQyYTZ6WTVu?=
 =?utf-8?B?OUlnM3I2algrbUcxc3Z6V3JmRUFNR3N3Qmk2UjdsRk12MFJJUjlwdXI3WE1o?=
 =?utf-8?B?OENuWXhNMTlIU2djYWxCL09YMW8rc1pVYStEbmQ0MG1xTmFrWGkwdmJuQ1cx?=
 =?utf-8?B?R29GY09wYktOS1FrREpPZi8zcG93Sm9IbFNkRjJYWCtQeHF4ckJ5Qzd2elYw?=
 =?utf-8?B?WTUreEJyeFYrL1g3ZGZxang2Vm1qbTRDYmVtcTlLWUNKc21qeGlDVDJ1VmRv?=
 =?utf-8?B?R3ptZ2VtVkgyRk11MkVxNlpNc1A1c3Y5YVdOQmZhVGNrWUgrelZGYVl0S3Bp?=
 =?utf-8?Q?rfHOWy/iuHjvOytgQLM1YnDcN?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZLbbB4xvwcbmUPUf2a8/1fxMUjKWYuzxRq62XkVkWBYhWVbrD0c8Tpahu5mRjmASkj6Z+kwyaoPG5io6BnX81zW56TDTYflM3mRY64lDVvcn0A28ckuCfCLkgYRy5wr1L/npJ4HdeQ1vRAigpKg6HWiyQgi4I6LTefjnBIIO+bK6wX45M+vUovF2d7OYtJfuqGtMYVRp6y0OW0rlz2zVqj2QGGmZo0hm0KHw19KkfliXu58nTtYmrnk1FfsvIfEpDxtEvh94d6AEdQEJYVGM0l6OZiO1l45xVtCbGPr5EuoQ+XGMkl5etmVuQ2tgXy1Tgm3pOVy0+QBC2Nqfjnt5u7Z9FwR07j+JCJLEYocs+nmMjuieG5RIJX9Mr30oGZgFbK/6TkxSbA7v1SInVzEBIT5h7wc+gqj5E0JSCVnsL+hLR+k5au6f0TzRh3Y8/uB9jxwU7LP7pB5+9VvPmXHE4wRYUse7XdbrWWAGP2ORpBUbZoa+vybk95nUQCdpemQEsWsZNKpNXS2PBGD0RjB1F9xBw0jJxMQEk8OfDmYUJ6bzyB4b7Df1u0qaq6dp1j0aiA1MUscCnliJb56gdwISn8eZO1cNduXtdmI0JljiB24=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91859b8c-19db-441e-5b78-08ddc4a23660
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 19:51:53.4346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IH5EOMAj3nZndZUzNnzc8Sc9+uOVbsvcfCV+244/YqidTNq7fyEs0YD8QPaNJJfXxaLn9tbhVxtgxbgPQYE4hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5637
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_03,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 malwarescore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160178
X-Authority-Analysis: v=2.4 cv=auKyCTZV c=1 sm=1 tr=0 ts=687802dc b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=CxI4LHgMJBeAcpYKyeEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12061
X-Proofpoint-ORIG-GUID: 5Pt6erWOlkmAt8yJi6Gjy3Y_OBX5Z3QF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDE3OSBTYWx0ZWRfX7KHHKqY+AFdD LyiW4LhAC/kOqLdVIKFpkCdcJsn19Q6iRoP5EMJZSKVikAAtTf9oiqMVB+ezSSJlqiTArCUEHJf UMm061ldqYGhbx3oHqlAvn95218tG4h+a1Z2tUQwEF9pfC+lQQcjHjFe9NTH8TGiTe4PpchPqSW
 wbg47C9Y3M5+ceoBUJOvG82mgi0y3Yjk/MFpWxCxsSdRxTT1oouoH01TByGS+lbKFG/mgPXujuX junKrx9Mv9FwcKRC8vF/sbhCm6MxoGBNYBXDbK4XnOin+zgw/WHQAXCf8YcUl7hlZQaU+oUYA7a UrO+Oai9AmmdjkD+Rpwq2bjxx2g3iDU7nxtIHzPIc0tSHHnVNXwGb7aIwHGQrzg+vX0LnxGLDaV
 E/VCljA1qe4OHLZWz/NmGBO1AEONbTcesSzats3tnu6b3+yiBCVaBQLhJeOnp5zLAEl2UhNc
X-Proofpoint-GUID: 5Pt6erWOlkmAt8yJi6Gjy3Y_OBX5Z3QF

On 7/16/25 09:22, Nick Alcock wrote:

> On 1 May 2025, eugene loh stated:
>
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> The multicpus test checks that data from multiple CPUs is aggregated
>> properly.  Operations like avg() and stddev() require division.
>> DTrace uses integer division, while awk does not.
> Oops!
>
>> for example, CPUs are not numbered consecutively.  More typically,
>> there may be a problem that the profile probe is not firing on every
>> expected CPU.  So a test failure probably was a sign of a problem,
>> but that's a different problem, one beyond the scope of this test.
> ... is there anything else that tests for those other problems?

I sure thought so, but I can't find anything and the obvious place to 
look is test/unittest/profile.  Frankly, I thought there were some 
"quality of profile" tests (like if I want a probe firing every 500 
msec, how often does the probe actually fire?).

>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
