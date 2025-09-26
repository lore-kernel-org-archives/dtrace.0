Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25D3202F70
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758913582; cv=fail; b=t2KBcqbuw+QWX5lMtw6xXX5t1GEvTmj8nWY8B7DG38IErdDohttMLZbIwUdWj+o8X203koceTBZNf4j1NelFv/Tdm8nOZQnBYPNUEjrpcRSr2cKRVpF8RYa+Ulck06RM/V1/0n2q8o9GAjIM33g2bHRXADCFhOutCe68Ob/ZZRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758913582; c=relaxed/simple;
	bh=DAv9lBaPzukBfT4bel3D41A0WRGSSaDfXsGIpY2wHQE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mUC6uB9kBKsQTWCOKpZyOmMRE5VDh2o2rVM/23mUhyD1GjfC+rwYjWw3GZ1Aiw6Qst4AJiCZ1MeShQPI3c8TUyU1yJjRJESATEDiN7yPkHMfS7e8elYncSS1vyqXM2DFQdyFqZlPQ27BWiZjeDg04L2JDWL6osaU7ZCAIpwudxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b/Nkg2vL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XpIfEdRF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b/Nkg2vL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XpIfEdRF"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIislL014269
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=tangGpznVbdQkwtbWB1aKpE2+SuITXDXJGHMH4uSZfY=; b=
	b/Nkg2vLw3faMEM+V1AnJgE88TKwKoSJNwle8dRnAOIOBH6hiOGHmv/UibXNERnX
	CFeY+xmK0fWiWMAL3+1Kg3hL9r8kCeXoie5n1KrISljQ9dznrl4s6jg1N1HKW517
	e3dRvrciO/cuo27545MB3XEOgfvf4gUZ6mPc/yMoLyNZ3+nQ5vwcu1iXZ+QsY+q9
	ktDvvfXH69PI2mxCUnHcrXGQfEckpy9B66JBoyZF+oQvcvc1oZ1+KLKNQGQIZdEr
	XZMflvMaeZE485leUkEgRrfZRc0E8GvkfgB8t3Hag9JkChSJYHLOMvE9Hfn1+c9Z
	5UkP23+t67ha66h/TfofIg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49e0cfg0y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58QIP9BY023334
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:15 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013034.outbound.protection.outlook.com [40.107.201.34])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49dd8m7f6v-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 26 Sep 2025 19:06:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+EoX3ed0L72St8hGMcyqJxZlqgL4Jwipj0yvvLp+Pnh8HxZJ1uD60cP4qNKSAM8HB38DAGuRn5QDC1lK7r7QBteNFlXrHVQe4T6QJstGq7ZX6xEnv7NCTVGa6g5zGHkoCOPDe4n7s1qnUpOdDudlHPZG2M3HBnHM86sxUZvUEaAgVANn1G8YF9ExV8cjRfvCVDo837ASVFu1og1qktjSEeCa2L+qbcjtvBe0uZgileUNxHl18uaXzTj5lNp6wm4OfRGWkyrUKi29pfXqqMBryEjJWPfhd1NzdrHyUozrIXFLD2uXpluLfFHdJUyti+j1yjLE2RV1TQOgmMu+CZCgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tangGpznVbdQkwtbWB1aKpE2+SuITXDXJGHMH4uSZfY=;
 b=pq6Z1tq3Dh3j/NZxE363bXWjFuTiw7vMrMoi1dIwj2701YVbmvUKvPLEBZOOJ4J61gpFClymyOys8uJOQw/9J47B9WNWMKJwMKaH86arVMzXOTsiYgQ+8KrCLUxwyOiZIkVSEhLw2OIoNaS8/1HRmqr/AktBlMzFZDab+JiVKDyuEjZhDQ2SMv4XPzk8IxAgy2M52c4XNdbKiXcUVhKyKqjDPEoYyYJXkea7slcwkDrcY+1MFvm93OgUIrIbRLRag7oYUyyMdkeaaOYWBpZrJ3oZQgs2q99bm2W3xFQxZ0K1W6VwBqbTSTTZ0J0UYwQN4391ePrT2wte0B2EYBV1yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tangGpznVbdQkwtbWB1aKpE2+SuITXDXJGHMH4uSZfY=;
 b=XpIfEdRFMi8xcOTsNbbBa6/+3qmAdo+JIZG6bAGXr1YcyJghpa9mKua7stvrM/IA6oNZwnaqO/UchN09MDJJQt6KJEdRgyTZ3KKukFLf+Y7mf3xdk4eziweAAUw1W1WQKM6OLW81R8VZAPZP/DQqBE+4bxe8Mhm7TN5H5zERCgk=
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com (2603:10b6:a03:3da::17)
 by SJ5PPF0687F9010.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::786) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 26 Sep
 2025 19:06:10 +0000
Received: from SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7]) by SJ0PR10MB5647.namprd10.prod.outlook.com
 ([fe80::8db4:df1d:6afd:e4a7%7]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 19:06:10 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 07/20] doc: Remove internal ID definition at top of file
