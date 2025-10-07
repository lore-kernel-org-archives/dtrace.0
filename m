Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E9E24679F
	for <dtrace@lists.linux.dev>; Tue,  7 Oct 2025 22:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759877692; cv=fail; b=l6A+712JNv+B9aTlW3s2gvHylvoCe+M7fZlE8OXfpJgNv6lau0WxhZMaqIlFoLzD2ejzdvlpwiN8YEN1EI6hG0Yb896ZCk1HtLfJwbbFr4K8IqODqalrd8/Wgc3SMYtD14fOpXAbAZ7geV5Dm4QzfkHyWp8blzY8sEffPyzefiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759877692; c=relaxed/simple;
	bh=Ti6iHQg2+mOjlqKxcGu2np2FT1mwkYrdOd2cXGxDiXg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L/yKxvWG5w72d6ujuUOqiMkjcruOO5hhv001geWqutm57e1NPJ3LLHeSz3j854TivtdkuLiGQm2G4YOwALeOBxPefC6vffWiJeLKl6x2HnQa4JqyALqXA4vLmTgB3JNSH5SdKXRcC0O9PfSPqtbfn4jRqEFfXoqFZxh8Y52vF3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gBnwjr2R; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xfZdUPvN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gBnwjr2R";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xfZdUPvN"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597MEK3E030965
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 22:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Ti6iHQg2+mOjlqKxcGu2np2FT1mwkYrdOd2cXGxDiXg=; b=
	gBnwjr2RDFkqf9EqBDXNWQL3QKmx/jywMVujcoZlCkg3dOFlTTiBCt7pIhH4Gd5i
	aYSppK5yBXZapRLWJfXVLxBYoh22/q8Wix+Xq8FZw1WvtncFHmQg55Qctpx6FKhN
	Fb4p3HtfXlivD4tiLv9e7g7L1ynfrB61KFNIUztIBmG+vUdOPjUmDpYl9kKfWfwL
	kD3jL7W3dlLZIx2XRCoioQ7XjP2PrJ+gtyT0qMmpdmsUR2hRP0de0paNgUAYWCjC
	ALeflNrzY5owjWMW81hukg/Lj0bsBVo+Y2968ZAt0ykNLKXxx3tO1Ke7lApb+i6J
	aoStRjxwbuB8eHuUVOBM6g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49nakr03dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 22:54:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 597L4bca040890
	for <dtrace@lists.linux.dev>; Tue, 7 Oct 2025 22:54:49 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013010.outbound.protection.outlook.com [40.93.201.10])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt192uw1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 07 Oct 2025 22:54:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iM1NfBOWcU2ASxAukuOLCiLKy1mwTBLSW7TqUwsu+uRyDmgumN8wHgeavLKRFrwN764jmx8t4EUaA/EgAJu92/ffjvHPvqnFQv8TW1UMNXqyjl78hT3EyclXjrWT7ULHnsvWDNr9I8BteXocjF4A7i7Z4xgi7p1pUvPFsuUwJb4Kt/+NsFz5FH1329nwMnQmPgGJjNR1dOrSYR494dsuIwim1s3/AuCe/xn+6NB5JFx3dvxEx7PBYfAUHrH+fzzzuU1lmsSou5wMXLK56/2MzTaECkhffwRXA0cyrv4UsAT0G4Qgi8nPV7Hnkm97tSD4v85r8CItfQUSTf544zcvWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ti6iHQg2+mOjlqKxcGu2np2FT1mwkYrdOd2cXGxDiXg=;
 b=n2Pu6BodCJ61r16S4jNdp8J9wYbHLliQdqkP3ZZrNblIBeTd9Xlzwc3JpKn74lXfraNw+NjrFaRhKY0BEWSVx1WpmhfEW1YPKKpsYyC/fzcxmXiw+4ufGmaqCLI5fc3v7LEcEbejQ76xVe9Ek8gClzKlPUMLeg/pwJ9L4mPGVPnoYsHsNFcn7UdBdisM1TkGTwIuscz4Yle7kc8Q3Jg/w+qWF/MqmUt2YHgQlcDMijTW6oKbzukFlx+SEiz0qi07AKrSaOdcyF04emQ9tmXWulegh/B8EP3T6VAlavEyqAnFnS/14HWX3Kcv8cJLbfSKU9IhdLOfK6FJG7f7mBGorQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ti6iHQg2+mOjlqKxcGu2np2FT1mwkYrdOd2cXGxDiXg=;
 b=xfZdUPvN94tyKRS1qpD2TmTWidFwyDc1ABKPbMLpkonNDZsD0leIozyZAzvfdJqDq8XaIpGsc4pQMzG0E7RjV/xUcGRbkWO0/2EmVo8gV2+pNx+/QdtmVwr9lZvxY3xnbWqYccro0i25a8RPdwfXElhhEeM5xxuyyIC2eyLHi2I=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB5890.namprd10.prod.outlook.com (2603:10b6:a03:3ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 22:54:42 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 22:54:42 +0000
Message-ID: <cf096bf0-1fda-8930-5f2c-146071191916@oracle.com>
Date: Tue, 7 Oct 2025 18:54:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 3/4] test: Supply XFAIL for tests that use
 vtimestamp
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20251006215726.8893-1-eugene.loh@oracle.com>
 <20251006215726.8893-3-eugene.loh@oracle.com> <aOU0rCkzJylhk5Dd@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <aOU0rCkzJylhk5Dd@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0243.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::8) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: a22825eb-0f24-46b7-2fd9-08de05f480d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkFSb3l3d0VKc1F1VkdMWEdiNmE0OXJXWXVjUTVpK1NXdFZremp4LzhDWEYx?=
 =?utf-8?B?b1A2eTkwRDVkU01JaXk4TUltbmVlYnZxTjc2TWJTRENqbkpjTnFzM2VQbktY?=
 =?utf-8?B?QUVIOHpkcy81VEhnNzlPY1NuOE9CU1NYMjBzdmlCTk0vZG9JTEpFWlIwVFpC?=
 =?utf-8?B?b1kzeUxIWHZaVUFMb3gzNVQzTVJnVnp0YlM4Uml4d2RMcCtKUlp6UFF2K05n?=
 =?utf-8?B?YUtiUC9mM0QybGdoeURyRlNETnM5emloMVdETW8wcEtaNExzYTJ0ZGhzTmxD?=
 =?utf-8?B?TSsrNkcxUWxlbi8xb212SmU3a3RLbVE3VjNGT0JMNjl0WkVLaG5YNzhaZEdF?=
 =?utf-8?B?bDIwdXlIQkxMUytqMHgxZDJnK3pSOEFDQjhscENrOWdLb1VzVzVZOXFMaStS?=
 =?utf-8?B?TVBsNnV1ajN6eUhHTC83UkZaUkU1Nk5RMWV1RnpMQklxNzhvdzg0Sys3dlBy?=
 =?utf-8?B?ZExxOUNTVW9mWEtESmRaYkZWanBQc0RCK1Npb1pBNUlaVEg2UU40a3lySnpT?=
 =?utf-8?B?OW1lelhpcUN5cGMzUm1kLzg2R2VoekhrRU1tbVR5NkY4QjRNall5cnd6ak05?=
 =?utf-8?B?bmlSVlFza1RBeXN3UnpPNlJINElsdnUrUTFmbmM0ZTJDWTFYeVNsMDJnbWdL?=
 =?utf-8?B?TUhuRC84M0RUNm1JZFdaWHlWZlg1dm4xVnR0L3lWek05NGZjY241enBtM01u?=
 =?utf-8?B?b0xZOTNXcFFOUmI3ckczUG85eWdRRmh1bFdrZmEwQms2YjNYODRPd2RsUVdM?=
 =?utf-8?B?b3JqSFJBSitsUEUyL1o2TFRPT1RkWEVoaUwvT0g4bWNtVzZBaHE5RG91aUV6?=
 =?utf-8?B?cXQvcXRmUWNZbGZFZytEb05MN0ZOVm80RzI4UkNtVDdVWVdmTGNKdjhHRDhB?=
 =?utf-8?B?YUs0cUs1blJwdCtkamExUjBvTGFxTXVvTFQ4WGJxMTN5Y2V5TkhvdnNTUWhj?=
 =?utf-8?B?T0xvemlBeWVLa2ZhNG9hWXNRdlQwUEk4MTViZ2NiYlQ5K2NTckRDZzB3ZFlk?=
 =?utf-8?B?YmhORjBvSUlLNkR5RzluVFI2dXhuMVlIejM5TlZtTDBWQXlBSG5HNTBHQ28w?=
 =?utf-8?B?Q0c4UEFlQ0hPdk5jeUZIb3BVNGx6T2ZuTWh1NTlCNFl4TndWcE1EeFNqR0Y0?=
 =?utf-8?B?V3g4a1lTWGNucUcycnFZWjFNWW5nNVlsK1p5MW45czJBNEV4NjFIU2pBeWpW?=
 =?utf-8?B?cUtVeGxYTkdKNXQxejF2bE1TVDNaTTB5VjNrVktGNUZaeWNBMW9IZWl5alcz?=
 =?utf-8?B?WmVNaENpcUIzVFVzTHhMU3duako3eDd6R0lZNURMYlJUTFRuSmFWcWNWcEUy?=
 =?utf-8?B?RGhxazJFalRHU1Q5ajAxMFhZSldRY1hjYnVuc1dxWm9yZkpNalJnR1dDYVQr?=
 =?utf-8?B?Y2I1ZXdDcVR2WS9naVpCL3hKRXlGZ3JkOE9QeEx4MEtkNnlrcWQwM0dlRmVF?=
 =?utf-8?B?TktUdGtpMDhtMTZxdVJpWU12TVN5aHNBR3dLZ1Z0UEl5SG9kcDRkUkxzMEFM?=
 =?utf-8?B?QVV6anZ0SWdEVmk4QUoxWDYxMlkycndzQ244UkhZOGIzd09NbnhBMGZSamhH?=
 =?utf-8?B?dnhhUG9Ba1VUTDlsVE15TFZwV3N1YlBnUjBkQWIvS3RwYVc0dGdnNFVtWlR0?=
 =?utf-8?B?T3pMbnBPMmJkczNxcUdmV0EvcDFWV1UrdzMxaGVPSHpHTGpXSi9vcVY3MnlH?=
 =?utf-8?B?U1k4eDRiTjVUZUdzamRtcTIxU3BpK3ZZTnRRUnZxUUVHMG40dWdxb0ZzSWdY?=
 =?utf-8?B?QlhrSWdnR1ZJRkswT3VpbTEyOVpvUVpvTDRWeFhmbXhqbXl1YjNWMjd3V0tT?=
 =?utf-8?B?Z1pCRTZjQyt2QlZyYm56TWxVZTZVNDd6RWJBMFQ1T0ZQNVhoK2RLOWYrUkNh?=
 =?utf-8?B?ZjdoZ1o1SFpOY2QwQVdwSXNNbmk1OG9QbUlWenJ0NXBQRFVLaVhuMEhYRU5T?=
 =?utf-8?Q?YN/zWIpPbgXP/DUmTTFw9qvLCZSf4v6f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmRvMmJOMHlXaWlKQ3U1OWhwQktuQm1GMmloUVE1UExxREN1WDZyclhjNldt?=
 =?utf-8?B?LythdENtaFZKWlZDZUUwMGJpZGRBL09vM2k0dXlBczcxWHI1bXJQbzBjNkdz?=
 =?utf-8?B?d3ZXem9ncW5IQjlicEhrVHBhdEtIL3RpYWV1UUxHTW5FaHJpb1M2dG9KZ3c0?=
 =?utf-8?B?cmloM0JTL0k2MXZnUUhPdkVraVZvZWdoOTg3Vnl5eVZtTngzVkFXOGdiL01v?=
 =?utf-8?B?bkF4dlg3UmM5b2I3c2JTYVRoeGNreWdMMmgyaUtIbzM4c2ZCR29Td0lpWTZU?=
 =?utf-8?B?eXErYWNNVSswalNZNEpQVTJKWUNhVGRucFlIVHh3dkJoR0lBKzZXKzQxUXJD?=
 =?utf-8?B?VzRRY3RqWDVGOEtHSSttYzY2WDZwN2k3bWFQZmdWZjJlZDRsYkFhallhUFEw?=
 =?utf-8?B?QjVuc1NZVnNFWTJZWndFdlRnM3lqbUFjZVRsZ0lIcXZSTWNwSHYxRTEzYWhN?=
 =?utf-8?B?NHhNNGdUOTVBME84OWxFa0xTcWkvR0RXeVo3VkMxZnhmYVk2Y1BsWW9DZG9J?=
 =?utf-8?B?cTJRY2JoUUpWZ3B0TmxiLzQxZnpFYnJReVIyNDBRU1YwTGR4L0cwT0JWcDA2?=
 =?utf-8?B?ZlNmbmFkSFRjUURDMmlPdCtBYWhpRmFoQnRwYzViSTBxVWswWHN6UTF2RFdz?=
 =?utf-8?B?RjBhTFhTd0lWaU9rT2VlV2tTSUgvaEhLYjBaN0lJTVFxdmFPRDk4NXVEdmli?=
 =?utf-8?B?WWFsdWFmdzkwQmk0ckV1VlFoaU5FT0JsNWlhaUhTdjNGOGZZMUZQbk5iQkJN?=
 =?utf-8?B?R0pvcWk0QjcyRlgrakdlM0MwcElYVWNjejFBa1NXcnBxWEtIRTRNSzJaR3Bl?=
 =?utf-8?B?MnlqQk04QkdxSHpsallVVG1PcDhTOGlkMllqR1F2UjQ0QUJzMlN1UTYrVmZG?=
 =?utf-8?B?Qm9aL0Yzb0d2NmFGVTRiQWdzYlBKc3NueE5yelBmOWNkQTIyc1M5dkR0T1lL?=
 =?utf-8?B?VWJwWWp0STVQb2o1eHpuS1NWUHNDOWJVcE9Jd1RwYUZMSVhMQ1hTdUdieGJR?=
 =?utf-8?B?aWNTQXhXNWlQYW1FOThVQ2xRQ2lraXZZNjFiOExMekhPeHFOa2U1SFNZWDR1?=
 =?utf-8?B?QkFxd2kwRDd6UDh0Z2hlZVRPR3lYSG9CTmp1aEVjMnJoOE52V3Y5Qy92UEY5?=
 =?utf-8?B?cFBjT3RlWXAzY0NQY0c0M2FXaGRsMmgxRXNEUlhQNXRkbWUrTi9CUmZpajJt?=
 =?utf-8?B?QWU0aVZHSldtMTVSWGxBNU1TR1JFeFEwWWh4MHp4YW5yMnlVVzdUK0tHd0JR?=
 =?utf-8?B?NHZNZkhPYjdEanZYNWY5UkNxT29Na3VHWENNdVpIMCtmMWNHWVFpM3owYmNT?=
 =?utf-8?B?VDdBb2RHbk94WVZGTmVjVnU4bGUzTnc3VkpCMVJaT2E4RThmL1NydUp1ZUlX?=
 =?utf-8?B?YXhvbmQ4dmxuTll4WVRzdzRUa2JLYkM4aEZFcHptUXk0TVg0eXdtOWJZWVEr?=
 =?utf-8?B?MnBjTy9jSit4Kzg3eld3QTBuTmRPS05yY0o3NXRPcVZqNFBScEJNdHFROGRm?=
 =?utf-8?B?RDhRM3JKMEVSYVFaOVlmYXRxU0ZSOVNuYUtQYW5QQWNzaWdxK3pjeTUzTDhi?=
 =?utf-8?B?amI4ZGZsTi8zTk1GUlV1SVVuV2FOZVdFeWI5Z1pXbXlqQzVVenRwa2FVWHUv?=
 =?utf-8?B?NmJ1dnZpRUVLaUlTOWxMUEMxQ3FIc1ZlY3A3QmhKS29XZDh4WGpNeHNWTUVY?=
 =?utf-8?B?OEhIZ05lUGdjSW14VnJBWnZENUhGQS9lMnV6M3hvdmJreDNXaWptRzRaaHhU?=
 =?utf-8?B?c2l2OU52bGR1NEdvaE9qYTBweTFCT1c1eTZOVWlVUllZK0JTOVFjRENHNGhJ?=
 =?utf-8?B?V2NvWEpKdFdHZC9QbGxNTmtpNHNJdlVUdzc4OHFFYzFzNzVsMjl0WjVPd0pJ?=
 =?utf-8?B?QldUWlVoYUpLdjkwamkyVVo1dXhYaGxURWVrS3ZoS1ZhWWx2SGxiQVhmWERC?=
 =?utf-8?B?aURwWXFPOGkwU24wdGpBTFNINHFLcldNbWhmQXB6L1c5RkxzbktlVER5K3JP?=
 =?utf-8?B?ZkZLdU1pSlVHTkhkeGp5dnhnUUN3Qnl0cFo5QmVaUHJhYklZZXZYQkllcyt0?=
 =?utf-8?B?V2NxT2RLZVZOWXZPdEtydnRhc21EbjFiQUp0OEdZWjMvNmo1eFdwcGZjL2Fk?=
 =?utf-8?Q?GJQ9WJUvXxLZv5osAC9odu0nC?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	lLi5GMizTy7PrYLg3A7LFaHVe4v3sRGzUifF8QZMBO1NLUt6X9Ji09yE1eHD8Or0Fh9nuzSDoLpkXAv/bjlU0DDVYBk2AbwA3mszVQfnVyQrV7B+ap7DQqkbzLiVHDc/0EZOPtUVi+g/Zogo+WTCvJQPqyp+ZTCjpiVOngEb3T1i+CICskX/DMErzzd89G4GjIp86SkjHXy+igKefXYswfgd4A6WIKNIhnYuqohzGysGo4Yka8sy9Y2o5qaOLPF36WfLmapAjAhNOSOnXxtoQKTE0Qu/f/YNNglS56SeNFrjdj5kGJxP0wCz9yeR0HXt4Xbft3NBk/XC89WBJGa1S8FwJh36XiidY1zwQhOE69rdhBh8hIgifQzVLl1C5Ey9GSUcqC9X/Up+mrQkOk26MbfsXo7iRkF4mtZUpMWVyMrUCXbByrxg6/F4Q95UjbR5JomnlvW1wt44aYGBB4iZgCxKZ9HXPNCb/EmOnqk3bwugDKGv+/TIo3t7saR471hjhIDwvkEu57CDre/zgW3nuUppl15cpqYX9zVPW/OM5ML4jRRTyXLpoGn/uyG8UHR+2VvSFhOGMSQX9L4juvizQJh/YCWyjNASX4sqg6T7I3k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a22825eb-0f24-46b7-2fd9-08de05f480d0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 22:54:42.6947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ne4ZXO2DCnZ3y5rrvL0ROf8j4CY7hfULQ+mrR7CgRwUcfiVTanjtvSIVg6wqfMVKCIdGBr0Npfga91O0oiPQTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5890
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510070175
X-Proofpoint-GUID: ftbflntmhbordEes-yH_sdeUIitFSP8e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA3MDE2NCBTYWx0ZWRfX4q9TvH1UBPMt
 U5pPEhLsCAMwhN4JQXzqqhF+eangXTdgG0b7F6AAqYummSypWmyl2P2gGImqSaOfVUiXh2P5zjG
 XJC/oTnVmd/KSHXrVBSk3oMjt+gJzFDXCccRL74hQbL74JL3gTREnhxSq0jAi7zjYkEtF4dbAgy
 VQHdaAibp89NOm8dheEzdERsoRRvGbJnLNcXcbqiS5KuDpjbBsSs6Jd2X2ywRGfjxRUzfE5NxGm
 Wczz+VYwRQ9LZjHPMZLo2V3oHs1KmenpgbuesdO/Ytl0p4uVbSi/r1VhCNLv0nKIH1I8pJP4uHz
 O2V6xZ9NTHzObBkUILwclpRHoiNpL8LsfdBqXf+Qf+8o2JwKkxr5qxHz34zoV4r/jNbkrMRgJpV
 bh/LHJU2Y5KY9aHKtjzHdfspB9U9FQ==
X-Proofpoint-ORIG-GUID: ftbflntmhbordEes-yH_sdeUIitFSP8e
X-Authority-Analysis: v=2.4 cv=Vaj6/Vp9 c=1 sm=1 tr=0 ts=68e59a3a cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=aLgssf1aOZdrks_2IvoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

Okay.  I'm withdrawing this patch.  An alternative will be posted shortly.

On 10/7/25 11:41, Kris Van Hees wrote:
> Given that vtimestamp is used here in a way that is not actually depending on
> its meaning, I'd rather you just change the tests to not depend on vtimestamp,
> but instead use something else (e.g. timestamp).
>
> XFAILing them does not seem to e right since vtimestamp is not relevant here.
