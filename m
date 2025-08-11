Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5663311C3E
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 19:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754940655; cv=fail; b=EB6Vu/esrRHDktgcxlrE1PkiwXcBH5nPtxanBz1SnNWPfcRo9Msu87sevcT2cV9ttD1+qPCuhFgcj5/bVOeCr5X29rMWNDWM1xJDAmNqQbU0IGV/KmOpbpjssHNap/PeK2QPC2x8wB18+hNPFd0QxqlXap3NmB9fO8buyBuq3fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754940655; c=relaxed/simple;
	bh=V/DwKs8ikyIw48v1/9TcnRTh9lumuruwhoGnsNJbY7w=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pA47xD/omuQ6cCNTTWgGWKkgyWFoy3AtiUk6z7CWWzrknvLpziKMZ6+7+ClvOoy6FPE63p9RUw2OC4TgBSVfkR/dAtcL6X0MZ0I9N9jKhW3CngtzCyeHHKcPtb0gqW9dsXAAhIegKp4WGiisftF5q2IMds0LqzTIvvlf3pqAmfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=SYOiCucz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fBjyDsbN; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="SYOiCucz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fBjyDsbN"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BJRwts026299
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 19:30:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=pifeVIphS6+n5VD7R85aVDkIb96182QyY9VQaPT6MD4=; b=
	SYOiCuczY2dHpsJI6T59lCpjPta4s5lWynwuBxmN41m6oYQQBLLHb4laDEw13S7G
	UQA0Are4/lztpIf11uAaxsc1zTr4FA9kzkricpXoO5jwCZR1sizypX7vXesCMMRe
	2uU8nJPuNFTsHa4mQ5Aoj4hSi/0r9sc+mpz5KSeuVIHJDbHHhZyJKAwGz27ktBqi
	AB0ka9pB/3FcDx6DJgH7iIFsgEIdKEthTehFCbjfFqwtNI18tkzcHRDxqt4yAYfy
	CeiQ3fSdsNb3oYWppoSDPwBz7XJ4kt0u6R75KpEO4secxH8w9gffXkW/pQlM8nrM
	HpD0owEXqgvO2fhprlgqTA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvrfub55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 19:30:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57BIB30U038543
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 19:30:51 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsfk8tq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 11 Aug 2025 19:30:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaTg8Oh6CJSqpleYbpyrcjbEttV4pd3vQY+1yK5an2DO3LOdiPwuLOFkTEmRloJtzSE0pOWkwEIhxUeqBCIxaakFC2dQJeicu+IO4RHK8Cx9OYGTe+s3xpFNsMGw6Jc7THh6v+025b3m6BHOL92jS+MmCCMolUEG8F2mlWSfMczloj134YwwGT0c3aqg7GeVOF+n/yYcO/erO4G7gPHSKAM/3BOb6VECFO5p8jdV1uIL+BMgcaZZOG4Rqj23aj1xYindl+M+knb0z1jAF/2VOVYdWjV560OeSJ3JcfdiWhFCigtDdRoVN0ISGQZQH/N83pUTV6Q5oDrOkMz3dvx38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pifeVIphS6+n5VD7R85aVDkIb96182QyY9VQaPT6MD4=;
 b=k73FlwA+SAbX79voYaJjqfVkfALp/qXwkyY1HtNEMYHIM8Vfpkv2iDgjKSGzmhiYdAk9UK2W085EYja30lfzzi9A2Qq2rxcBENd7fS6AIuH3QTIxSi5qN1EA3QqJZ1x9Mh/11CzJnsVFCoobRYQE2rEcfA83Na0cRwmlHcjIMkyCxPYikLy7AM+H/xkKoQZ3iFS14NWeEBeqzr2WoXFQUhNcoV9Fnk4512TOu3kx0PrmQhLGqQX1pWeAfXo83kh0tSJ+FWVuWkGqfV72Fwnwxxlhdqdz2on4TjKscKKYlHiSJkOdjOe6kHgSv/Td/kFMHHH3otgCusBNU41x3pZXvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pifeVIphS6+n5VD7R85aVDkIb96182QyY9VQaPT6MD4=;
 b=fBjyDsbN4qBvzeEBJnMotzncx3XuN9l8lN8rX+DA7gFKu7Gh8EZ8iNDETcql3ENUyGkzdIKUBjr+VX2emRmudX3CVqn0nMhEYlw6jwCbt2KgAd9kAe0oI+CjstaxKvN53jFbFZCUlZf0vmTwDlGnA/c08h621VZCFbWgRuD874M=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN6PR10MB8166.namprd10.prod.outlook.com (2603:10b6:208:4fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Mon, 11 Aug
 2025 19:30:49 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9009.021; Mon, 11 Aug 2025
 19:30:49 +0000
Message-ID: <a91e4672-a8a1-635d-b337-2afe0d43e959@oracle.com>
Date: Mon, 11 Aug 2025 15:30:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH v2] Snapshot aggregations just in time
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SJ0PR10MB5672BE5DCC67590D4CF36B15C228A@SJ0PR10MB5672.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SJ0PR10MB5672BE5DCC67590D4CF36B15C228A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN6PR10MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: 853ccadb-b259-4702-131f-08ddd90d93a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clh6WW5Ta2JqKzlWTmxuUXJ5RUwrVWllR2FHN05hMERVellNWHZudlhodWFy?=
 =?utf-8?B?bzhSY0VueVZQZUhVbEp5KzI5UW1jb1hKZHkzK211bzdVbnpGRUtTSWdnVzd5?=
 =?utf-8?B?WjZUQkhTeFBjVnphQ2hOK29tS2RONk56Ykx6ZVJKZnZuSiszam5nd1dVakRY?=
 =?utf-8?B?WFRGdkdmeDc2a3d3b0EzUUZGREkyQmRDbUVtdTlDYmFSa1UwdG0wejhialIz?=
 =?utf-8?B?dVJla0xGZE9ZKzJnc3dwSEdlUHNLVkowL2FPK3lqVnZDbWFWdUZvSzZLZDVS?=
 =?utf-8?B?ZGhQb2VEVFFxSVZ3by82WWVYOFk0L2FxNVpLd3F5NmJxcnRiNTRGMWQwY09s?=
 =?utf-8?B?SmZzbWsyeWxYU083T1R3cWZVaFA5czRTckNHbG5TL0VqMHM5L2UxZG93WXVB?=
 =?utf-8?B?bWRZbjZFeEZEY29zM3FQZnRKUlBPbHNLYTFLSk1KTmdTR2o4Y2tYNzBQZEph?=
 =?utf-8?B?WXo4RW9HMnlSZGJCNmtuZGNzTitnNXJVNHJRaEszanVoSVRVUDBWYm9lcnNH?=
 =?utf-8?B?WEtMNHN3V3Yvejh1TGRucERHOXEyY3lSUWVlNkJiR2Q0bjlvdTRVc3BlL0Nl?=
 =?utf-8?B?QUZpRGVtUHJsK0lGaTZoeTd1aHVFcmxQWnJNejBXcEpJNWcvcUdoeHBURU9W?=
 =?utf-8?B?RTRkeDZmTHdHeDZadkRycThBTncrSlp5M2djeDl6Z1c4djExNjdwZ3JRNDZU?=
 =?utf-8?B?MGN2K2taTmg2WkdPbVhrOThkUzZHRjlyNGYxMTVNeXJkWDNHNExmMHpldSt1?=
 =?utf-8?B?Y0IwYVNZdWU2WWI5SzRkQnBqZXc2Q214OTg3L1l2ZU55NlNSSEY3bFVrbzBK?=
 =?utf-8?B?MjBoeXlYZkVDd3RxMUlLOXVqb1hQNkwySGsrbGs0a0p3QjVScWVoY1JUU0dp?=
 =?utf-8?B?eEp1WEN0dGQ1TCtoR1hFM1ZXdmN0Qzlqam9sQjhZWmVGWjJRWExJTk42dXhP?=
 =?utf-8?B?VVdPQ3puT1lzcHBoYnBMVWY1UG9ReUVHckkwd1BVdUhVbkFXZG1COFZHQmxY?=
 =?utf-8?B?VjJFKzgyZzJLSGNlYllyM3dBMGoydGIzazVWRzlCVFRWTHJHcHdmN2YxL0hL?=
 =?utf-8?B?aFgvaDFuVjF1clpTZGJKZWNLUGN2a1M4cmZMcytuZUlrSTJJYUo0ZktxNnRK?=
 =?utf-8?B?Y0g3UWtJWDhrRXhHRDIzWnNVc041bmVrdkMzZHpuVVhsdDExNnFnUStYYUM1?=
 =?utf-8?B?SDJEWFdNS2lLbzZhODd1YzRpbUVDYmd6NVYrazlpUElhM2hzRXFwbkhON2Zz?=
 =?utf-8?B?MW9UV3lXV3NzdmYrT045R1pLMVB3eE1YRUhaRjgrZVlKdEZvdVNFVVEzaFh4?=
 =?utf-8?B?SmtUdzQ4dUY0QkFPZWM5YU8yWFl4VDBUV1RzRE91Y2xMVDlkNEh2VVdYREVo?=
 =?utf-8?B?V2U1Qmk3TXJxd2Y0WVVRYUdwQTV0eUwwbWVQRXZ5Vll1b3d3eWg3Yk8xaUhZ?=
 =?utf-8?B?SFpYYTA2M09STWVZSFdaUmdVdGVac1JNdmQ1OUVVVEcwT2hwL3FwSGxKbTZ6?=
 =?utf-8?B?d2YwWGlEeklvY3V2dURZZ1IwNU93YllmU0lJVWM1R05EV1hVekVLeUFSUlI4?=
 =?utf-8?B?MGozYUEwaEQ1eGpTeGhjUm14YnR1MlIydklXZkpDamZucHBVa1J3UTVIZVdF?=
 =?utf-8?B?TG4xa1ZUUmszc3AwQTVDN0VJR2VzU2tIeTNYZk15ZWdZcUh5QStBb1ZYUVRN?=
 =?utf-8?B?aE5lYVpERTZpQ2Y5NFFOdFNQeWVDbTFldm1WNnFLTXRPakJsYzdmZHU3R0Na?=
 =?utf-8?B?ckFva3FPRE9BOEx3eldrbUpYNGd2MFpxV3IvYkVXb0RxaFFqajJDYzdFRFhY?=
 =?utf-8?B?ckczVzFYWXRNMkxLNzlXYXZUVnRGTjM1dk9FcVNOVk81MysvemUzNkZISzFy?=
 =?utf-8?B?bGhyUUkxTFo4UGx1V3ZjZFdIRVloak1NSm9uTGN5S00vZ09FMVdST09kMFNw?=
 =?utf-8?Q?sePeyAMG4wk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUsrbC9EWTd5ck9YUmN2aDd1b2tlYmp0aFZQRVVYdlplZGhrM2VLSVpOL3VM?=
 =?utf-8?B?R1pmNHpKSUFHUkxWamxPYU5RZGNqV0FUenNOZTMwSGtpaGo2STNsMzVXbE9B?=
 =?utf-8?B?VFJEcmlJZXE5ZVAwbVNRbVdEQmM5Szhac0JpaFZPL0xnVTVhVitWQzFBTWlt?=
 =?utf-8?B?dWN3MnluQmdBQjluYTFIWUxFUU1JcElRekJjL1dubmczWDNvd3kzS1h5YjZU?=
 =?utf-8?B?L3I5ZS9lK3Bjd0VUTHkwUzZYVGtTcnRaa0pibnlrV0JuckZVT0ZLTGo0WVhV?=
 =?utf-8?B?VTNrR1JLbCtRYUV0bkFQRFpIZUd1OXlKZUs1VWsrLzFWUGp6SXozRmV0eGta?=
 =?utf-8?B?MDBlRU43ODV5R3N1YkNEbDFacFZFWFlsOGZxQUdac3lHZUcwZVg0ZnhnV0Iw?=
 =?utf-8?B?NnA5Q3l5M1ByWm0xUWlWei90RHFTWkdra2JyNUtRWTQvRG40VG9EalMxbzMr?=
 =?utf-8?B?V21wOGV1R01xZVdqZHM1SStyR3VJL0o1R2FJeC9mS1JvalJ4cGsrNjBzL3BY?=
 =?utf-8?B?S3k4Z3ZLdlp0cFZ0RC9lbHlQWThpdjlCa0taNTdoTGJNYkxyY2VPc0swZnNt?=
 =?utf-8?B?a0todU9YNGh4TFBGTlFDbzBMbEtPYkNHS3FSWXFBU2J6M1pmNXpxclpCQVZZ?=
 =?utf-8?B?Y2hNNnJDWEh5cXpzRWtRZ2pyS0ZoalJ6UkhLYm1PeHlNVVc3R2ZRd2Uyd0Y1?=
 =?utf-8?B?dGhXWXloY0dwOENEZ2N5UFNzSjFWUlVUdnVGUmVnUkhRdTRaV2lkTUxVdU1z?=
 =?utf-8?B?T3pDLzgvbGhnMExHaElSNVdBRXZJWjR4Q2RwYTVuL2RGbkFzcXI2ZzRXWXhT?=
 =?utf-8?B?Mnl4L1BvMEIxWDhobmp5ZjFhays1NDNCNHljdjZKZDk3S252ck1KNzc3MEQ0?=
 =?utf-8?B?MHZLL3QyUUpqZzVqMXgvbEUxOVpRd3IrK1NJZzBBVlEvYlptaHBJbFJGbzNQ?=
 =?utf-8?B?ajcwVjFMVDdaeEx5WVMzMy9Vb0lJK0dhV0xkb2ZNMlJid3EwNmh3eTFzZGNw?=
 =?utf-8?B?L1lBQmZGYWRKbFMxQ1ROcTVod1BhcEJGS2RPZ2RzSXpsUVdTWk5iUElmaUtt?=
 =?utf-8?B?aXMzUFVwSS9wMVI1T21KekoxcGRhVUg1OWh5QU1kcDYxSjBGMkxEUEd3c2pT?=
 =?utf-8?B?eWxrL09Uck94elljSU1zWTBqTU1XdnkyeXhjejBiSGVkdndaaUR5a2ErY3E0?=
 =?utf-8?B?VHNlaHBiVGZmRlF4enVBdUF6VWk0akU0KzJYaXNkTTRheUtRVkJQczYySGUr?=
 =?utf-8?B?Y1orRUhpMTRHZWZmWHI5a242VXBha2FScHVqMm5MKzQ1amdPcmh5Y3JYQ3ZE?=
 =?utf-8?B?Qmc4THE3em9nbW5zYUtkdWFJak1ZeTA1dWN1L0d4Z2lTUFdsTW1nU0hkNXBO?=
 =?utf-8?B?cXZPcDM5eDdlZ1JoYytST2JqMGc2a2hNRHV6UmV2dHdGS3RGdHZyVnQ0RTVO?=
 =?utf-8?B?SUNHRW9GQ29PMzRJNVQ1L2N6WmNWZ2pEOTBLaDd3enExRy9rTXBybFkwb3Ns?=
 =?utf-8?B?TGlzSjNlRGtYbE1YbktPelBTWGIxRytYakZMdU9mZlZDaDhWemZpcGhCV25z?=
 =?utf-8?B?dmZJWnRLN08rSXRtYUJ0aVNKVTlFYWFQeEZkbXg2ZGtYSlFDOGtPK0NJZlhl?=
 =?utf-8?B?YTdmc2t5L0VyRGZXWDlXdnBYUlZIM3VWVTNlUFJLa2owOUJZNml6Z3UyYlNL?=
 =?utf-8?B?NmxKandacGVCWlM3UTJWazN5K0NoTzdNY1ZaaDlPd2VTSWdrY0VZK0ZZd3Fh?=
 =?utf-8?B?V2Q4K1RySFVqVlJCMEpwT3Y2L2RDR1hYUlNhZldkb0hSSFJZeHI2Q3k5enFS?=
 =?utf-8?B?WmJhamtUbDlUQUdoYmVkc2ZQVS9aSjRQMTA3SDdHbjVhRU1QcjN5RUdlM0FK?=
 =?utf-8?B?bi9XWllwRmVJUGlDdVA0b2ZYSVZsbmJYemgvQnphRWZ4UHh6K3VMRUIyaGNn?=
 =?utf-8?B?OFhCejJ2Q0NRUm9Zanc4WXFSTTRpN3gwN2RyM2d4WjVMNUUrUjVKbVVrWFFN?=
 =?utf-8?B?QVRTK0hJUlpSZVpQMkJJbzJocExGWW5QMUNna1A2Q2hSNG5vZUtHdjlBUFln?=
 =?utf-8?B?cC9GNWxFYUdNelRQek1BQm5jTU56anBwbzdvYmtsait0M1dGZGRxUmxEOXFq?=
 =?utf-8?Q?h+EpOaBdIp3cALDv80s7mA4RM?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Eqf07RRxzPpQMnymTnRkj5/sUCdja19vJ+MBDpUUGBswFnB/QJc1jU+YNT2VzZIdZEY66t87KCnUa64nVxmOcjrBsfdsR/iB54dMLIJu/Q1dn0l0jZ1Afr7xftlk1c2yLHHcW+1tv25utQRJi7544P8fN37emGk5KOemk1TAvy+hZt2+KFgMUGTNhxhY0y3Kdeczxi91w7xZQ4UIhzdXGmMWOPhdEnbqpCb63oK+toM07dg2RB9qCKGeP8su7SAQ+++HkwTpyi8mvKofkK823Y7x5uuH5OSX1QFC7zX410zDjkRo4Jd1E1a2TkZkMGTx6SVWeU8WUEC+GBmL7a8ispllvwknVSgMbwkkH39ufdAcA8ispD13uz3y9izzXUvibynrqE9XFBdnaG2z3kEN1DAoAndSOT6T5FYLkaKLQPP8qsTbHIQkgZ1P9FzPdSMf4ANsfQe26Oua/5Xc3jmA5H7iL77lkHVhGSdXcZgqwsLAC76M5cUPj9dG2n3P25BTLZczHTvb/kvXuJdiV5oWMQIHS5hvd6dmza6iJ0KUIQ1tja4SEatPCjfBNJQF7Q2thECj6Wer4YPxAEiTOJkuOyauck1hwu1zTDIkOLafKmY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 853ccadb-b259-4702-131f-08ddd90d93a5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 19:30:49.3655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0NdeENwAog4q0UV8cubawz+3akKmHAyESP0ODrE1MDCA/nUjq4G4hEDxIJAbmh63Eq8m7o5ChYowiE7qFpq0/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8166
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508110130
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=689a44ec b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=Knlx3bLYnwdpgMM3BwUA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12070
X-Proofpoint-ORIG-GUID: e1OGOwDVsP1nbHsTWkMHAtjGLCScrt2S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEzMCBTYWx0ZWRfX6zbDvguc2kpK
 Fc/CyuPtwpcVT4LVFVLWDZ+BzfY0i4aFJqYIEcT2Yn6URWMaXnIfVuF/UcJg7REKgw47MuRBUUG
 GkfNI4I3jAWwr6scHcqNicpYfnCA3umhvj4H3En3oNq5ANMGxAwTTMpNHtRsgbOs1ZmHFgK5tLo
 3llKZbOCQ3JsGMMXda+Th0E71lsQcSilQ/hvE72GfwLih0tTjizmTeJDQA+ZjH+5/PU1h51Czb+
 pu2fYjtb5qdafCs6jFlIqq888yvjwe6TrW9B1j48g8RbHjNH3DqO2YEEH1H0C8uXffsDLo6Nip4
 lXSxu5lTa6AwNHCbCqSKTv7HeLBmcj7idXoHbhYqlrQhr5xhhiHtxpvavdiDCZ84nVauTsny3Je
 iGqFzXIY5Ep7xVP3JkxWMEHqlMFzbYnXwrLBako3z1rIhSgdqWGcZxMT+saIX7nw4kc7wh2X