Date: Fri, 26 Sep 2025 15:05:44 -0400
Message-Id: <20250926190557.8485-7-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20250926190557.8485-1-eugene.loh@oracle.com>
References: <20250926190557.8485-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0236.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::31) To SJ0PR10MB5647.namprd10.prod.outlook.com
 (2603:10b6:a03:3da::17)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5647:EE_|SJ5PPF0687F9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db42b61-1a72-47b4-f6d8-08ddfd2fc105
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGQ4TFFtdjExZnVrd2ZNbVduSytnd3hlb2srNkJaUlFOWlVmUVBDTy83ZWt6?=
 =?utf-8?B?T2FMVHZCcGxSczI1MDh0YWJuVHFhMFU1allzMUxBdCtWMnZ1U2FqVm1TeEhS?=
 =?utf-8?B?Z1YyNlBWZGlzRHRrZVhZK3lJMkdjbkZpZTI1QzYyUk5aUEhoZlBBNTlQcklC?=
 =?utf-8?B?WGZnY0NOTDhFbzQ0a2FZNm9QOE5sQUFENnNrZEtkWjdDV3N1ZWUrc2REVjZp?=
 =?utf-8?B?YjcyaE9OSmZqcTFwblhMaG81ZUtpNFVvc2tDODZGR2V1SUFCVngra3hKWno4?=
 =?utf-8?B?cmx6NElwT0FYZGZXN2hPTHpHd3RBeTlOSy9SRnpnS0VjdklsWS9kM0k5RjBs?=
 =?utf-8?B?QTJENnUvRkpieXhuMDU5cEQrSGlYS0VzSDVKZ2VIQ3kxWExpbnVhUzRITWVn?=
 =?utf-8?B?QUV4dUZvRStLc1VtcFdhRnB0c3J1VFBXc3o1U2pHc2FtNUhnNGwzL3VrdTdV?=
 =?utf-8?B?OXpHYU1qSjNuVW9XSEQyKzE0dThqTXNpdFpTMEI4aWEyMUczVDZ3SHl6enhh?=
 =?utf-8?B?Yy93VDR0aEoydHFiNzZwRGNCMUlSbElnQ1Z3ZmFLbVlHWnhXR1BaZGtqRGdk?=
 =?utf-8?B?WXBzNzdKT3NqL05mTFFLOEUyOTUraDdNOFUrZ3dxVGdjKzZtb3lnc0dmVjRq?=
 =?utf-8?B?OE4xRnZkd3U1MkJ0RkdnTzhLRVFrWmZtM2ZFV2s1aHhoN0lLVVIrMm1qUEI1?=
 =?utf-8?B?RlBmdjlXaUNyd0pldzdLbDFGbXNSVmxJZDQxWFJ3eGMvSjZSZjNhdGN5Wkd3?=
 =?utf-8?B?cTI3Qy9SV0E5RU95ek90RDFFeGF0S2wzZFpDaHhpeTZ2Ynh0YkhCYjZZREJ2?=
 =?utf-8?B?ZGZIL1JQdDdpL01GM2tQK0F4QTNaTGkxMzJML3NYNzc5WjBDUnZQVTZla0lH?=
 =?utf-8?B?aWVMRXQwZ2s4ZnBGZDUxejMybENPS1UzVXp0clBsbERIbXpkNWxmVjBPK0JD?=
 =?utf-8?B?VXd4M09Fd1JZKys2ZUlQMDlzNHNlQXFsMjMwZlNyWU1lUEllOXVKc1Rld2hK?=
 =?utf-8?B?MkREeGRKUk1KaGZUQ01VWUEzUWljV3ViRzJ4RUN3SUMrSE9BYWxPSzJuTE01?=
 =?utf-8?B?aWluUW1hekxuSGdDaVNlQkJNNlFTaWt5QnJMc3cvalFtSWZGYWk4RVQxaXR0?=
 =?utf-8?B?NzYrVTkram5IYmEzYzdFZFdZVUxoNkJwTlZ6YWtiNXJaWGpzZ2lTOFhOeDF1?=
 =?utf-8?B?cHNhaHJGZFY3cHg4aERYbDBNekgxdkJvcW8vb1QyNFAyRHMrNDVpT0NhZFBs?=
 =?utf-8?B?bFlNUW82R0cxbVhnWTJ2RGZsakZOdDdUVGp4aTVNZFpsd1ZlbXRqUmxPeElL?=
 =?utf-8?B?RTZ4SXJCbWhTOEozYit5M2ZDMFhHVGg4SE5lOWZWZVArZ3F1NS9SUU1xK3lj?=
 =?utf-8?B?RWNpa2RuSm0xa0VQRVE2c2xXaGpMVTlGRnpEdjFqL3lVYUUxcTdFYmtPOVVK?=
 =?utf-8?B?emNQRE5kTVZyTFdFVFRyUGFiZjQ0MWlGN2J4aUNKNkJKRzdJZTRoZmNQV2o0?=
 =?utf-8?B?S3RBeWxzV3UvbjdhYkpSZmZjejhBWE9ZWkxGUW9ybUlOdkltYVVCaXc5SVBK?=
 =?utf-8?B?T2o3YjBRQXRoNlU3UDQ5c0QwV2V1TDA3M1BRRVhEdnRPcnN4M0ZKVEYxYm1l?=
 =?utf-8?B?NGhKMzRGNzN2ME54SXZiblRYVkF0azNrQUhjQlNrcUNiNlBYRFdjajRRVFcw?=
 =?utf-8?B?d1lBSGx2Sm5kNU5tcXN3dDNQNnFDclRKTzZMZnpFRWpZOFZBYjZZeEFoUFV5?=
 =?utf-8?B?TG96SmpsSWNBOWNYNlV4ZzZaL1ZZbnROWFN0ejBoenhaM05EdjF1bmJWdVQy?=
 =?utf-8?B?UmFSQThiQTF4ZzBzS01RQ1NXMXZRU1Y0Vk4rS250MERNak9tNzZvNFJkMkc5?=
 =?utf-8?B?NHpRK1lKa2gxSW5CV2NERTBMVC9penByYUhGVXB0U1lFdlJrK0JUUEJHeTJ2?=
 =?utf-8?Q?U/5gGJNu2qpxaqxokpvJzPrcQy0GKBlB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5647.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzRyblJyV1FOcXNxYU9PUTRpYTVzRnBCMlJXeXZFME9wVlhzYU9tRkhHMFpJ?=
 =?utf-8?B?NEN4V0VUZDNiTHAxRklPMDlPTXNyL25hZkM2TkVvS1ROdGd4VzA5YzRsdlNH?=
 =?utf-8?B?UXRtTEI1WUdINjAvWW8rYWFPK3FFNXdKQ3R5dHp1UTBLUUlCL25FdjB1cGls?=
 =?utf-8?B?NEhxY2F0ZE0rY3BJZzdHbWZWdkV2dGNVdGJlK3RNMGhUWjk0VHhLeWc3aHpm?=
 =?utf-8?B?ZVlIMFpmWi9wVnBveWFSMUJlaVZwWms1RHErR2ZHamJnY0U0bUhoZ04vWEJJ?=
 =?utf-8?B?REs5V2FRSUJnay9MZXFVV3YyZHk1R0RRb0M2NHJrNmV6M3hTYldCT0hDcFVI?=
 =?utf-8?B?SGNMM2RoUFZLc2N0K1dvTENUVU1JRzNwUTdyL2xaTlJVTEJoYS9SM0VMd1hE?=
 =?utf-8?B?dTE2TFN3dHBQcmF0YTdXQ2VtRDFiS0tHTit5N1hqMlBkc1VadW15U3ZGMFlN?=
 =?utf-8?B?Tm53NThialdNY1Bya2xaVEdDQkl6SkREYzVFNDc5QmxvYThFS2NEdVV4TXk5?=
 =?utf-8?B?K1hKS1BHcVNoekpDMWR1L2gwbVFVZ0JRR2RqM2ViUVcrMTdWOXExMFIvcTJj?=
 =?utf-8?B?djNxTmxlcjJwYVBqNWsvc3FPUlhpK0dNMElFZkU0bEZ5RENQeWptaHZGUDVY?=
 =?utf-8?B?N1NKb0Z3SmdHaklCV0g1czR0bUtVMWZPU3M4eHEvd3BiajcwbWk5NjhXSitk?=
 =?utf-8?B?dm1HeWN5aktBMHQzWW0rNFpPcFZ5MHMxaGNZNEc2WFpGMGJMQTk5dU5rY0ZG?=
 =?utf-8?B?dDJzL3dodWRhTURtajcrY2x6R3ZkSERta2tVRlRaRzhsMk1GVUIyd2FCelVq?=
 =?utf-8?B?cFlyckErNFJxcktsZVJ0NHpYSjhwblROdHF5a05JMWxhekZreU1GL3ZSK1lx?=
 =?utf-8?B?TkRHd2xGWEZpK2JsdWR3aXYwRjgvWTliZDlNOE80Nk1DMkNmakhpai9sNzJ1?=
 =?utf-8?B?em43aTJORERqb0dzZTNIRWdXK29ERnVqb3djUVNONnBHL1g0V1hIMDZEcU5F?=
 =?utf-8?B?M3NCeVNoUkpjM21nTEpBdytCVlBDM0hUVnFscjJ2ekpRaWNYeHhHVDhuVVhB?=
 =?utf-8?B?K1drWU1rYzJONEZNcFFmSnV1S3ZvcW4yRFh1bWM4cXhFTWFCc1N3UGR5Mmhv?=
 =?utf-8?B?UWJVc05JblZoank5dk4xYTJXeDR1ZWYyZmlQMXVLTkhmNWFwSjZGTjkxcWtW?=
 =?utf-8?B?ekhlMjdXaUlnUUFiWlhuWXl4R2ZjcVRTeC8rdS9VTWF0Yzlxdk5hTXlmbmQ3?=
 =?utf-8?B?MTVCVmhISkJjMUpUckVLTFRFUXZ4WHpWdEtuWHFRN0QwMEZFTkJiVTVLREQ4?=
 =?utf-8?B?UTdNOXNvcEtWZWlLbzRaMzlOUHVnVjE5SHdoS0w2VUpRNCtuUnhoa0wzZUJG?=
 =?utf-8?B?dncwQzJOSERWOHJST2cyMURxN3dWczRlK0VzdklxMm1WelZwekYreFRHR040?=
 =?utf-8?B?WE91aUUrYUcrWm0xRlNUazdPMGlubkxGRHhWV0xVYkpiajI5Wm9hREY3dnNm?=
 =?utf-8?B?SldwNTdicHBhRnU3ZnBTZFZLeStZUGRFNzdaRzgyaGxxZTFIL043dmg2OW5I?=
 =?utf-8?B?MlRRRlBud3VDM2FoaWJlRHpNbmtMd2YvcTRTR3RDNGVtY2tVZU40USsxYkg3?=
 =?utf-8?B?YWYzdHVJTnMxK1UwekdadEVtRTZpZlhEUUxUekdlTStUWEVoeU92N3FqL2dk?=
 =?utf-8?B?QUdZcXJ5UFBiWlZzL3pDaS9YdVZjaU0rN2NjN1dFSGc0V1U0eVlDZ0IybXY2?=
 =?utf-8?B?ZFZTL2lld0FOQjBJWVY0dzUxMUZhUmpIRjVPWGltN0w0WXZBS0lsT0Fuei8x?=
 =?utf-8?B?RVVLT21jMVU3NnpJMUFJUXJyS1lPUUdiWVFnYkd5ZENCY0NsSXhGTVpiVzhB?=
 =?utf-8?B?SkNIc2IxS1ZPOEtPWTF2VzdlQ1Fsa1phUk9IS21Pc3R2OWpGZUprdnRDQTZK?=
 =?utf-8?B?WFhEaU5nTG1WK1RLbS9WZzVKbWpLTllxRk1POVE4L2NnaXpwcTIwUEZvZ2Rs?=
 =?utf-8?B?RkJseEtEWmVpRVVvYmZyaHFWNndDWmlKcVhWeDdTWll3akl0Z2s3NXVhZ3FO?=
 =?utf-8?B?eHpDMTRJYXpFLzBWNXoyVDU4ejljMGlTeFE4bHo3Zm1JTWpjMHdoeGlMNDI4?=
 =?utf-8?Q?U+Z4vvxeoxguskyaYBmRD8FGJ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	K9sFtEvG289pjMWgIWM0m1SNz0v6NZYTPTdRTCrf1gqqTCbXR70yjrYld1TRWBL3Z3pXj7wY58GuQNJsHl+l1ra9Y8MK4IcptZIV5y6jS90TBNtXMCLEVwPLLp8VTQWwjXatIf4nlnAc1CPWrCxnUsRx+yLQhTQqgMh4+3ibmvjDQw9ybRLD9WgTPs5U/pc8obIoFmct10fNzFaJaMmSH64TsctOZxwVlkYgcstrHhYJSFCnhc4fEpOe6nS0r8lXEpwO4BrxVo42ywdQ12lFFoEiKc5oTG+SpeNskno1MiYp1fyjJlQ5RPHuwLygZ2QtwfyWxAgFbSz6Ccmar6sjphRjZ0xXY/acrjfKYd02vIp20SGqFn5pXUAS8S1PjsTzO4oO5QDoaK6NbSg3zIXgDVu9uTFPUagIMVhPnvtJb+i2BuUpRkm1v40xYF4VQpQbYzCUVG0negg+/WSGIeVVG3C3m2wtuRTJOpNIjedLFb9WLnQiedLZUo3d8pe6mejjB+dQ/KU275LuiTWHP8gcafGfbADMEeeCqLJEsUdRC8DRjjL+n8FpEmjcP7yG1LwsWCGTYIlk0bc8H62pT/yB9ooS2hkX7hDcA5X4yX0x1+w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db42b61-1a72-47b4-f6d8-08ddfd2fc105
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5647.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 19:06:10.1256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GRSctXl2sgcgKtJzoR1/nYkXzWLvak/ut5wF4egOJClfD3vA1OsMoz7/jH770psxeYjbAH6E9rzdn3K3wxMAQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0687F9010
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_06,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2509260172
X-Proofpoint-GUID: 6anYjv5NP24qt8WnPhMYeeKOReBtKxK8
X-Proofpoint-ORIG-GUID: 6anYjv5NP24qt8WnPhMYeeKOReBtKxK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDE3MCBTYWx0ZWRfXy87dlKFq9feV
 zirCxIWzX2L3hFLVwVaWMqsBpF36rc47e7BQkYlzyzbyfC88J+In1dPXfDt7m7jfqzSmQVaSh4l
 dhgTqorgSuBkkUiHby/U7c+ANH+zRlPTlSgbMn3lqhHI+1/hJJ7RxUkIZ89b1VctuMhSp4Mnv09
 gWfB4KMX/YRIODerioPd6jZNeWmDsuxZbKsj0kHj5Au0E++AfKS8PXDmbIqgI1LSvGLQKuLIOYa
 rfe08RyCnvzUaCK9SwwLfiKVUa7zro+LEZUo9MWLE/3SfxBs6poU94QhqQHSciSpQqcgFrSJf00
 DVvSLM7puH3OA8m4XbKuk8iCRHg9JQHHrBriDApvoPP8g6gfglEjzBKCyZ91aQAyTxTp272oD9j
 Z6OByqKpx59XD7G3U4X2JF1oq2zJiA==
