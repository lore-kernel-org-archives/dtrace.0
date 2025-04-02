Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75623198E7B
	for <dtrace@lists.linux.dev>; Wed,  2 Apr 2025 19:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743621531; cv=fail; b=P8zS+D6FkK/3dYPXc9qs62YlSAubN2C8K9zuQAfJgxeDi0j5wTOEvUIH3mi0LCh9YoNn1wCicf7COsDcWgReRXG8h8ouGIYJmP57mDEqmkml/O6o2HdXHv2bcNhWvciY3QmI+PI0OVZKXts4SOrGG7fOhfQeNaYFz3l3aji/Y5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743621531; c=relaxed/simple;
	bh=ulZCC84xu28l5jQu4YPXz1XoJ/KFNCGAY0mIZ8amSa0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=se1YFSJ9PocRDh9wuNxpzs9Cbvpar0k0i6e8FQ7JRJ9hCJNnjTTS/Vak3a4ZMlvjpnARi9EOxGJn+AE8eJQJ+4r/S8r82igaSacjpiyb3cC9G6pWQerJXT+yhsC8zshaIqFPvRPSNzqlYwQzDXtxW8pzAyWDn5PXDWBzDNxfrSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=exGFq4Mg; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=mkgyyHOt; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="exGFq4Mg";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mkgyyHOt"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532Gtskj012617
	for <dtrace@lists.linux.dev>; Wed, 2 Apr 2025 19:18:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=0XYgVVe0I468D/ECRS+v+pfHv0iefhSeM1pVPjS3KzU=; b=
	exGFq4Mg0MF+cu19jK3axy7TQZpDjU7DgoLlypVjnKmyU8EcnxB7+oO24u21u197
	hXddb4rMvSrXR9+1i50qMfyPbpIt0Y323xKJaeBa7lEqLDW8P9CRf+hJ9giuFmV7
	uTnnrhxUqbjwT6A1fJRzTGY8GbZsRpwiJ23E8v5J7yG0YWVAzp/YJW8Tm6bsHpmM
	VPpikH2SFRu7/d/jfh3ABcznli/GDUAV6xrJ8+gUUPjHfhZxnu/Mt8Dj0tp+dMIb
	XtWmAR2dLPwUb2EqyfRyoJVo5jXDHkVTD2msEedxwUNySaJrQpQT1lJpdJE4AkM4
	BFUkDawsYPoJ6Cg9C99e3Q==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8wckp1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 02 Apr 2025 19:18:47 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 532IZUQd002610
	for <dtrace@lists.linux.dev>; Wed, 2 Apr 2025 19:18:47 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45pr8s7e6a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 02 Apr 2025 19:18:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPa7TEGM8QvxwRm9UMbYZRUHTyKMJ7Y3pnXIncPKCOc6/vcxm0mP7KrmPpeXZv7mkdz/jnFov7xqU45MU53yTHfT7U2yVVfL5ayYp5AQgNw4UjIPAJcYj/RHoTM0dqIZyWiSX+BETDyrxtJ3RNZx6dpV2UW00dKbrByrJDikyCPsF8BxLjyp65i6Si0mBoZQ9pbdaPOK8neVzLwjvFiXlTn67oBtvjs2hit7SldW+RLTXvKIKx87u60et3SxX5TOU4EfnvnI8481R/tjxoV7JhjmU7GWUu7HO0NKTojCE9mxOOlRjJHbCUZn3cJanLhGK8JGN8mGgY3gPuVTV9B+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XYgVVe0I468D/ECRS+v+pfHv0iefhSeM1pVPjS3KzU=;
 b=eibsHkyE1viST55uugMOwOc3gjnT0EdIn/CniWlE7/hlo6AvgV3SaWfPvsFkcsS58i+/55MGp2m6Nc/fSzQdN89qc/w4hjJKjy6QxB9Nyc8W1QxfnIFd0anbHUHiPwSloqdj5KDVnQiVHGvNKBjwKTboTXg89CZXECsBr1JtV9pup4wykvh8ukCL9CYPRCRWva+MUdW0AIbC1EN1RnwROVdg7fg6Eb7u7fAdU1uh/jLvBoB0IYxJypbIpkVLf91Y9AWs5/8rm/q4hzbmpYPyUl+fW7jbmxlJQ6Lb2nMQ5joyTcalfUpCQEtOTTDve5JcKH0DkhBsSGkNoU2mGTHzcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XYgVVe0I468D/ECRS+v+pfHv0iefhSeM1pVPjS3KzU=;
 b=mkgyyHOtbyuDclMPqtfiQ0mxKQ70pj2SvOEbxNBBgM0eDVl3yCkMICFyOkvaQSfOAg2TyRj3FmuS3lLuHCjBAl0rDJ5MbAq2GMR8z8L+9yeATMrIfwiwsYpbTl7jRvEegu6KVE+KwHzuRm2iR4lGjYn27ziOZyalojhmzkkotTs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7296.namprd10.prod.outlook.com (2603:10b6:8:f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Wed, 2 Apr
 2025 19:18:44 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 19:18:44 +0000
Message-ID: <e70b6307-ef2b-7363-9dfd-4551ccd81880@oracle.com>
Date: Wed, 2 Apr 2025 15:18:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 1/2] Add a cpuinfos BPF map
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20250331214501.24126-1-eugene.loh@oracle.com>
 <Z+t7UAN7i+Dkpc5e@oracle.com>
 <fd3e36b0-33f6-9d4f-7997-30dae143c6e1@oracle.com>
 <d8785b9b-76f4-4c11-b47c-c4359322d876@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <d8785b9b-76f4-4c11-b47c-c4359322d876@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0760.namprd03.prod.outlook.com
 (2603:10b6:408:13a::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: f73ce70f-881c-4c8e-94d3-08dd721b2f7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NCtiVHNpTm1JNUdRR01lK2hJL2M2UmM2YW1XRytmbytMWG1KeE1SZWJhTUhL?=
 =?utf-8?B?dkc4aGkwcW5HR1EzWkljWVNrbzJ2SGZBNjBjUW9NdTMzR2RqV0pGRldoZHRU?=
 =?utf-8?B?TFJJYU5yNWtBYnVrYWU4eGFUcWsvZnJPdllHeVNBdFFkdkcxcEwxdWpmWS81?=
 =?utf-8?B?REhNRlk4andLQVNLc2E0Mmh2alNrSzh2d1VUNmMwa2VkbXhCOXh2Q2hHNDRI?=
 =?utf-8?B?aHhYLy9nV3BUWnVBNGhxT2lYNlVBaVJ3NzBNYjdFenk2Wm9ZeHQxVEFSOTRp?=
 =?utf-8?B?TXpXK1lIWWdOZCtzMVlUWHR5b0ZyRXI3WVo2VGhsN0NQTDdLVFVqcTNPVTBV?=
 =?utf-8?B?SUpkNXNSdEJ0dThRcWlydFh3YWdyaFJrSSttTDBxcnBSc2FGbWtVbFFFTXJr?=
 =?utf-8?B?ZXp6NXpCVzRKbTlURUF6eHNRZjBaNitpb3ljV21FVlJQcENIREdGQlgvTGd3?=
 =?utf-8?B?d1dQTElNNEtiNWpPajM4cXZyYXUvbTVhR1dnMnNHSDFNTFZReWhVcGlnUlla?=
 =?utf-8?B?VjkxOXFuUEVCQktTMll0bXVuUWhjT0NoYWhkM0dyL1lJejJhRVFFSmZYcU56?=
 =?utf-8?B?dmMxczZqK3o1eGZ0dmM0d3RUVU5NaU0zUnh1Zk1mQ20rZ3IzcU94cDNaZWtn?=
 =?utf-8?B?b0VmY2c0aCtYTjRuWWdTS3V3OXNoUmNzN1grclJiVzRhMGl1eGhqalZNSkts?=
 =?utf-8?B?bHErSXlGcVU5WGhNUWtpQkc0Qm5vK1J3Nm5LRy9LOHhnREpSbkFLclB1enZk?=
 =?utf-8?B?ZUZHTWl0a2JlYnN3SXk2OFpBQlZVVnVVMkdoNXQyYjVFZlBrVmFITXNuV0Ri?=
 =?utf-8?B?L0paSGpJVHZlZFVIZW9FQ3VFenpVNzdBdzhUTXdHMW5JMjFTeTRxWmN1b3Rz?=
 =?utf-8?B?QmVqQUEzOVl5ZTAvQXVySjRPVmpDRHl5eXJ1aENmN2t4enFWQUVWN2JBODlN?=
 =?utf-8?B?R3RSVEtXL1pseVR5RGJNNC82QVNYMnljZTZ4STFUNzhuckJHY2NJV3BMcHVq?=
 =?utf-8?B?V1N4QXl6a3N3V0phWEpFR2tackRheE1TYVIwK1RuTG0rV3FFbDhMY29JbHlt?=
 =?utf-8?B?ZGdZWThDRmJVczdLV1VVdVFNMDNYSGQ1eTdaUUdMdGJRM0R1cGRQRmJhMGdP?=
 =?utf-8?B?TE1uTGxOSlhWeVJwVXorQmFWM01TbW5icXFpeGFpTHJpTU1hb2c3L0dDUm1s?=
 =?utf-8?B?YXFXU2UxS2dZYjVmNDgyNlNlb1htUmNCS3ZFSUI2YzAvS1J2N0pkUjRjMDNR?=
 =?utf-8?B?ZWtSeVEwSzlZQWRGMnBoS0RyNk41R1ZITHhYV0ZYOGVtNW5pdmVaUVBMMXVY?=
 =?utf-8?B?MGNlKzVBUmhWK3I1djNna1lhcy9PeGdCaTJ6Q3ArK1NrU1M3ZnBZbjFWR2V5?=
 =?utf-8?B?Ly9JSGs3RFJ1SmNJa2FKeFYyaDNFeWVSNXd0Rkw0RU5CdXRpS0RZbFk3bmlz?=
 =?utf-8?B?WDFvU1UvZTROL0srVTdDeTVzVWpreHNhUC9hZ0xlKytLOE1sUm9kNm82MVNl?=
 =?utf-8?B?Mm11WEtoOXo3NWRzZUs2cTVWeGpYbjY4dkJ1V0M2dzEvZFd6dTNVeVJCU0lr?=
 =?utf-8?B?NldCQXZzU1IybmhmTGRnZUVyeFVubzNEY1BtWGZxN3MycVRTY2w1S0k5bXJ1?=
 =?utf-8?B?MmF1dlRWMnNTbzI5bWQvNVRtOXpHdlVJTzg0SjZ1YndJWFQxRCtEb2RUdVFQ?=
 =?utf-8?B?YUEvb1h2a21uMDNnVVVoQWRRUkx6ZjJMeS9hRGhSUEFjdGFpRVBPSDNiS2lG?=
 =?utf-8?B?ZDdqaU5nSmQ5TTlrOUp3b3BmTHcrQWN5bWJaNWpkbnJ2ajVNbjQraU9xOWpr?=
 =?utf-8?B?Vk16bXlNNnlHbkdoZkRXQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGlrWGp2Ni9leHljUWRWYlBOWTZ0MlFJM1ZwWnIrWitMY05SMzhaTDF4L1Nv?=
 =?utf-8?B?QWR5bHBJbTlBcUNnbjhCL1JxWEJrN3llcEZQaStINGFyL3hTa3JJS3JHdTYr?=
 =?utf-8?B?Z1RFbndSSlRsMXRXTWN6T05rUllYT0gxVVVCRlBMeG1OeFlNVDJ0NFJXQksy?=
 =?utf-8?B?WUdaOUg4Z0duR2VWMU91bmlRVHdCTWhXeDZ2TGdUQmxmbkYwb2pXd3c5bFdI?=
 =?utf-8?B?R0xPc204c3NNUzNVQURtaERPdEpOWEd0ajdiQytZMm5wbE8xV1o1NmNnNWdZ?=
 =?utf-8?B?a21oTUZoa3R4OThKZVF0NjI4blMwR0E1WnYrVHJXbWd4K3M4SnFaNVBLNDJw?=
 =?utf-8?B?U09rRExJSEtJbEFMZ2tXQzZ6K0hJVTBhcmQxSDZlRFZhYUpJTzhwR21IM3Na?=
 =?utf-8?B?L2Nsem16Z2JUS2grYitVV2VNam52Vzc5RWxnb1ZSdDNzZkh2M0cvL1dzeWNZ?=
 =?utf-8?B?aXNjVytLcW55TXE1RkVUdjRQWWNkaDE2b0svemI2SGtvM1AzbGZTdEVMWnRG?=
 =?utf-8?B?TmNHYTk3TkJtWFlUSU9VaW1LVENQcXVQN3NFdFhFaWdJb01Kdmg4WndiVE9K?=
 =?utf-8?B?VTdrOVBZUU9Gb1V1czU3UmFvUmlXV0M0Qkw3M0taRTJzbDN2WFlJWk5QVXAw?=
 =?utf-8?B?eUcvY2NkZjlCUnlvWjkyMklVZHZMdStiTXFuTnJ4K2hXbFlkdTlzZ3JqMlNB?=
 =?utf-8?B?SkptYlhFZzU3cFFtN01aRFpsUHJaVzZ6cGJxS3VwYTJqL1ZBZXMxVEJUNTND?=
 =?utf-8?B?NEdyQ3FySzlPR2lJZmdlbjB2K3BLcTVFZXNOZ05wejNiUGY3NG9zQ2xadytI?=
 =?utf-8?B?cUMzS2NoQ0hWZGVTcDlDb2MrT1ozcXd1aFNqb1A1MXFWQVlBd2c5YlVISm9J?=
 =?utf-8?B?QnUwUjZ6T1QxV2hYQXAvNTVDT0VPS0s3VmQrN2h2SnVubDdVM1V6OExpVU9z?=
 =?utf-8?B?UW41UlhKZVcyWFVhSm95YWpOekFLYm14aVRGU3JDemtwZjVrdnZyN0dTSnlw?=
 =?utf-8?B?ZVBubVBvTDRjSy9pYVZ2dUd4Q2ZHOXJFR1NFK0tDMUFpTXZ2MGNibExPOWxS?=
 =?utf-8?B?aEtxUUZVc1VPWEZOV0IrSWJJaWpLYmY4RHpFQytkZ0p6UzVBRWpQNDJ0djJM?=
 =?utf-8?B?cHZZUlF5L1JkV2lrbGdQQnBHQXVnNkJQT29SWlBqNjA5dnBFU3gxMWp4ZXRB?=
 =?utf-8?B?alVCa2ZSUjRndmhsYURDTCtZeHhUVEVFSUdvREpRYTd3UVNTMzBLZ29UbDZ3?=
 =?utf-8?B?Z05mSlpSdlZ4TCtkdzVxQTJnZFEzaWdDVjdBSzQxdXB3ZkRwTWZsVkhmcW1a?=
 =?utf-8?B?Y0JoeGZ5MStJWUdWNE9JeC9JVVZZaTZoQ0NBeitpU2k2bmdRNWxQSi9TYTNX?=
 =?utf-8?B?MEYyWVFmVWlNQUhiZ2QwRlVXVnBHcHFUTUVaMTc4Tm80MldvZzd0WldQaVUx?=
 =?utf-8?B?ZlFtV1VuK3NwMGVUWkRqZGJFN1BScks5UUVKOVRPQ292aDVoeVJReG9yUEds?=
 =?utf-8?B?NURaOXJLcUtoK3M1WUxGME94Smg4SlQvSUpvK3pVVldUc1Jibnh1ZUo5Nkx1?=
 =?utf-8?B?SVFVYU54SGgzV3FwZldlWTBXQTdreklvWmxwL0VmTkZPeElab1hrbEZ0Nmpp?=
 =?utf-8?B?VlU2SjFvOHora1NmRnpQcnZlaTZkQzQ2Q1NnU2Y0eDVzendFLzZ0elBYVWk4?=
 =?utf-8?B?bUFkZjhVRS9heks1WExZaGxIU1dRYnJrRWpEanJxdHZoVDBqMHF3cDNNOUVV?=
 =?utf-8?B?L29sampSYm9tRGd0Zlpua2FIT1JjbGU5QXFYWWxWWG5ybFBkRWRCaGpmQWJ6?=
 =?utf-8?B?a0lodTI5VjlaQWZJbU92WWMrUXhoTGxleEVXbE1MS3Nia1ZraVhSNGNic3Fn?=
 =?utf-8?B?ZDRDaElSSmxYaHlsL012Tlg1VU9zN0JTTGIrcFQ0Z3ZpYmd6N29SanBOZ2No?=
 =?utf-8?B?QTE3VXV3UHN3NzVSZkpqWDNqc0JvdWJPMXNMU0I4VklNcGN3RGQ3RkdZd3hm?=
 =?utf-8?B?WVAyNTR0MFdsMTNuY3lWUDAvQVc4MUhhRWwzanEvRU5MU2ljY053WUtTdHN1?=
 =?utf-8?B?VWZSR1NGOTJYeVBueWdaUktDWkdjWExSUGlOeHlwOXo3OWlrU3lGSWZPanhY?=
 =?utf-8?Q?/e8Vz+x7320JFSQuwZTyxHiSk?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LjaBuoMJ5KciZBH2PEJJdgrJqNwV+dv1Kr1vBRzybrT03qcddm4HaXAWdsCfpWpHedOkNSNVVEDqZGm9fJCp+j+im8O1Mmtc6KzYxRiLE6xKibFdunWf1OE9o41c2bcrhRZkNrrnHshSFTVaRGKIhgWAAJm+rEm3x2ejeEILrjPOaUfDn9bWzY00yeprlhiI/82NE2JpCd8qBcCQbxkZ7TOClKZMJPjK71W2A1QyQ7ts1sVu/7L6CyjtLVPQ3BHvigcHlWpAyGCZzAcJoFuRx6OaiAbguhTEvZJVbnMtC6q/4zFJUmTAsh4Qy0GQPEJ0MsBocId/8eYTZWEOZgqsKU9X9w3gyu9EsVtBxcstU5ULs8t3RaFRRYFSJnkMR/xyAAhz5XW+7n6lyWaoWnf1dO2t4RUfsoJ946ixT0mM/94Jm76knBrkMA09Wo/uGdKtPFFQfqHcMWWGM1Lt/s6yUZiasYmIxmEijeN1b7Tbk6RkVpdeN8AOqwI2y00gHthgqTrjZYFrgkci1gdr+OFw8/p83me3S3W0qXymark3wksKKPF4TuYOCj0tIiIzNQwSj7vwsS8pashSV1a1hBqdzzvBGPg6MQWE51RqTLbz+A0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73ce70f-881c-4c8e-94d3-08dd721b2f7e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 19:18:44.5030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIixum04gCtLo3tkVMQkw2pgas0mWREDHvxciimWeHYwG6Lq5xBJ9puxFZHSdU4o38GXsmaRVYy1/qNI5PcHGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7296
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_09,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504020124
X-Proofpoint-GUID: yoDyI7W4DUp5AQ-GGtoNd1npbSPaF33-
X-Proofpoint-ORIG-GUID: yoDyI7W4DUp5AQ-GGtoNd1npbSPaF33-

On 4/2/25 05:37, Alan Maguire wrote:

> On 01/04/2025 23:54, Eugene Loh wrote:
>> Here is a proposal.  First, two observations:
>>
>> 1.  (As Alan pointed out to me in a facepalm moment), one can write a
>> simple D script to check enqueue_task_*()'s rq->cpu against the current
>> CPU.  He and I both find that the two CPUs are generally -- but not
>> always -- the same.  So, the strictly correct thing to do is use the rq-
>>> cpu value, even though you can just use the current CPU and be correct
>> "99%" of the time.
>>
>> 2.  A BPF program can access per-cpu-array values on other CPUs. Well, I
>> guess you need commit 0734311 ("bpf: add bpf_map_lookup_percpu_elem for
>> percpu map").  That's in 5.18. That is, UEK9.
>>
> Nice find; this commit looks relatively standalone so you could file a
> bug to request backport to UEK7U3 if it'd help. No guarantees of course
> but it's not too distant from 5.15 and we've backported helpers before
> and managed to deal with kABI issues.

Kris was leaning to not relying on this helper since it's not ubiquitous 
and I agree.  In particular, it's not too hard just to have a global map 
that one accesses by cpuid (self or other).

>> So my proposal is to leave the per-cpu cpuinfo BPF map alone. Perform a
>> runtime test whether bpf_map_lookup_percpu_elem() is available.  If so,
>> do that cross-CPU lookup -- the 2/2 patch I posted -- but using the new
>> helper function.  If not, use a simpler on-CPU lookup, which should be
>> right "99%" of the time. (I have a simple patch that uses the current
>> CPU.  Pretty simple.)
> For what it's worth, I think it'd probably be more valuable to preserve
> an accurate CPU id

Kris agrees and I'm on board.

> and worry less about the other fields in the
> cpuinfo_t; i.e. when tracing, I mostly care about accurate cpu id info
> and never look at the other data in a cpuinfo_t. So if it wasn't
> possible to retrieve accurate cpuinfo_t info via a cross-cpu lookup via
> the 5.19 helper, it might be better to fake up a cpuinfo_t with a
> correct cpu id and other fields unset. I'm probably missing it, but I
> don't see where those fields are populated currently;

dt_conf.c sets sets cpu_id and cpu_chip. 
https://docs.oracle.com/en/operating-systems/oracle-linux/dtrace-guide/dtrace-ref-DTraceProviders.html#dt_schedargs_prov 
says cpu_pset and cpu_lgrp are unsupported.

Anyhow, I have a patch (will probably post today) that changes the 
per-cpu array to a global map and so we should be able to get the CPUs 
right.

> tried this a few
> times and they look to be unset for me aside from cpu id:
>
> # dtrace -n 'BEGIN { print((cpuinfo_t *)curcpu); } '
> dtrace: description 'BEGIN ' matched 1 probe
> CPU     ID                    FUNCTION:NAME
>    5      1                           :BEGIN 0xffffe05e7fb61b00 = *
>                                              (cpuinfo_t) {
>                                               .cpu_id = (processorid_t)5,
>                                              }
>
> ^C
>
> # dtrace -n 'BEGIN { print((cpuinfo_t *)curcpu); } '
> dtrace: description 'BEGIN ' matched 1 probe
> CPU     ID                    FUNCTION:NAME
>    7      1                           :BEGIN 0xffffe05e7fbe1b00 = *
>                                              (cpuinfo_t) {
>                                               .cpu_id = (processorid_t)7,
>                                              }
>
> ^C
>
> If those other fields are unset, maybe there would be a way to invoke a
> translator to create a cpuinfo_t from just the cpu id? Not sure about
> the mechanics here, but my worry would be that it could be exactly the
> times where we are on cpu x and enqueueing on cpu y we might be
> interested in, and if that info wasn't preserved we might miss something
> valuable about how the system was behaving. Anyway thanks for fixing up
> the sched provider, it's really useful!
>
> Alan
