Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E9418C011
	for <dtrace@lists.linux.dev>; Thu,  1 May 2025 15:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746113822; cv=fail; b=hApWQt7CCQrOxo6QJDVRqxz1GViOSxy4Hl2ddL+VSj+mFggNKWojvg8RFUtuTVHznSeKV9iiXKpGgkpKo5Y/DSlToAEdXOXNX0zH7FGUggzelUTndM1YZ/Er/c6toLEuvPrpRkjjpwAuIsgGMJExQQHr/XXjxcIpCSvpxw4Z3Z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746113822; c=relaxed/simple;
	bh=R8dFaiY+OyrVsGi1qAn0w5mvpE2mopPZiMzWRiLRplc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sc+xeOjT4TYTon554vARaE2FrUuXHBp+AG+YEsw2wlG74jXfkvRMxAyczn4gsgBcwg8vtN1jTetDswLWEMXd/mxv48bHb765K5n2VXmyLrWsztoHe1iAxA5uH0JObfn+T1kDiSBYAM/P6DE2TnXMvigTKriINEGB+KsUYMoYfvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WK/XKQ1k; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mDk7PWpl; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WK/XKQ1k";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mDk7PWpl"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541EtsHp027619
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=36H88JySVZh87WuDVekWUld7LfqpTvAAnn+Pj07VZE8=; b=
	WK/XKQ1kwyGNTMntgCOwF7TBaGxWkBbJw3XMMRG+WVwB92t17fPGpHfT2GqFJvJ5
	SlxPDi7k1razfQbgSgS32ebVTFM1aVxQEncq4FuU9W1tcZnP8ZOEbUcf10CXlP2l
	n38Dv8PvjFrW6m7NSw0JTko+Vyn+T72jYv5vMyFjcHqJxQYB/hgQjlSUzuAGcPl1
	YY2F764901v7SAqbW/tcZfWfQrgTbZRZxMEkqGACBGU798cAGcEeK4dvOc19bPM/
	Ubb8iIsqdnDSKuMcZlaBd1N8s3XDYOkKM8cEp9vaaRkh8WbOqWAVGkPtYInWwuup
	P0u5OnQKIGJdIi+EjjlHOA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6uku9gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:36:59 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 541Evcr3035266
	for <dtrace@lists.linux.dev>; Thu, 1 May 2025 15:36:58 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17013075.outbound.protection.outlook.com [40.93.6.75])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxcefak-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 May 2025 15:36:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEJM2Q5L+MWfDjVqOo1ZiXCigiqgg55zYfPzBduTLdrF98eZ+CqoATqlO6lEZfTyjkLYsMY+TuFTZG5g0Khzu8eYU0Z73YNgjNAiNkMHSFNmyPJxtNX8t9Rzb+oA/db+ZJ5KlTwvic01hpEHSHXQkNaH3Ndt9fOa1bK2tO7h+uzEdMUweS6fs29erOKv4sYJR9uTBEmtjK0Pn6cNAHW3Scicbnv2lkKuQPwre015wP67TqA48tbRjZ+Hm0izgahA31wxIU4A1UEvWpR9JUX256czUH1bY8uyXTwBArT4WmotWy5qBy12+xKJiu0CgH0h1XAcxUo9/ZJ/Oq4minyIRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36H88JySVZh87WuDVekWUld7LfqpTvAAnn+Pj07VZE8=;
 b=ZHCqNr8MNjGpKjE//wmd1IdEzgbd7lunyJT6Qqvhp/uM+sc5UC1gLrjvEOrvn5ZJYSCVu+GMH0khIv02pjxu1AtfXFWKYfhvgjqerSlp3leV3tABixTBr5Ecqa0BJ3mmhA8wZ9NZqptq4M5HoeWR75rUwHuI2wtPRRiiv9DpSvW7te5D/lhp3dHpTlF37ZGMZ5Jo9TOTcnrio4Wk3kvlZkbXXeWXkLytsi49TpZ61dvU78O3PV6OUC06tE0zTlI7SKv0Ulgaz2MGp09kykuDe41LpoIE/eTDKKi0zObQyfyIl7tRP0i1iX+ROM2Afqbu/dARQ8mAYIluLU/PysZEnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36H88JySVZh87WuDVekWUld7LfqpTvAAnn+Pj07VZE8=;
 b=mDk7PWplehxvCqZvLS+FCHXu7k+T/wFDpnZUxvRfNzZmbL4V2uPqgntMb/DEMGlYUjmxwwzdvviWV1WkIjzmA6psD5YxwYv9xNEsr5MOTiNsrksqn49InCtjBJ83ffDeMWkhqZCbu7/s8c4akR2zYdXrrC1fldtx/Ra/58o2HYc=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SA1PR10MB5781.namprd10.prod.outlook.com (2603:10b6:806:23e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Thu, 1 May
 2025 15:36:55 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 15:36:55 +0000
Message-ID: <b5741b99-24d1-82ed-5cc4-5840230f3784@oracle.com>
Date: Thu, 1 May 2025 11:36:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 1/4] provider: fix registering fbt and
 rawfbt twice
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ5PPF7F7BBD994367C836098EA4820FC73C2822@SJ5PPF7F7BBD994.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ5PPF7F7BBD994367C836098EA4820FC73C2822@SJ5PPF7F7BBD994.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0153.namprd05.prod.outlook.com
 (2603:10b6:a03:339::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SA1PR10MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: b5754bf2-0878-45a9-b5f1-08dd88c600d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mzg0NStwSXg4ZmdjQVpSK0tlMXlqY0Z0UUZSakYveTBKZmprUEswSzBUNk9y?=
 =?utf-8?B?VCtuTlU5WUgrYzFXYWovTTRadTFPNEVzU2JqTFNZNkEzcUtEellmZmNrcE0w?=
 =?utf-8?B?V3hOaHIyaTBGc2VYTkFJckJlb2dJdjkvRy9CL2NQbjJHYTNTVE50c2R0NWRa?=
 =?utf-8?B?Z1c4ZS9DUTU1eVg5SDBKeTF2SkcxVWQvbGVqWlpKaSsyd251c1kybld6enhH?=
 =?utf-8?B?UHpZTDlXNzdyZldDS3lYRGR3OUE4c1hpUEdVSEUxTC9OU2VpU1dTRVJ0Qlpn?=
 =?utf-8?B?R0QzMnlZb3dxMmRtZHNmV1pZeTdKVGhvK09uS1BmOE80ejMweUZzblZVa0Jo?=
 =?utf-8?B?ay9sT0FUNzgyTVVrd2k4NEd2b1lDVll2ejBwOGNweURKMG00OGplbEU1Z1l0?=
 =?utf-8?B?K0FKSHRKZHY1eXVianUwandqQWpobXV5YkNmUjY2YXgyNk1GbFdjMVlseXZw?=
 =?utf-8?B?a05jSmJJVFBGQ0U0WUZvSEVESHlhZVg1d1ZGNU5yS0pjelR4ajlUMnBqYm5F?=
 =?utf-8?B?LzNFeG01TE5BbE5FQktpb0M1Z2hhODZxa0ZtK1ZaRlEwZjE1aFlQSXNqdUxm?=
 =?utf-8?B?MU9qVHBCWFV5UDlsOWlyQkY3RThCS1dZbTVhZWQ1MEM2NXRISmVPM0syYVE4?=
 =?utf-8?B?U0V3ajNxQkw4ekRIM29YRG4zVll1Snp3N2g4NGFXTGJ3NWVjVEMxZG15QVA3?=
 =?utf-8?B?UTJXay9nL0ZnSDg2Nnl1NXJyY2hIZDR4U1ZJOXZab3RudTlqS2Z0RHpFQ1JQ?=
 =?utf-8?B?aDVsU1kyOXkvOHNSRUZmcjE5ankwLzdRYXFQT1FwUFIzQi8wNitHbWo1TDRx?=
 =?utf-8?B?R0trUjhpZ0FKRThnTGx4RWVUYUh5UU9SUnhJZlJ1Y1VFaDNmR1pubkZtVkwy?=
 =?utf-8?B?Rlo1ajlRSXZwQUttUVJEYXlYSms5MlJPODAzK3VRUEJaSHZIWStDWDdWTG1U?=
 =?utf-8?B?SmV6MVdjWUdIZlI4RCt0enhxTXdtK1lCQ082ektZczNtRVh0ZnlwcWt1Z3VK?=
 =?utf-8?B?Q09vZnJkcis4TVZFZjR5QndMbVRtR1pIdVp5LzFaWHp4NlB0RlJLTHQ2b2k0?=
 =?utf-8?B?K2ZrY2Q1UnFxVU9nLzR1enFlNHU0WjF2QXZMb1VVblVjMFJBTmtEYVdveDBp?=
 =?utf-8?B?bTNkYjdLSzFjVzQ5QnFFQUd1aGJRM29iM3kvbDNCWC9XckZ6Y0dhRGo1MGJS?=
 =?utf-8?B?eDBOVjFQRHI1ZHB2YndrUGF3dXhvaklkdkF5d3R2c3RBcGxRNjViMkRqajdr?=
 =?utf-8?B?VDdtWVdXcy9qRm1tdVJVWVk1dXhZZnFEbmljaEI5a0pack5Mdi9hR3JFdStB?=
 =?utf-8?B?ZVR1S0x4dTdHVHVkUmM0YXFIQkNnOVhvU3VSQVVPTUc0c3VTcDc0WVV1Vmcz?=
 =?utf-8?B?alRhcVV3S2srQk1hME1vcEtVSFRzQy91dlFmbTFLOFMvM2J3dU05UmNQbG1R?=
 =?utf-8?B?SWQxeEpsV3UwYWFndzdOaldzRGRidTVnMXVYNTNyTWtVODZwNndSSWQwNUND?=
 =?utf-8?B?bXMxQ214VDBnN0l3cWJ6UlB3MzdQbHR2QVpQQ1ZmaHNPaEUrNU9lRVZPbUFZ?=
 =?utf-8?B?K0xPd0ZCRy9EN28wR04vb05wczN5bi9FNTdWZWRkcmFVUmVSaEVWekFEQ0ly?=
 =?utf-8?B?cktWMmoxck83dXV2c0VPTzJzSnIwM21zYmMxMkdGaFk2VEgwQXBINjNrQnVu?=
 =?utf-8?B?NDdRbWZXUHk4WElqQ2FzWStVM1hScnJ2dmprT05zQmh2WjJRa1pWdTV0REFB?=
 =?utf-8?B?REJsQS9LUnpRaU9naGFobmNuV2RJTExoUmZiRERLZDVRNkpzanpmSk83TEFE?=
 =?utf-8?B?N0dkU1UxUWNSWlBHL3M4U2tQNmNoQ1JrRXo4RW5xUjE3bXFXQ3hKZjR4Q1ZR?=
 =?utf-8?B?bWlEV0oveVhPUGl1ZkRZYm9EeFJ1Tm9DdHMwRzJPTVRLRjBNdm9pWkhHV05J?=
 =?utf-8?Q?RdjHoLOey1E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXhIUEVoQUxZcWhrTWZnOVNkaTFGczl4NFhWaVVnck0wbi9iNlo5ekNjNVha?=
 =?utf-8?B?NHd4emlvWnJZbFZnWDN3VXdhQkU3V1RhYysrTzlOaVAwcVAwbk9JRXFuZ05B?=
 =?utf-8?B?NXNWdTNucmpxT2dveXErcEUwR0Z0MnhxWU96RzR3UXlyODg1TGlSa2p5QnRZ?=
 =?utf-8?B?NnhmeXhidVNIL0hXck04RlU5b055Q3JuZ1hybnF0RTRKWUNscmp4cTlFYThG?=
 =?utf-8?B?cUJTTThETXpYNEwxUzN3bnZrL3ptd0R4cG9rTGhHdEU3OGZ2SGhYMENSbllo?=
 =?utf-8?B?WGs2NVhSNVRXSDdkS2xFWjB2MVIrRHVLTVgzdllsR2hXNGlhR3U0WmJrODZn?=
 =?utf-8?B?eEhlVUpoMHZ3aE1HeXhoRTBZNmNoc09iZmlkWWFVR2RFa2hEOXd6UVFsakpK?=
 =?utf-8?B?cWhJNzZaRmRGOEdWR3BKUDNKVWNXMHZ4ektPWHdXcjNpNU5oelJ3OWpQY2tZ?=
 =?utf-8?B?OS9ETW83dEc5NXlCQ2FhYUp3TTNqTjZvMDdpTm5JT2UwaHBVNjc1djJWblhP?=
 =?utf-8?B?SGFsQXAxbkxZZzEvT3BHY1ZGcEd1LzFhUklJWDI5VXhCNFZmdTR2aXo3YUlF?=
 =?utf-8?B?Q2dsa0JhdGpFRTlnak56QmJpaGxaQzJJbGxMeE1nbU13SktBazVrWGNSbFFj?=
 =?utf-8?B?VytXZWNmd2VWWmVTNEtKeGRoMWs4RTdaR2kvYXFQYzVHdW1NL05tc3FJYnlh?=
 =?utf-8?B?NU51QkZ5VDY0aWdmODU4d1loN0NlVVJRWEJrUmxUdmVwaWdrbXY1TXVYbHVS?=
 =?utf-8?B?NjNFelVEd3pMeThTaGFJSFA3TWdzUGJkeWVBU2lPc1ZPNU91czVZcnlvOG4y?=
 =?utf-8?B?d091Z0tJQWdKZ0hoQ1pSeUNDdlJnd01XNHdzTUdDYks0cnJjSldSRENZbkY4?=
 =?utf-8?B?UldGRW9tZVE1d2VIODlzSWVkQ3dCZjF0UGhQMytzWFhNRG5PeGNKVE00NGhj?=
 =?utf-8?B?NHltSWgyc0RjRCtieE5ZNm5Tb3lETVBHSE1pbFlEZklZcUZPVncraDdyUG9y?=
 =?utf-8?B?RWg1UHdGWXp1eEFvRUtyRXJRRER2cnpJa216ampYSHJWQkcxcUVUS0U5OENw?=
 =?utf-8?B?QUloV296OVkzdHkrWENZSm1WZytWdGhsUXgyMityUUQ0aVNzeHBwcHVFMnJr?=
 =?utf-8?B?bjQrYk0xWm92OHFXdEE5L0drWFN6SDJSczlJYS9xVUtjQ1I3VzVFQ3BFWDIz?=
 =?utf-8?B?Nk5ZK0tiK1pCTURpMG83UGY0MzNzWnJHbU8rdjJKWkwrMEFvaXJpWW85aE9V?=
 =?utf-8?B?aUhrR3gyK2NyeVFTdStpMHRJQ0U5NUVpVmFad1N2R0RZWndFV3BBSDFCbjBj?=
 =?utf-8?B?UGU3UWJ1QXhiWTg5T0tEOFdySlIwd1cwQkRKUEd4bFdQOEVMSnNQdUJadm5y?=
 =?utf-8?B?cVFFK2VuYTNHekVnOFIzcXlmd2JneVdYN25mdFJ4UWFFMlV6VTVYMnZTbzNU?=
 =?utf-8?B?MVNJNlkzUnNEMkdVVGxYVTVkYUVzbUVXbWhwZzdaS0R3MURhNVBTaXdkbVBq?=
 =?utf-8?B?dWhzd0hqSG1OakNVeVFXcm9PeHd1UHVuRDd4dWpyN29BMFBibmp5dkN4dllT?=
 =?utf-8?B?Z0RjeVl4RERWd3ZEWDFTMW1mT25iRHFCSXlWSTVQZU42T281TDhrWXhzajVr?=
 =?utf-8?B?TkcrdlBoNXFRS3BrUkt3MjF5V2o3ejkwN0Y2ZGtQdHA3TnlBeFM4ZnZEK1h0?=
 =?utf-8?B?NDkxeENYTkJOTkhtNk5DN0lmOFNLMFZDZmNVTDJGRDQyMGh5YWdaeWtncUVI?=
 =?utf-8?B?R0dKb015TnVBdTdUNnUzSERaLzN5WFAyYWsyRUttV0I4M3hsK3VVeldWMzM4?=
 =?utf-8?B?Vkc1RWhUbjlPNjdWT2lrdkxyVXdwUlp5c041MDRYQS9vU2lvaFlYOWNIZG56?=
 =?utf-8?B?R2ZqVnA2N0xjQnFOT0NybjBZWXUxVzBrVTAyT2FjTnBPS0NvL3lnTlJTM2k5?=
 =?utf-8?B?NVNLMEplVWErYnc4bnN0WXJQNyt3MHdaNEhnaWJGK1RJTDUyNlhNK3ZLb1hn?=
 =?utf-8?B?TEhodExwdVR6U1ptU2FQYmYySkxzRUdpWWNic1RyMTlvWG4vTTY4VGJrVWFw?=
 =?utf-8?B?YTdxQitSdm9MSFJkTkhqZ1Y4TiszcVFrVzNnQzR4Mm8xRGFrR3h4N0kwa2Zy?=
 =?utf-8?Q?QVumyOeelwke9odmI0vBfyiHo?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DF8oq2IfHM4n0US0VfQ6hZVna8Scm6esyUmoMDpY8HWKjLOzGP3TBRzIAXxNPmj5LZU30cnwHgBC9WZs2/hGz7UhF2iBJRfXMi8VlStgf9S4BX5xhfSz14fPTpNDw4wS8N+JkYXKi9QqlWzkm+gsRXruIoOmpQUj/OQoMmOGwulubQtcx7FtrmCCGDyB6A6v3o7RQJJgN2S8nAbxFgC5ZHJ/E3jb1AKCE7KyIsQi7ozj8GndXcbdS0Ymge4KyXdEa1R/0c8OaD/rgd/z+M5JtfXjIwq3UwBdKzBK3R2DtxkNd2DxYtw+79OklxMeZDQbOQWlXT9YmrTjLcxWna5zgnj19oVCdO7tcCtcuInVlkwWN9de4gbq2/dKaM5AYVUpwaL1Bv2nqqULY4DVrvm5qbH+WBPqEddS+u+nAf2yQKy2RdicqcuKUMKZOZV8IttC9KSky0MzTPYf6lA3qtol9ytdb1XymFxkjdkVBj2Ue+B17tAEakzfOepfJG7T1mZ8gE/ij1m51X9Jr+ePRDIHpIdGRuUSk4HNtdPo7ObQVe25Yn57roRgwsP1rjaiiHykTlA1sNTchd0LqXf4mcFEtuX6AS/ml79ootKpTvknyYY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5754bf2-0878-45a9-b5f1-08dd88c600d6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 15:36:55.6807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eMOlEslILLv4vysDFi7CQhnOMpOVMsC2WC3yUedneWqflusckMlcMTeWpFduweHBqwTsR9I8QNxQZmiqK+pQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5781
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505010118
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDExOCBTYWx0ZWRfX1fmNLxU1yKHH anUgc5UyXoWjK7Ks8iCEUzX4R3vY5KamGHfMHEpe7pLqQPvGN667PX331DLmgSqUhdBx5msKVVD MFgTCwaAdyz0HtyLR83Fokszs1IDFt705LjDhcG2/kYi4/8SQEIj6GSg6ZKTpdvbv6hnLK7B+W4
 ELMnm7TCFI0iMLGn5kI9OXk8ndIYLwSZo725iNz1TCn6YZ+kK9SqUMZaPHQfOVvn9GmZASp2s5W RTceMSVWPVNRMPcGt2LejgE+iFpFk/7TNLSILM33Szw+6RigEB8vHsiLABlU9hsLAnsvbiOyi0n ZrGm1TopPVcWVyMeRZwzln3p2tLVPNGt9PGnQUw8MyQHmDpsendVzh/H5SajP8UZMILbPW47vH1
 c3rUVEzoW9FT0Kw1se0XGCeF2otiiCU7Q15+cJMiTlyKSffwT+0HYDziPfJAwlmKK2Me8Fz0
X-Proofpoint-GUID: lnuKVsyVtOXyW3c3uuhdbhnMt57Cs4z5
X-Authority-Analysis: v=2.4 cv=A5VsP7WG c=1 sm=1 tr=0 ts=6813951b b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=WalBiT5LA2aXq_8auRcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14638
X-Proofpoint-ORIG-GUID: lnuKVsyVtOXyW3c3uuhdbhnMt57Cs4z5

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

but the commit msg should perhaps also say that rawfbt is not needed for 
discovery either since that's the other reason we want to be in the 
list.  Also, how about removing

libdtrace/dt_provider.h:extern dt_provimpl_t dt_rawfbt;

On 5/1/25 11:08, Kris Van Hees via DTrace-devel wrote:
> Now that rawfbt has been integrated into the fbt provider, it no longer
> needs to be in the list of providers to call populate() in.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   libdtrace/dt_provider.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/libdtrace/dt_provider.c b/libdtrace/dt_provider.c
> index 0c621197..1e2e844e 100644
> --- a/libdtrace/dt_provider.c
> +++ b/libdtrace/dt_provider.c
> @@ -36,7 +36,6 @@ const dt_provimpl_t *dt_providers[] = {
>   	&dt_lockstat,
>   	&dt_proc,
>   	&dt_profile,
> -	&dt_rawfbt,
>   	&dt_rawtp,
>   	&dt_sched,
>   	&dt_sdt,