X-Authority-Analysis: v=2.4 cv=S/XUAYsP c=1 sm=1 tr=0 ts=68d6e428 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=DZmlGDFoY2OQplkCiysA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10

From: Eugene Loh <eugene.loh@oracle.com>

One can define internal or anchor IDs in files to enable links to
specific locations within a file.  This makes no sense at the top of a
file, which is where one goes by default.  Besides, the {#id} syntax for
defining these IDs in Markdown seems not to be working anyhow, exposing
meaningless text to the reader.  Remove those IDs.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 doc/userguide/explanation/dtrace-about.md     |  2 +-
 .../dtrace-components-and-terminology.md      |  2 +-
 .../dtrace-howto-create-a-dtrace-script.md    |  2 +-
 .../how-to/dtrace-howto-install-dtrace.md     |  2 +-
 .../dtrace-howto-list-and-enable-probes.md    |  2 +-
 .../how-to/dtrace-howto-use-predicates.md     |  2 +-
 doc/userguide/index.md                        | 72 +++++++++----------
 doc/userguide/reference/aggregation.md        |  2 +-
 doc/userguide/reference/compiler_options.md   |  2 +-
 ...gram_syntax_reference_program_structure.md |  2 +-
 .../dtrace-ref-DTraceSupportforStrings.md     |  2 +-
 .../dtrace-ref-PointersandScalarArrays.md     |  2 +-
 ...ticallyDefinedTracingofUserApplications.md |  2 +-
 .../reference/dtrace-ref-StructsandUnions.md  |  2 +-
 ...dtrace-ref-TypesOperatorsandExpressions.md |  2 +-
 .../reference/dtrace-ref-Variables.md         |  2 +-
 .../reference/dtrace-ref-speculation.md       |  2 +-
 .../dtrace_builtin_variable_reference.md      |  2 +-
 .../reference/dtrace_command_desc.md          |  2 +-
 .../reference/dtrace_command_exit_status.md   |  2 +-
 .../reference/dtrace_command_operands.md      |  2 +-
 .../reference/dtrace_command_options.md       |  2 +-
 .../reference/dtrace_providers_cpc.md         |  2 +-
 .../reference/dtrace_providers_dtrace.md      |  2 +-
 .../reference/dtrace_providers_fbt.md         |  2 +-
 .../reference/dtrace_providers_io.md          |  2 +-
 .../reference/dtrace_providers_lockstat.md    |  2 +-
 .../reference/dtrace_providers_pid.md         |  2 +-
 .../reference/dtrace_providers_proc.md        |  2 +-
 .../reference/dtrace_providers_profile.md     |  2 +-
 .../reference/dtrace_providers_rawtp.md       |  2 +-
 .../reference/dtrace_providers_sched.md       |  2 +-
 .../reference/dtrace_providers_sdt.md         |  2 +-
 .../reference/dtrace_providers_syscall.md     |  2 +-
 .../reference/dtrace_runtime_options.md       |  2 +-
 .../reference/dynamic_runtime_options.md      |  2 +-
 ...ing_dtrace_compiler_and_runtime_options.md |  2 +-
 37 files changed, 72 insertions(+), 72 deletions(-)

diff --git a/doc/userguide/explanation/dtrace-about.md b/doc/userguide/explanation/dtrace-about.md
index 4ab252a79..8c6039947 100644
--- a/doc/userguide/explanation/dtrace-about.md
+++ b/doc/userguide/explanation/dtrace-about.md
@@ -1,5 +1,5 @@
 
-# About DTrace {#concept_about}
+# About DTrace
 
 DTrace is a powerful tracing tool that's available on Linux. DTrace has low overhead and is safe to use on production systems to analyze what a system is doing in real time.
 
diff --git a/doc/userguide/explanation/dtrace-components-and-terminology.md b/doc/userguide/explanation/dtrace-components-and-terminology.md
index b187055a4..1d7a35076 100644
--- a/doc/userguide/explanation/dtrace-components-and-terminology.md
+++ b/doc/userguide/explanation/dtrace-components-and-terminology.md
@@ -1,5 +1,5 @@
 
-# DTrace Components and Terminology {#concept_terms}
+# DTrace Components and Terminology
 
 Learn about the different components and the terms used to describe them within the DTrace framework.
 
diff --git a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
index 199649a9f..72e085b2e 100644
--- a/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
+++ b/doc/userguide/how-to/dtrace-howto-create-a-dtrace-script.md
@@ -1,5 +1,5 @@
 
-# Create a DTrace Script {#dt_create_script}
+# Create a DTrace Script
 
 Learn how to create a DTrace script to develop understanding of the D Programming language.
 
diff --git a/doc/userguide/how-to/dtrace-howto-install-dtrace.md b/doc/userguide/how-to/dtrace-howto-install-dtrace.md
index 45da88fd8..83de8f905 100644
--- a/doc/userguide/how-to/dtrace-howto-install-dtrace.md
+++ b/doc/userguide/how-to/dtrace-howto-install-dtrace.md
@@ -1,4 +1,4 @@
-# Install DTrace{#install_dtrace}
+# Install DTrace
 
 The following instructions provide steps to install DTrace on different Linux distributions and to verify that the installation was successful.
 
diff --git a/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md b/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
index ad9c3a4d3..91b005657 100644
--- a/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
+++ b/doc/userguide/how-to/dtrace-howto-list-and-enable-probes.md
@@ -1,5 +1,5 @@
 
-# List and Enable Probes {#list_enable_probes}
+# List and Enable Probes
 
 DTrace providers publish available probes to DTrace so that you can enable them to perform functions when they fire. You can use the `dtrace` command to list all available probes or to enable a probe.
 
diff --git a/doc/userguide/how-to/dtrace-howto-use-predicates.md b/doc/userguide/how-to/dtrace-howto-use-predicates.md
index c32f3050f..44bc41d5d 100644
--- a/doc/userguide/how-to/dtrace-howto-use-predicates.md
+++ b/doc/userguide/how-to/dtrace-howto-use-predicates.md
@@ -1,5 +1,5 @@
 
-# Use Predicates For Control Flow {#dt_preds_dlang}
+# Use Predicates For Control Flow
 
 For runtime safety, one major difference between D and other programming languages such as C, C++, and the Java programming language is the absence of control-flow constructs such as `if`-statements and loops. D program clauses are written as single straight-line statement lists that trace an optional, fixed amount of data. D does provide the ability to conditionally trace data and change control flow using logical expressions called *predicates*. This tutorial shows how to use predicates to control D programs.
 
diff --git a/doc/userguide/index.md b/doc/userguide/index.md
index abd1096db..a8f6a7e76 100644
--- a/doc/userguide/index.md
+++ b/doc/userguide/index.md
@@ -1,31 +1,31 @@
 # Using DTrace for System Tracing
 
 -   [Get Started With DTrace](how-to/dtrace-guide.md)
-    -   [Install DTrace](how-to/dtrace-howto-install-dtrace.md#install_dtrace)
+    -   [Install DTrace](how-to/dtrace-howto-install-dtrace.md)
         -   [Build and Install DTrace on Gentoo Linux](how-to/dtrace-howto-install-dtrace.md#build_install_dtrace_gentoo_linux)
         -   [Install DTrace on Oracle Linux 10](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_10)
         -   [Install DTrace on Oracle Linux 9](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_9)
         -   [Install DTrace on Oracle Linux 8](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_8)
         -   [Install DTrace on Oracle Linux 7](how-to/dtrace-howto-install-dtrace.md#install_dtrace_oracle_linux_7)
         -   [Verify the DTrace Installation](how-to/dtrace-howto-install-_dtrace.md#verify_install)
-    -   [List and Enable Probes](how-to/dtrace-howto-list-and-enable-probes.md#list_enable_probes)
-    -   [Create a DTrace Script](how-to/dtrace-howto-create-a-dtrace-script.md#dt_create_script)
-    -   [Use Predicates For Control Flow](how-to/dtrace-howto-use-predicates.md#dt_preds_dlang)
+    -   [List and Enable Probes](how-to/dtrace-howto-list-and-enable-probes.md)
+    -   [Create a DTrace Script](how-to/dtrace-howto-create-a-dtrace-script.md)
+    -   [Use Predicates For Control Flow](how-to/dtrace-howto-use-predicates.md)
 -   [DTrace Concepts](explanation/dtrace-concepts.md)
-    -   [About DTrace](explanation/dtrace-about.md#concept_about)
-    -   [DTrace Components and Terminology](explanation/dtrace-components-and-terminology.md#concept_terms)
+    -   [About DTrace](explanation/dtrace-about.md)
+    -   [DTrace Components and Terminology](explanation/dtrace-components-and-terminology.md)
         -   [Probes](explanation/dtrace-components-and-terminology.md#concept_terms_probes)
         -   [D Programs](explanation/dtrace-components-and-terminology.md#concept_terms_programs)
         -   [Aggregations](explanation/dtrace-components-and-terminology.md#concept_terms_aggregations)
         -   [Speculation](explanation/dtrace-components-and-terminology.md#concept_terms_speculation)
 -   [DTrace Command Reference](reference/dtrace_command_reference.md)
-    -   [About the dtrace Command](reference/dtrace_command_desc.md#dtrace_command_desc)
-    -   [dtrace Command Options](reference/dtrace_command_options.md#dtrace_command_options)
-    -   [dtrace Command Operands](reference/dtrace_command_operands.md#dtrace_command_operands)
-    -   [dtrace Command Exit Status](reference/dtrace_command_exit_status.md#dtrace_command_exit_status)
+    -   [About the dtrace Command](reference/dtrace_command_desc.md)
+    -   [dtrace Command Options](reference/dtrace_command_options.md)
+    -   [dtrace Command Operands](reference/dtrace_command_operands.md)
+    -   [dtrace Command Exit Status](reference/dtrace_command_exit_status.md)
 -   [D Program Syntax Reference](reference/d_program_syntax_reference.md)
-    -   [Program Structure](reference/d_program_syntax_reference_program_structure.md#dt_prog_struct)
-    -   [Types, Operators, and Expressions](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_types_dlang)
+    -   [Program Structure](reference/d_program_syntax_reference_program_structure.md)
+    -   [Types, Operators, and Expressions](reference/dtrace-ref-TypesOperatorsandExpressions.md)
         -   [Identifier Names and Keywords](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_ident_dlang)
         -   [Data Types and Sizes](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_dtypes_dlang)
         -   [Constants](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_consts_dlang)
@@ -43,39 +43,39 @@
             -   [Enumerations](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_enums_dlang)
             -   [Inlines](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_inlines_dlang)
             -   [Type Namespaces](reference/dtrace-ref-TypesOperatorsandExpressions.md#dt_typens_dlang)
-    -   [Variables](reference/dtrace-ref-Variables.md#dt_vars_dlang)
+    -   [Variables](reference/dtrace-ref-Variables.md)
         -   [Variable Scope](reference/dtrace-ref-Variables.md#dt_vscope_dlang)
-    -   [Pointers](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptrarr_dlang)
+    -   [Pointers](reference/dtrace-ref-PointersandScalarArrays.md)
         -   [Pointer Safety](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptrsafety_dlang)
         -   [Pointer and Array Relationship](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptrarel_dlang)
         -   [Pointer Arithmetic](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptrarith_dlang)
         -   [Generic Pointers](reference/dtrace-ref-PointersandScalarArrays.md#dt_genptr_dlang)
         -   [Pointers to DTrace Objects](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptrobj_dlang)
         -   [Pointers and Address Spaces](reference/dtrace-ref-PointersandScalarArrays.md#dt_ptraddrsp_dlang)
-    -   [Structs and Unions](reference/dtrace-ref-StructsandUnions.md#dt_structunion_dlang)
+    -   [Structs and Unions](reference/dtrace-ref-StructsandUnions.md)
         -   [Structs](reference/dtrace-ref-StructsandUnions.md#dt_structs_dlang)
         -   [Pointers to Structs](reference/dtrace-ref-StructsandUnions.md#dt_ptrstructs_dlang)
         -   [Unions](reference/dtrace-ref-StructsandUnions.md#dt_unions_dlang)
         -   [Member Sizes and Offsets](reference/dtrace-ref-StructsandUnions.md#dt_memsz_dlang)
         -   [Bit-Fields](reference/dtrace-ref-StructsandUnions.md#dt_bitflds_dlang)
-    -   [DTrace String Processing](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strings_dlang)
+    -   [DTrace String Processing](reference/dtrace-ref-DTraceSupportforStrings.md)
         -   [String Representation](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strrep_dlang)
         -   [String Constants](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strcon_dlang)
         -   [String Assignment](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strasg_dlang)
         -   [String Conversion](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strconv_dlang)
         -   [String Comparison](reference/dtrace-ref-DTraceSupportforStrings.md#dt_strcomp_dlang)
-    -   [Aggregations](reference/aggregation.md#dt_ref_aggregations)
+    -   [Aggregations](reference/aggregation.md)
         -   [Aggregation Functions](reference/aggregation.md#dt_ref_aggr_funcs)
 	-   [Printing Aggregations](reference/aggregation.md#dt_ref_aggr_print)
 	-   [Data Normalization](reference/aggregation.md#dt_ref_aggr_dnorm)
-    -   [Speculation](reference/dtrace-ref-speculation.md#dt_ref_speculation)
+    -   [Speculation](reference/dtrace-ref-speculation.md)
 -   [DTrace Runtime and Compile-time Options Reference](reference/dtrace_runtime_options.md)
-    -   [Setting DTrace Compile-time and Runtime Options](reference/setting_dtrace_compiler_and_runtime_options.md#dt_runtime_option_description)
-    -   [Compile-time Options](reference/compiler_options.md#dt_compiler_options)
-    -   [Runtime Options](reference/runtime_options.md#dt_runtime_options)
-    -   [Dynamic Runtime Options](reference/dynamic_runtime_options.md#dt_dynamic_runtime_options)
+    -   [Setting DTrace Compile-time and Runtime Options](reference/setting_dtrace_compiler_and_runtime_options.md)
+    -   [Compile-time Options](reference/compiler_options.md)
+    -   [Runtime Options](reference/runtime_options.md)
+    -   [Dynamic Runtime Options](reference/dynamic_runtime_options.md)
 -   [DTrace Stability Reference](reference/dt_stability_reference.md)
--   [DTrace Built-in Variable Reference](reference/dtrace_builtin_variable_reference.md#dt_ref_builtin_vars)
+-   [DTrace Built-in Variable Reference](reference/dtrace_builtin_variable_reference.md)
     -   [Macro Variables](reference/dtrace_builtin_variable_reference.md#dt_macrov_scrpt)
     -   [args\[\]](reference/dtrace_builtin_variable_reference.md#dt_ref_vars_args)
     -   [arg0, …, arg9](reference/dtrace_builtin_variable_reference.md#dt_ref_var_arg0-9)
@@ -185,22 +185,22 @@
     -   [ustack](reference/function_ustack.md)
     -   [usym](reference/function_usym.md)
 -   [DTrace Provider Reference](reference/dtrace_providers.md)
-    -   [CPC Provider](reference/dtrace_providers_cpc.md#dt_ref_cpc_prov)
+    -   [CPC Provider](reference/dtrace_providers_cpc.md)
         -   [cpc Probes](reference/dtrace_providers_cpc.md#dt_ref_cpcprobes_prov)
         -   [cpc Probe Arguments](reference/dtrace_providers_cpc.md#dt_ref_cpcargs_prov)
         -   [cpc Examples](reference/dtrace_providers_cpc.md#dt_ref_cpcexamples_prov)
         -   [cpc Stability](reference/dtrace_providers_cpc.md#dt_ref_cpcstab_prov)
-    -   [DTrace Provider](reference/dtrace_providers_dtrace.md#dt_ref_dt_prov)
+    -   [DTrace Provider](reference/dtrace_providers_dtrace.md)
         -   [BEGIN Probe](reference/dtrace_providers_dtrace.md#dt_ref_begin_prov)
         -   [END Probe](reference/dtrace_providers_dtrace.md#dt_ref_end_prov)
         -   [ERROR Probe](reference/dtrace_providers_dtrace.md#dt_ref_error_prov)
         -   [dtrace Stability](reference/dtrace_providers_dtrace.md#dt_ref_dtstability_prov)
-    -   [FBT Provider](reference/dtrace_providers_fbt.md#dt_ref_fbt_prov)
+    -   [FBT Provider](reference/dtrace_providers_fbt.md)
         -   [fbt Probes](reference/dtrace_providers_fbt.md#dt_ref_fbtprobes_prov)
         -   [fbt Probe Arguments](reference/dtrace_providers_fbt.md#dt_ref_fbtargs_prov)
         -   [fbt Examples](reference/dtrace_providers_fbt.md#dt_ref_fbtexamples_prov)
         -   [fbt Stability](reference/dtrace_providers_fbt.md#dt_ref_fbtstab_prov)
-    -   [IO Provider](reference/dtrace_providers_io.md#dt_ref_io_prov)
+    -   [IO Provider](reference/dtrace_providers_io.md)
         -   [io Probes](reference/dtrace_providers_io.md#dt_ref_ioprobes_prov)
         -   [io Probe Arguments](reference/dtrace_providers_io.md#dt_ref_ioargs_prov)
             -   [bufinfo\_t](reference/dtrace_providers_io.md#dt_ref_iobuf_prov)
@@ -208,48 +208,48 @@
             -   [fileinfo\_t](reference/dtrace_providers_io.md#dt_ref_iofile_prov)
         -   [io Examples](reference/dtrace_providers_io.md#dt_ref_ioexamples_prov)
         -   [io Stability](reference/dtrace_providers_io.md#dt_ref_iostab_prov)
-    -   [Lockstat Provider](reference/dtrace_providers_lockstat.md#dt_ref_lockstat_prov)
+    -   [Lockstat Provider](reference/dtrace_providers_lockstat.md)
         -   [lockstat Probes](reference/dtrace_providers_lockstat.md#dt_ref_lockstatprobes_prov)
         -   [lockstat Probe Arguments](reference/dtrace_providers_lockstat.md#dt_ref_lockstatargs_prov)
         -   [lockstat Examples](reference/dtrace_providers_lockstat.md#dt_ref_lockstatexamples_prov)
         -   [lockstat Stability](reference/dtrace_providers_lockstat.md#dt_ref_lockstatstab_prov)
-    -   [Pid Provider](reference/dtrace_providers_pid.md#dt_ref_pid_prov)
+    -   [Pid Provider](reference/dtrace_providers_pid.md)
         -   [pid Probes](reference/dtrace_providers_pid.md#dt_ref_pidprobes_prov)
         -   [pid Probe Arguments](reference/dtrace_providers_pid.md#dt_ref_pidargs_prov)
         -   [pid Examples](reference/dtrace_providers_pid.md#dt_ref_pidexamples_prov)
         -   [pid Stability](reference/dtrace_providers_pid.md#dt_ref_pidstab_prov)
-    -   [Proc Provider](reference/dtrace_providers_proc.md#dt_ref_proc_prov)
+    -   [Proc Provider](reference/dtrace_providers_proc.md)
         -   [proc Probes](reference/dtrace_providers_proc.md#dt_ref_procprobes_prov)
         -   [proc Probe Arguments](reference/dtrace_providers_proc.md#dt_ref_procargs_prov)
             -   [lwpsinfo\_t](reference/dtrace_providers_proc.md#dt_ref_lwpsinfoproc_prov)
             -   [psinfo\_t](reference/dtrace_providers_proc.md#dt_ref_procpsinfo_prov)
         -   [proc Examples](reference/dtrace_providers_proc.md#dt_ref_procexamples_prov)
         -   [proc Stability](reference/dtrace_providers_proc.md#dt_ref_procstab_prov)
-    -   [Profile Provider](reference/dtrace_providers_profile.md#dt_ref_profile_prov)
+    -   [Profile Provider](reference/dtrace_providers_profile.md)
         -   [profile-n Probes](reference/dtrace_providers_profile.md#dt_ref_profile-n_prov)
         -   [tick-n Probes](reference/dtrace_providers_profile.md#dt_ref_profile-tick-n_prov)
         -   [profile Probe Arguments](reference/dtrace_providers_profile.md#dt_ref_profargs_prov)
         -   [profile Probe Creation](reference/dtrace_providers_profile.md#dt_ref_profprobecreate_prov)
         -   [profile Stability](reference/dtrace_providers_profile.md#dt_ref_profstab_prov)
-    -   [Rawtp Provider](reference/dtrace_providers_rawtp.md#dt_ref_rawtp_prov)
+    -   [Rawtp Provider](reference/dtrace_providers_rawtp.md)
         -   [rawtp Stability](reference/dtrace_providers_rawtp.md#dt_ref_rawtpstab_prov)
-    -   [Sched Provider](reference/dtrace_providers_sched.md#dt_ref_sched_prov)
+    -   [Sched Provider](reference/dtrace_providers_sched.md)
         -   [sched Probes](reference/dtrace_providers_sched.md#dt_ref_schedprob_prov)
         -   [sched Probe Arguments](reference/dtrace_providers_sched.md#dt_ref_schedargs_prov)
             -   [lwpsinfo\_t and psinfo\_t](reference/dtrace_providers_sched.md#dt_ref_lwpsinfo_t_psinfo_t_sched_prov)
             -   [cpuinfo\_t](reference/dtrace_providers_sched.md#dt_ref_cpuinfo_sched_prov)
         -   [sched Examples](reference/dtrace_providers_sched.md#dt_ref_schedexamples_prov)
         -   [sched Stability](reference/dtrace_providers_sched.md#dt_ref_schedstab_prov)
-    -   [SDT Provider](reference/dtrace_providers_sdt.md#dt_ref_sdt_prov)
+    -   [SDT Provider](reference/dtrace_providers_sdt.md)
         -   [Creating sdt Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtcreatep_prov)
             -   [Declaring Probes](reference/dtrace_providers_sdt.md#dt_ref_sdtdeclp_prov)
             -   [sdt Probe Arguments](reference/dtrace_providers_sdt.md#dt_ref_sdtparg_prov)
         -   [sdt Stability](reference/dtrace_providers_sdt.md#dt_ref_sdtstab_prov)
-    -   [Syscall Provider](reference/dtrace_providers_syscall.md#dt_ref_syscall_prov)
+    -   [Syscall Provider](reference/dtrace_providers_syscall.md)
         -   [syscall Probes](reference/dtrace_providers_syscall.md#dt_ref_syscallprobes_prov)
         -   [syscall Probe Arguments](reference/dtrace_providers_syscall.md#dt_ref_syscallargs_prov)
         -   [syscall Stability](reference/dtrace_providers_syscall.md#dt_ref_syscallstab_prov)
-    -   [USDT Provider](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_prov)
+    -   [USDT Provider](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md)
         -   [Defining USDT Providers and Probes](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdtprobes_prov)
         -   [Adding USDT Probes to Application Code](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_probe_add_prov)
         -   [Building Applications With USDT Probes](reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md#dt_ref_usdt_build_prov)
diff --git a/doc/userguide/reference/aggregation.md b/doc/userguide/reference/aggregation.md
index 8bdd44b49..0114d26f3 100644
--- a/doc/userguide/reference/aggregation.md
+++ b/doc/userguide/reference/aggregation.md
@@ -1,5 +1,5 @@
 
-# Aggregations {#dt_ref_aggregations}
+# Aggregations
 
 Aggregations enable you to accumulate data for statistical analysis. The aggregation is calculated at runtime, so that post-processing isn't required and processing is highly efficient and accurate. Aggregations function similarly to associative arrays, but are populated by aggregating functions. In D, the syntax for an aggregation is as follows:
 
diff --git a/doc/userguide/reference/compiler_options.md b/doc/userguide/reference/compiler_options.md
index 8e2813c1f..6b16446d0 100644
--- a/doc/userguide/reference/compiler_options.md
+++ b/doc/userguide/reference/compiler_options.md
@@ -1,5 +1,5 @@
 
-# Compile-time Options {#dt_compiler_options}
+# Compile-time Options
 
 Compile-time options can control how DTrace programs are compiled into eBPF code that's loaded into kernel space.
 
diff --git a/doc/userguide/reference/d_program_syntax_reference_program_structure.md b/doc/userguide/reference/d_program_syntax_reference_program_structure.md
index 547fd7a36..e13bcd005 100644
--- a/doc/userguide/reference/d_program_syntax_reference_program_structure.md
+++ b/doc/userguide/reference/d_program_syntax_reference_program_structure.md
@@ -1,5 +1,5 @@
 
-# Program Structure {#dt_prog_struct}
+# Program Structure
 
 A D program consists of a set of clauses that describe the probes to enable, an optional predicate that controls when to run, and one or more statements that often describe some functionality to implement when the probe fires.
 
diff --git a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
index 98f482c63..367d9b133 100644
--- a/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
+++ b/doc/userguide/reference/dtrace-ref-DTraceSupportforStrings.md
@@ -1,5 +1,5 @@
 
-# DTrace String Processing {#dt_strings_dlang}
+# DTrace String Processing
 
 DTrace provides facilities for tracing and manipulating strings. This section describes the complete set of D language features for declaring and manipulating strings. Unlike ANSI C, strings in D have their own built-in type and operator support to enable you to easily and unambiguously use them in tracing programs.
 
diff --git a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
index da4b69333..035f5ed15 100644
--- a/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
+++ b/doc/userguide/reference/dtrace-ref-PointersandScalarArrays.md
@@ -1,5 +1,5 @@
 
-# Pointers {#dt_ptrarr_dlang}
+# Pointers
 
 Pointers are memory addresses of data objects and reference memory used by the OS, by the user program, or by the D script. Pointers in D are data objects that store an integer virtual address value and associate it with a D type that describes the format of the data stored at the corresponding memory location.
 
diff --git a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
index 7548bad83..ca3d74ffc 100644
--- a/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
+++ b/doc/userguide/reference/dtrace-ref-StaticallyDefinedTracingofUserApplications.md
@@ -1,5 +1,5 @@
 
-# USDT Provider {#dt_ref_usdt_prov}
+# USDT Provider
 
 Use the USDT provider, for user space statically defined tracing, to instrument user space code with probes that are meaningful for an application.
 
diff --git a/doc/userguide/reference/dtrace-ref-StructsandUnions.md b/doc/userguide/reference/dtrace-ref-StructsandUnions.md
index aa4f092df..79115e362 100644
--- a/doc/userguide/reference/dtrace-ref-StructsandUnions.md
+++ b/doc/userguide/reference/dtrace-ref-StructsandUnions.md
@@ -1,5 +1,5 @@
 
-# Structs and Unions {#dt_structunion_dlang}
+# Structs and Unions
 
 Collections of related variables can be grouped together into composite data objects called *structs* and *unions*. You define these objects in D by creating new type definitions for them. You can use any new types for any D variables, including associative array values. This section explores the syntax and semantics for creating and manipulating these composite types and the D operators that interact with them.
 
diff --git a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
index 1a1549445..013989706 100644
--- a/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
+++ b/doc/userguide/reference/dtrace-ref-TypesOperatorsandExpressions.md
@@ -1,5 +1,5 @@
 
-# Types, Operators, and Expressions {#dt_types_dlang}
+# Types, Operators, and Expressions
 
 D provides the ability to access and manipulate various data objects: variables and data structures can be created and changed, data objects that are defined in the OS kernel and user processes can be accessed, and integer, floating-point, and string constants can be declared. D provides a superset of the ANSI C operators that are used to manipulate objects and create complex expressions. This section describes the detailed set of rules for types, operators, and expressions.
 
diff --git a/doc/userguide/reference/dtrace-ref-Variables.md b/doc/userguide/reference/dtrace-ref-Variables.md
index bc10071ca..c4d7c4014 100644
--- a/doc/userguide/reference/dtrace-ref-Variables.md
+++ b/doc/userguide/reference/dtrace-ref-Variables.md
@@ -1,5 +1,5 @@
 
-# Variables {#dt_vars_dlang}
+# Variables
 
 D provides several variable types: scalar variables, associative arrays, scalar arrays, and multidimensional scalar arrays. Variables can be created by declaring them explicitly, but are most often created implicitly on first use. Variables can be restricted to clause or thread scope to avoid name conflicts and to control the lifetime of a variable explicitly.
 
diff --git a/doc/userguide/reference/dtrace-ref-speculation.md b/doc/userguide/reference/dtrace-ref-speculation.md
index 181d45db3..88ef12db3 100644
--- a/doc/userguide/reference/dtrace-ref-speculation.md
+++ b/doc/userguide/reference/dtrace-ref-speculation.md
@@ -1,5 +1,5 @@
 
-# Speculation {#dt_ref_speculation}
+# Speculation
 
 DTrace includes a speculative tracing facility that can be used to tentatively trace data at one or more probe locations. You can then decide to commit the data to the principal buffer at another probe location. You can use speculation to trace data that only contains the output that's of interest; no extra processing is required and the DTrace overhead is minimized.
 
diff --git a/doc/userguide/reference/dtrace_builtin_variable_reference.md b/doc/userguide/reference/dtrace_builtin_variable_reference.md
index 37beb34c2..3ecc55440 100644
--- a/doc/userguide/reference/dtrace_builtin_variable_reference.md
+++ b/doc/userguide/reference/dtrace_builtin_variable_reference.md
@@ -1,5 +1,5 @@
 
-# DTrace Built-in Variable Reference {#dt_ref_builtin_vars}
+# DTrace Built-in Variable Reference
 
 DTrace includes a set of built-in scalar variables that can be used in D programs or scripts.
 
diff --git a/doc/userguide/reference/dtrace_command_desc.md b/doc/userguide/reference/dtrace_command_desc.md
index eeb45509c..a523fa6f1 100644
--- a/doc/userguide/reference/dtrace_command_desc.md
+++ b/doc/userguide/reference/dtrace_command_desc.md
@@ -1,5 +1,5 @@
 
-# About the dtrace Command {#dtrace_command_desc}
+# About the dtrace Command
 
 The `dtrace` command provides a generic interface to all the essential services that are provided by the DTrace facility.
 
diff --git a/doc/userguide/reference/dtrace_command_exit_status.md b/doc/userguide/reference/dtrace_command_exit_status.md
index 97aaa7100..edec072de 100644
--- a/doc/userguide/reference/dtrace_command_exit_status.md
+++ b/doc/userguide/reference/dtrace_command_exit_status.md
@@ -1,5 +1,5 @@
 
-# dtrace Command Exit Status {#dtrace_command_exit_status}
+# dtrace Command Exit Status
 
 The following exit values are returned by the `dtrace` command:
 
diff --git a/doc/userguide/reference/dtrace_command_operands.md b/doc/userguide/reference/dtrace_command_operands.md
index d5261b225..5b3e39456 100644
--- a/doc/userguide/reference/dtrace_command_operands.md
+++ b/doc/userguide/reference/dtrace_command_operands.md
@@ -1,5 +1,5 @@
 
-# dtrace Command Operands {#dtrace_command_operands}
+# dtrace Command Operands
 
 You can specify zero or more extra arguments on the `dtrace` command line to define a set of macro variables, such as `$1`, `$2`, and so on, to be used in any D programs that are specified with the `-s` option or on the command line.
 
diff --git a/doc/userguide/reference/dtrace_command_options.md b/doc/userguide/reference/dtrace_command_options.md
index 86c41abf1..b04e61258 100644
--- a/doc/userguide/reference/dtrace_command_options.md
+++ b/doc/userguide/reference/dtrace_command_options.md
@@ -1,5 +1,5 @@
 
-# dtrace Command Options {#dtrace_command_options}
+# dtrace Command Options
 
 The `dtrace` command accepts the following options:
 
diff --git a/doc/userguide/reference/dtrace_providers_cpc.md b/doc/userguide/reference/dtrace_providers_cpc.md
index 39b2ca6f5..6c48c1586 100644
--- a/doc/userguide/reference/dtrace_providers_cpc.md
+++ b/doc/userguide/reference/dtrace_providers_cpc.md
@@ -1,5 +1,5 @@
 
-# CPC Provider {#dt_ref_cpc_prov}
+# CPC Provider
 
 The CPU performance counter \(`cpc`\) provider makes available probes that are associated with CPU performance counter events.
 
diff --git a/doc/userguide/reference/dtrace_providers_dtrace.md b/doc/userguide/reference/dtrace_providers_dtrace.md
index ef62c5040..45f30457b 100644
--- a/doc/userguide/reference/dtrace_providers_dtrace.md
+++ b/doc/userguide/reference/dtrace_providers_dtrace.md
@@ -1,5 +1,5 @@
 
-# DTrace Provider {#dt_ref_dt_prov}
+# DTrace Provider
 
 The `dtrace` provider includes several probes that are specific to DTrace itself.
 
diff --git a/doc/userguide/reference/dtrace_providers_fbt.md b/doc/userguide/reference/dtrace_providers_fbt.md
index 885d59230..d4ee4366e 100644
--- a/doc/userguide/reference/dtrace_providers_fbt.md
+++ b/doc/userguide/reference/dtrace_providers_fbt.md
@@ -1,5 +1,5 @@
 
-# FBT Provider {#dt_ref_fbt_prov}
+# FBT Provider
 
 The `fbt` \(Function Boundary Tracing\) provider includes probes that are associated with the entry to and return from most functions in the Linux kernel. Therefore, there could be tens of thousands of `fbt` probes.
 
diff --git a/doc/userguide/reference/dtrace_providers_io.md b/doc/userguide/reference/dtrace_providers_io.md
index a458ab284..105ad477a 100644
--- a/doc/userguide/reference/dtrace_providers_io.md
+++ b/doc/userguide/reference/dtrace_providers_io.md
@@ -1,5 +1,5 @@
 
-# IO Provider {#dt_ref_io_prov}
+# IO Provider
 
 The `io` provider makes available probes that relate to data input and output.
 
diff --git a/doc/userguide/reference/dtrace_providers_lockstat.md b/doc/userguide/reference/dtrace_providers_lockstat.md
index 98affd838..c7259cd49 100644
--- a/doc/userguide/reference/dtrace_providers_lockstat.md
+++ b/doc/userguide/reference/dtrace_providers_lockstat.md
@@ -1,5 +1,5 @@
 
-# Lockstat Provider {#dt_ref_lockstat_prov}
+# Lockstat Provider
 
 The `lockstat` provider provides probes that can be used to study lock usage and contention.
 
diff --git a/doc/userguide/reference/dtrace_providers_pid.md b/doc/userguide/reference/dtrace_providers_pid.md
index c0c7bbb9a..0b11cdcb3 100644
--- a/doc/userguide/reference/dtrace_providers_pid.md
+++ b/doc/userguide/reference/dtrace_providers_pid.md
@@ -1,5 +1,5 @@
 
-# Pid Provider {#dt_ref_pid_prov}
+# Pid Provider
 
 The `pid` provider traces a user process, both function `entry` and `return`, and an arbitrary instruction.
 
diff --git a/doc/userguide/reference/dtrace_providers_proc.md b/doc/userguide/reference/dtrace_providers_proc.md
index 6c1fa8ecf..1858ffcd5 100644
--- a/doc/userguide/reference/dtrace_providers_proc.md
+++ b/doc/userguide/reference/dtrace_providers_proc.md
@@ -1,5 +1,5 @@
 
-# Proc Provider {#dt_ref_proc_prov}
+# Proc Provider
 
 The `proc` provider makes available the probes that pertain to the following activities: process creation and termination, LWP creation and termination, execution of new program images, and signal sending and handling.
 
diff --git a/doc/userguide/reference/dtrace_providers_profile.md b/doc/userguide/reference/dtrace_providers_profile.md
index bcc8c64d2..40e6a4858 100644
--- a/doc/userguide/reference/dtrace_providers_profile.md
+++ b/doc/userguide/reference/dtrace_providers_profile.md
@@ -1,5 +1,5 @@
 
-# Profile Provider {#dt_ref_profile_prov}
+# Profile Provider
 
 The `profile` provider includes probes that are associated with an interrupt that fires at some regular, specified time interval.
 
diff --git a/doc/userguide/reference/dtrace_providers_rawtp.md b/doc/userguide/reference/dtrace_providers_rawtp.md
index d85dd45a8..5246df85f 100644
--- a/doc/userguide/reference/dtrace_providers_rawtp.md
+++ b/doc/userguide/reference/dtrace_providers_rawtp.md
@@ -1,5 +1,5 @@
 
-# Rawtp Provider {#dt_ref_rawtp_prov}
+# Rawtp Provider
 
 The `rawtp` provider gives DTrace users access to the raw tracepoints exposed by the kernel tracing system, including access to the untranslated arguments of the associated tracepoint events.
 
diff --git a/doc/userguide/reference/dtrace_providers_sched.md b/doc/userguide/reference/dtrace_providers_sched.md
index f6d183708..0ac9af526 100644
--- a/doc/userguide/reference/dtrace_providers_sched.md
+++ b/doc/userguide/reference/dtrace_providers_sched.md
@@ -1,5 +1,5 @@
 
-# Sched Provider {#dt_ref_sched_prov}
+# Sched Provider
 
 The `sched` provider makes available probes related to CPU scheduling.
 
diff --git a/doc/userguide/reference/dtrace_providers_sdt.md b/doc/userguide/reference/dtrace_providers_sdt.md
index 442911fc7..bc50ebe3c 100644
--- a/doc/userguide/reference/dtrace_providers_sdt.md
+++ b/doc/userguide/reference/dtrace_providers_sdt.md
@@ -1,5 +1,5 @@
 
-# SDT Provider {#dt_ref_sdt_prov}
+# SDT Provider
 
 The Statically Defined Tracing \(SDT\) provider \(`sdt`\) creates probes at sites that a software programmer has formally designated. Thus, the SDT provider is chiefly of interest only to developers of new providers. Most users access SDT only indirectly by using other providers.
 
diff --git a/doc/userguide/reference/dtrace_providers_syscall.md b/doc/userguide/reference/dtrace_providers_syscall.md
index 880b7de69..7e8637c2a 100644
--- a/doc/userguide/reference/dtrace_providers_syscall.md
+++ b/doc/userguide/reference/dtrace_providers_syscall.md
@@ -1,5 +1,5 @@
 
-# Syscall Provider {#dt_ref_syscall_prov}
+# Syscall Provider
 
 The `syscall` provider makes available a probe at the entry to and return from every system call in the system.
 
diff --git a/doc/userguide/reference/dtrace_runtime_options.md b/doc/userguide/reference/dtrace_runtime_options.md
index 766709af2..c9691c339 100644
--- a/doc/userguide/reference/dtrace_runtime_options.md
+++ b/doc/userguide/reference/dtrace_runtime_options.md
@@ -1,5 +1,5 @@
 
-# DTrace Runtime and Compile-time Options Reference {#dt_runtime_options}
+# DTrace Runtime and Compile-time Options Reference
 
 DTrace uses reasonable default values and flexible default policies for runtime configuration. Tuning mechanisms in the form of DTrace compiler or runtime option can change the default behavior of the `dtrace` utility. You can find more information about the `dtrace` utility and various command line options in the `dtrace(8)` manual page.
 
diff --git a/doc/userguide/reference/dynamic_runtime_options.md b/doc/userguide/reference/dynamic_runtime_options.md
index a42ed3e7b..3ddc244fa 100644
--- a/doc/userguide/reference/dynamic_runtime_options.md
+++ b/doc/userguide/reference/dynamic_runtime_options.md
@@ -1,5 +1,5 @@
 
-# Dynamic Runtime Options {#dt_dynamic_runtime_options}
+# Dynamic Runtime Options
 
 Dynamic runtime options are specific to D programs themselves and are likely to change depending on program functionality and requirements.
 
diff --git a/doc/userguide/reference/setting_dtrace_compiler_and_runtime_options.md b/doc/userguide/reference/setting_dtrace_compiler_and_runtime_options.md
index f978c7825..2fd22c5b8 100644
--- a/doc/userguide/reference/setting_dtrace_compiler_and_runtime_options.md
+++ b/doc/userguide/reference/setting_dtrace_compiler_and_runtime_options.md
@@ -1,5 +1,5 @@
 
-# Setting DTrace Compile-time and Runtime Options {#dt_runtime_option_description}
+# Setting DTrace Compile-time and Runtime Options
 
 You can tune DTrace by setting or enabling a selection of runtime or compiler options. You can set options by either using the `-x` command line switch when running the `dtrace` command, or by specifying `pragma` lines in D programs. If an option takes a value, follow the option name with an equal sign \(`=`\) and the option value.
 
-- 
2.47.3