X-Proofpoint-GUID: e1OGOwDVsP1nbHsTWkMHAtjGLCScrt2S

Reviewed-by: Eugene Loh <eugene.loh@oracle.com>

On 8/11/25 12:35, Kris Van Hees via DTrace-devel wrote:
> Author: Eugene Loh <eugene.loh@oracle.com>
>
> Currently, dtrace periodically calls dtrace_work(), which in turn calls
> dtrace_consume(), which among other things calls dtrace_aggregate_snap().
> But aggregations are kept in entirety in the kernel's BPF maps.  There
> is no need to snapshot the aggregations into user space unless we're
> actually going to do something with aggregations.
>
> Snapshot aggregations just in time -- that is, if there is a clear(),
> trunc(), or printa() or if aggregations are to be printed at the end
> of a dtrace session.
>
> Skip the aggrate-slow test.  Just-in-time snapshots mean the semantics
> of aggrate have changed.  A fast aggrate means nothing.  A slow aggrate
> means we are supposed to use stale aggregation data, which would be
> baffling.  A future patch is advised to deprecate aggrate entirely.
>
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
> Changes since v1:
> 	- Changed from using dt_haveagg to using dtat_flags in dt_aggregate
> ---
>   libdtrace/dt_aggregate.c                 | 13 +++++++++++++
>   libdtrace/dt_aggregate.h                 |  1 +
>   libdtrace/dt_consume.c                   |  9 +++++++--
>   libdtrace/dtrace.h                       |  1 +
>   test/unittest/options/tst.aggrate-slow.d |  1 +
>   5 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/libdtrace/dt_aggregate.c b/libdtrace/dt_aggregate.c
> index f9e364435..1fc8294de 100644
> --- a/libdtrace/dt_aggregate.c
> +++ b/libdtrace/dt_aggregate.c
> @@ -73,6 +73,12 @@ dt_aggregate_set_option(dtrace_hdl_t *dtp, uintptr_t opt)
>   	dtp->dt_aggregate->dtat_flags |= opt;
>   }
>   
> +void
> +dt_aggregate_clear_option(dtrace_hdl_t *dtp, uintptr_t opt)
> +{
> +	dtp->dt_aggregate->dtat_flags &= ~opt;
> +}
> +
>   static int
>   dt_aggregate_countcmp(int64_t *lhs, int64_t *rhs)
>   {
> @@ -764,6 +770,10 @@ dtrace_aggregate_snap(dtrace_hdl_t *dtp)
>   			dtp->dt_lastagg = now;
>   	}
>   
> +	if (agp->dtat_flags & DTRACE_A_VALID)
> +		return DTRACE_WORKSTATUS_OKAY;
> +	agp->dtat_flags |= DTRACE_A_VALID;
> +
>   	dtrace_aggregate_clear(dtp);
>   
>   	for (i = 0; i < dtp->dt_conf.num_online_cpus; i++) {
> @@ -1848,6 +1858,9 @@ dtrace_aggregate_print(dtrace_hdl_t *dtp, FILE *fp,
>   {
>   	dtrace_print_aggdata_t pd;
>   
> +	dtp->dt_aggregate->dtat_flags &= ~DTRACE_A_VALID;
> +	dtrace_aggregate_snap(dtp);
> +
>   	if (dtp->dt_maxaggdsize == 0)
>   		return 0;
>   
> diff --git a/libdtrace/dt_aggregate.h b/libdtrace/dt_aggregate.h
> index 0dc126e9e..af2b7f9cc 100644
> --- a/libdtrace/dt_aggregate.h
> +++ b/libdtrace/dt_aggregate.h
> @@ -46,6 +46,7 @@ typedef enum dt_aggfid {
>   
>   extern int dt_aggregate_init(dtrace_hdl_t *);
>   extern void dt_aggregate_set_option(dtrace_hdl_t *, uintptr_t);
> +extern void dt_aggregate_clear_option(dtrace_hdl_t *, uintptr_t);
>   extern int dt_aggregate_go(dtrace_hdl_t *);
>   extern int dt_aggregate_clear_one(const dtrace_aggdata_t *, void *);
>   extern void dt_aggregate_destroy(dtrace_hdl_t *);
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index b0bf73d10..edfe5bbae 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -2352,11 +2352,15 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>   				i++;
>   				continue;
>   			case DT_ACT_CLEAR:
> +				if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
> +					return DTRACE_WORKSTATUS_ERROR;
>   				if (dt_clear(dtp, data, rec) != 0)
>   					return DTRACE_WORKSTATUS_ERROR;
>   
>   				continue;
>   			case DT_ACT_TRUNC:
> +				if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
> +					return DTRACE_WORKSTATUS_ERROR;
>   				if (i == epd->dtdd_nrecs - 1)
>   					return dt_set_errno(dtp, EDT_BADTRUNC);
>   
> @@ -2518,6 +2522,8 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
>   			func = dtrace_fprintf;
>   			break;
>   		case DTRACEACT_PRINTA:
> +			if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
> +				return DTRACE_WORKSTATUS_ERROR;
>   			if (rec->dtrd_format != NULL)
>   				func = dtrace_fprinta;
>   			else
> @@ -3095,8 +3101,7 @@ dtrace_consume(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pf,
>   		}
>   	}
>   
> -	if (dtrace_aggregate_snap(dtp) == DTRACE_WORKSTATUS_ERROR)
> -		return DTRACE_WORKSTATUS_ERROR;
> +	dt_aggregate_clear_option(dtp, DTRACE_A_VALID);
>   
>   	/*
>   	 * If dtp->dt_beganon is not -1, we did not process the BEGIN probe
> diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
> index c85f3d810..ef8f730ab 100644
> --- a/libdtrace/dtrace.h
> +++ b/libdtrace/dtrace.h
> @@ -365,6 +365,7 @@ extern int dtrace_handle_setopt(dtrace_hdl_t *dtp,
>   #define	DTRACE_A_PERCPU		0x0001
>   #define	DTRACE_A_KEEPDELTA	0x0002
>   #define	DTRACE_A_ANONYMOUS	0x0004
> +#define	DTRACE_A_VALID		0x0008
>   
>   #define	DTRACE_AGGWALK_ERROR		-1	/* error while processing */
>   #define	DTRACE_AGGWALK_NEXT		0	/* proceed to next element */
> diff --git a/test/unittest/options/tst.aggrate-slow.d b/test/unittest/options/tst.aggrate-slow.d
> index e2a0f2cb2..cd91c0a6c 100644
> --- a/test/unittest/options/tst.aggrate-slow.d
> +++ b/test/unittest/options/tst.aggrate-slow.d
> @@ -9,6 +9,7 @@
>    * When the aggrate is slower than the switchrate and the pace of printa()
>    * actions, multiple printa() should all reflect the same stale count.
>    */
> +/* @@skip: aggrate makes no sense */
>   /* @@trigger: periodic_output */
>   /* @@nosort */
>   
