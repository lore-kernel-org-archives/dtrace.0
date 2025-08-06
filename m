Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3BD1A08BC
	for <dtrace@lists.linux.dev>; Wed,  6 Aug 2025 16:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754496229; cv=fail; b=l8Cv0YAl+iypwviVgEmLD4D0/hQuniGO0C9rAzjUtao+jvbUpW38aB3gioLX9G9bvNlOz2SMwyXAyygax34RcOnFf8oA6x06LctuKiR87AA0ToeBqRIc+OMQ1LkPOGiMiYKlvHVLkUfCXmokeZWS1MDOFfrjGHYcwWjWzribNvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754496229; c=relaxed/simple;
	bh=EzURYCc8/uQ4Jtzu06qyfHzDVbHk+A+r2/yQCFgMc0E=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bFp8H5o5FZRjO5oGQXo2mMMOKuRo2iVZmnJlSHpNS8TWTijilQo49jbQNnKC96UOFXuIKtBhb1MDiX09CTMRFmrWaLfQS7ZHV7qFGMBKQdGJ3AWxIOaBRWw+E08vd0rDVEBvBQwlgkCutLxHvAMFFZiUxvza0t1TZ91P+WO/+s0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QTaDraYv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qDiHb6pR; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QTaDraYv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qDiHb6pR"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576CRSoj011407
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 16:03:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=tK4AdQ2rrQp6E4nno0JpgAU+fd5A1hrrHN1RKTI6j+Y=; b=
	QTaDraYvl8EGciCyfeXqY8GUla3ozVaX/EfWolSZ/wXBJi/OPu/jjepnHvznttr2
	g4O1WmpE5dP5y4iOfCX3XYjU8FFKtF4YYIyP1UtqxuPeV380N/KFkan/hOyoXww6
	JH9Y5NVU2e9l3J7k01dnxmOAN56ROslpb1itTUt6ZuZyf/0qRwPRPsFVaYBRultT
	QRDwrxTU+ebZa40ccK+hP9FRLrb4GP7OTi9qp+BpHDapnsul1VGTozw1wEjPK3jP
	BlVLmYiEIpg6d59ZDke43VCeBmw7AvhSnnuMMvjvuMnZyUdeU4P+uFPHqmVOySy5
	NGUimQpsm1SoevkBWP2TRg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48bpvd24eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 16:03:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 576FTQSU005619
	for <dtrace@lists.linux.dev>; Wed, 6 Aug 2025 16:03:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48bpwx7yt8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 06 Aug 2025 16:03:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+tVsc5WHXMtKLYSIXJQPJhV9kUn4/oFyRqp+aPWuekDwXUMsNo8cmHTAiRTy+GRPQqpY9ea/v5ibxv1P90jF5anjXvqj/HFwRlFgQ97+9hzOFYzOP+oudw7hnsPdWt+NYfI/6z/fRl/3Qg6BzTPiTJ4J6UvTOz/faR5sPmLlUux7+oBIRIoY7AKEX8fwDt1HomvULH8zxpCh0cAVHGaaLvW3Mn5uaXt/X0X1e8ETy8smaGNC/4TExTBkFUI5V6QzUQ2TKdngRYSbVbrIKFq/uJCioc+b+CCXBQcnRsdffJA1oTk5f8mSpVo8tuQ1TeGNAnqqz7voLupiKepcZbevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tK4AdQ2rrQp6E4nno0JpgAU+fd5A1hrrHN1RKTI6j+Y=;
 b=cq05hxeW1ywnn8ijIsS0SO0j4JL+cfAMBi71bzRSurp5nAtpvvHheaNKLLFhUKdBMWhiCIwTNxqRWV6gWwvHOwTPusJh0/YsX9BzSbZIdnUMVylhDXcsYfHhjSJf1oD+TKa1ETacltQode2zoD7SfRK4mKMGDWqSlrFlT1uaK+vO3B0acjoI5MPRHd1OCRuUsrd341RpL2lCwfWV2UiQckVW2Z0El/1nBJHIX3qd+ef2I1vHvnBy/Ani0kcR8QAaZ/n2sIpHNJJVci+e20VugB+0i0Tm4xVhV2exIRZ3Nfj6Wp8bAQKO7+qhFm2dwwNtx1cTKmJAD0DH9/O9GR9Z3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tK4AdQ2rrQp6E4nno0JpgAU+fd5A1hrrHN1RKTI6j+Y=;
 b=qDiHb6pRYNkYQ5VbJyNHYOb6wkOijvvLtqs2ytpwhOiD93dWawjXBsZHors/snTnKAvZWwympwqmKwGZQnft6JyjKcocgOT6FefX0/VIcGWstKDCGWXNjBCDcOEhmCj25UjqdYA+Orpma/mwm97xIqi+vXVaGzZ7nZthMAKM7+g=
Received: from DS0PR10MB6271.namprd10.prod.outlook.com (2603:10b6:8:d1::15) by
 DS0PR10MB6247.namprd10.prod.outlook.com (2603:10b6:8:d1::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.20; Wed, 6 Aug 2025 16:03:41 +0000
Received: from DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c]) by DS0PR10MB6271.namprd10.prod.outlook.com
 ([fe80::940b:88ca:dd2d:6b0c%6]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 16:03:40 +0000
Message-ID: <0f78e96b-2abe-4432-9329-cbbe02344cb8@oracle.com>
Date: Wed, 6 Aug 2025 17:03:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [DTrace-devel] [PATCH] test: install get_remote.sh
To: Nick Alcock <nick.alcock@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <20250806142912.4771-1-nick.alcock@oracle.com>
Content-Language: en-GB
From: Alan Maguire <alan.maguire@oracle.com>
In-Reply-To: <20250806142912.4771-1-nick.alcock@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To DS0PR10MB6271.namprd10.prod.outlook.com
 (2603:10b6:8:d1::15)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6271:EE_|DS0PR10MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: e1cd0b90-4e06-44ae-b712-08ddd502cf9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0N1dVZiazkvcm1JeFJzZUJjL25RZTBBK2VrQUVrWHBjdHhMVEE5MkdCRS9l?=
 =?utf-8?B?THE2dExGQTJDZm9kVUQ2dThBdzhOeGdSWW5uK3JKRVFFcm1MQTZYNXhYZzBk?=
 =?utf-8?B?TFV6Mm9TcVlxbXNrWmhXRFdJV3hRdERiVmVjWmFkeHkxbHgrNGpMcDJxWDRP?=
 =?utf-8?B?cjZ6VVYrY0tXK0o0VC9OZ2FxM0pqWEYxOXJEVDZnRjAvdXAyd0VnQTJnR1pM?=
 =?utf-8?B?NlM5UFB5VjBwR3hpSHUxdDdaN0ZEV0Nra0hQZWFyQmxjcHQ0U1gxaDA1QUJC?=
 =?utf-8?B?VHpCcHl4QWw5dG9MYWtGWlVwaTZlZ01LSm5kc0dham1LTDZHZ01uMDNEeG4x?=
 =?utf-8?B?VzVRVityTHgyOHVscDVrT20zQ0hNc0N2eHZPWGJEWWN2eXF0Snp0OVhiVm1J?=
 =?utf-8?B?KzdCSEhhcGc4MFdYKytVSzNPZ0JadHNsNWJ2OWV2RlZqV2VOemtiTFdCeWZG?=
 =?utf-8?B?VzRzU1o0V0ZuT1hidmU0d29rZ1lCTHp3TVY2eVEyZHc3TFk3bFlSRnMrS29w?=
 =?utf-8?B?dVl6cng0ZEpwQmpXbU9mSGE0VkxDNUdkeEhXZkhZL1NCeldHUE9TZWZGNnFs?=
 =?utf-8?B?ZUg3ejBiSFRtU3FlMWNEYUczZ2VaaVZ3NVRDTFAvV2hnTFVBbFc3LzZKS3BO?=
 =?utf-8?B?VkZ5UXRLMmhQMzJZYVM3QW53WExpRUVQRFp1Y056SFdPTEpESy9XY1lzbmpF?=
 =?utf-8?B?d3VtdTlUc2hTL0o1WGtqVFMzcW04ZjYrNWtyY1M0SVVvTk1hS1JIOFBjUFI3?=
 =?utf-8?B?Q3NtaUhLc0QxNkpVY0ZKWEg5SW1rdHdVQStaN1lEenFlS2s5ZGJ3M0FURHpD?=
 =?utf-8?B?ZDYvd0ZVQld1LzgxVk9kL1hoL1BINVhnV2NDby9qVkVTWHRCWFg5bkdBNlVr?=
 =?utf-8?B?Q3RoZW5Rbkx2Vi82YWVSUlZoTExiM0srN1NhK0p6MDNXbUYrN2U3UXM0QUtH?=
 =?utf-8?B?Y2lwU2Uwa3EzWlZURXFaUTNuVVU0RmJtUmJjR0l6RmQyRmpoN1ROaWxYZUg4?=
 =?utf-8?B?SEdBWWpJVmt4UEJYOEREeVZmb2JJNGVkNzlrcjhTdllZa2lOaDVsREhJN1gw?=
 =?utf-8?B?eTNIMDhXNGpWVzR0cHM1YlBkcnhhNHp4cG54RWxscGcwaE41WkRPM0FzSEov?=
 =?utf-8?B?ZGpPem8xZEh0YXJrL3BRa2JwM2tGamlUODlxRkF2aUxlYkUwQU9LZFZBTlRr?=
 =?utf-8?B?Rm1lV3lLRTVmbEZsZEhuaEJ5YzJDQk9jclQ4dEd5cWpPMjZUR25KcDZDQ1M2?=
 =?utf-8?B?MXVSZU13Z2lYc3NtSkhRcTVBN3RZa2V6WXJOOXByV0tUTnV0M3g1aG5HWXo1?=
 =?utf-8?B?YUczSUJNZVE0N3VnNUxpODJTSmpMTndIZzRaQTRDVEdYVGxNQkFpVDlod0Yz?=
 =?utf-8?B?NnFjSWtnSkZ1M3FDcHVncEhnMFVkOTdwS0hseUoyZzRGVnZ3enA2c2NaUEh2?=
 =?utf-8?B?UGpnT3owdzhwdjgwYlF4ZnBneG0wSDdUT0xDSzYxUVdDc2oxVmxCenBlNVRH?=
 =?utf-8?B?eFBFdHl5ZStDTUxXY0tDYS90UnVDS0hpNzNCa3g5SE9wZHNVZklqaG9ZL2tv?=
 =?utf-8?B?dDk3UmNhakVmUlBtZE83TDFwMDE2TVVQZXZuT1VWRzJLNGJYM1gvN3AzTWc2?=
 =?utf-8?B?bDFiTEZKbFoxelJzc3Y2bUtHVGRtNC9JS3dvT1FwZHY2QXhTeHhqNzZWTnpt?=
 =?utf-8?B?dks2TmI2S0g3MERWU1dWelhxV1BmNXFFaldiQUxoYmdTS0txV1EvQS9DM3NR?=
 =?utf-8?B?b05tazZBWklvUVdXQW5TSENjNENMWDljUlFLVmQ0TDRKaGoyb1YydExaaUMy?=
 =?utf-8?B?SlRGZ1ZkVFVKRjM1aDBHbktSU2hiNFVjVzVOWXR4TG5DUzhMNWVNamJJTW9D?=
 =?utf-8?B?andWMzlHQlZCZDNXSThWSlZRa3F1SHRoOFdWajRiQmlHdXYxbFBHMFNaemxJ?=
 =?utf-8?Q?WWZJxyABnTQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6271.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG8yVTVhQm56UWxhYitSOU1oWWlSRzQ3c2ZQRUE2RTNnYXZoMWs0VDMzWUhy?=
 =?utf-8?B?K1ZJeFFINXl6VkRrNzQxQWYxNEZON1d3U0RRaG5peVZRQjBCQmdFa2k5dnpL?=
 =?utf-8?B?TlQ3eVk3L0oyUXpmMkFZek1iUEpMNjlSTDBITVI2ZFB2bmNIRnEybjBzeFl5?=
 =?utf-8?B?Ujkza0RVNk5kU3FQQkdOcFV2NlhoRjlFME9QZ2tBRDA0THovS0tCTEUzQitO?=
 =?utf-8?B?aUQ1dElPY0t4c3RIWHBBS2g0MkxYeGxaajMvS04yNmxvR21YVytoSE0ya1Iy?=
 =?utf-8?B?U3hqOWpBRTFPN3dTMW1uaDk4elRyY0V4c2VvMTBBRXhVVnVSeGxIOUI4UGVC?=
 =?utf-8?B?azV4WVE4MGF6a2xoU3hpSGRodjE3SWh6R29rZUgwK21wQkVRZXZjWGxONGJS?=
 =?utf-8?B?VnBFeklmVHl3TXFzMTk4cWF4Rzl3NEJvQ1ZWRER0a1FYSFIva2FrRFV4YTF3?=
 =?utf-8?B?ZlZYZzRMQjJ1cllXYTdzc3dwMHhUWC80VkgwZWJuZElxZThGRFZ2em9xM0hI?=
 =?utf-8?B?eXZqQy9pQ1c1dk1sU2hMSTV1RTh4cXF3S09wcFEvUUVYMDFEQ1FUTS9WcEhG?=
 =?utf-8?B?R1R4bzBEOGo5aEErT2puSGlvYVdUR2thckdqb1FqdzVPd3NYdHdYQzNJMHhl?=
 =?utf-8?B?K0NFWWNreFkyZWxXSk5rWmhFb093KytrNEVGVHZubmJzWWIwWERwM09obnJH?=
 =?utf-8?B?YnJCeHRpaXVscXJRU2R2OForSTN3S1U1cU9GRXBhNGhPQ0RCNTZvaGRLaDJk?=
 =?utf-8?B?V2lsVi91NmdIWFQ1THVyMWNzTHhiMmJwNTJhcFB2U3djVDFZU3pPeDM1cTE2?=
 =?utf-8?B?N2UvYnE2djM5c2d6YmhLN2tPNWFERDJ2d3hPSnE5aWhLRE5QUWZzZGJVTGxr?=
 =?utf-8?B?dXB5NDNPVXNHeUY4dTNTUmZtNHBDYlZEVEVwRDdTSnltKzltVklySVYwWVEz?=
 =?utf-8?B?R2paSjlhdEo5RlFxS3VwZXNoZ21JcUNEd3JUck92VjF6aWd2UTY2WWliY1Mr?=
 =?utf-8?B?cFdSSzFnTXBFcitKcEpiNUFEZmR6R2tEaXVxZnMvVlgxeDZBT3Y3aUN6Q2lH?=
 =?utf-8?B?SW5acGdqU1RIT0hDL2tSZWQ5YUdLQmFaK1N3RmJkTXVGSEhrMy82Mkl0VElO?=
 =?utf-8?B?bXNaSFNMamhSSEM0Q2o1bExKbTAwNzFnZzd6RjkyU2huUERudGsyNGdLMEVu?=
 =?utf-8?B?MVl6TkFRNEF1REdvYzlIYXFLcDVFcU5TZjBOUWRlc1hObmZxbm5BclUraDZr?=
 =?utf-8?B?bzRGeVdiWU1DV1FZeWV1blFJRkp3NTIrazdCUWxFNG4xa2ZaaGJWR0twSUxr?=
 =?utf-8?B?eVl5WDNpZUUwYXBKTkhxY3ZHKzAwR0hDYU1YMUEzZ2ZxMDJBbllrUkw5Vks5?=
 =?utf-8?B?bmxKZE1meERvTWVacHRTeFFFNTkrRzNqNWJPWjVLOTgzeFVjQXFKTW1lWmNp?=
 =?utf-8?B?K2NNdHdjYjlraXFnRy8rYzRVY29QTHNTTXlUakt5TktReHpsRFdKMHlZWXNn?=
 =?utf-8?B?VDY1anpxdHFOVlFaS1JYaWNrWDZUbWxDVmlVQ05xa3h3THNUdFJYQXhXOHZU?=
 =?utf-8?B?OUFMOXNsdTJ1SkxpQ2JKL3ZjMTdUL3JlclJ4UVg5MENQejMraWpXdzA3LzVq?=
 =?utf-8?B?eXR5SCs5UmpoLzBaT2Z2dHJSdEgwUW9laXNrSXIzVlpUWDMzVU5aTlY3OS9r?=
 =?utf-8?B?VVI5T1JwNHFMdFpVS09EUEQ0SURJcE5UUlQ4b1NZcFpzYTdZY3JXazJueDlp?=
 =?utf-8?B?VjROaFk5M2Q2a3g3TkVMTWFsbHIySGwxZEZxclJRVFFOUkNqZlRHeWwxQi9Y?=
 =?utf-8?B?NldOV09KR0VqWHdoL1hKeDk2OVhwTWpIQ3lvdmoxdEwvRmNqYzU0VVdKUUJp?=
 =?utf-8?B?TGVuK0pyR2VQTnhrS21aenJlek5TTTZNZytLTzdPSTJOL2RJWmZUZnJ0TCtK?=
 =?utf-8?B?NnNuRkpqa0Y0bUhZRVU5bDY3SVFGc0pEcEZ4cmpqVVdpWUtWdm9oMk5LRTBr?=
 =?utf-8?B?bzJHU2x1dFI1UUhZL1dSWW96U3gzWlZ2UHlERU1adWdFdGpaeHFUUmh0bmtV?=
 =?utf-8?B?ZC8wUWRnby9BTGdwSy9OQkdvSmhrZkNYOHlVMzZxY2VDMUNYMnhOenBsL0kv?=
 =?utf-8?B?cHJ5SHh4ZmJxaVZ0SDAzUFZjMEU3U0JMeHBNRWxvMkJ0MFNQcVY0clBTeWhk?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	heZeKRX5u2h4vssLtKDD0CMfVmeiZxbM7fjO2cXkH+rvuiLwgcZ7kuMWzXx2KLsp0IWYcDhQw9KEFr3y8KuuOsDGxxzbHSEVitL0eRclIVXAdk0vzPVYGHHy4pgkmEjHpkOWeXQwiIjxS9Zfo3+7eXx05RUvahqYBERNgBf+56CAM9ovWKG0u6AnBKy9NdoLmUHWrwMdREt2pGxYsP9LSkykcFFe6+WtJQMEjQG+xACQvXFCvGjIrsox4D4X9OI1uVLR/3LWUNPNryRwPkw8dRKyuIcxy73fyFmvfRxzAdBFO+yHAtf+yu7O07BflzuFZdP+4gkGPswlwV0uPsFQ/grwAjARtyhtriwegOCsrTXxo5MaElzFNX/WtzVT2/y/5NuTX0k4xUJII1v8M87brK+UODBAe0pC+rZcdP56kVACHrgTZ3HMq9oI642JJ4h1jdur/zx8MFm24B7XsfOT70LCfNozmUitthX5Ns++DmneiIWbxkHnMNlBhmtknKivyeP7MVE2M4ygOy8NvZnFzbjueM4pV6/NhkZ47ZZSEEw7P0s9Xnn5j0NrEvaMTIYRR1rylO4Sy4/DTALE36katS7WQSB6nj14DNhNksXFbko=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cd0b90-4e06-44ae-b712-08ddd502cf9e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6271.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 16:03:40.7859
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ZxoEZvtWS/K5zC5rTi+VsSRf3W+W8HVGAV4zgQASMJGS/V8FM06yTXykBop9ktIXC9skD/t4B4qemTPMrgsMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6247
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2507300000 definitions=main-2508060100
X-Authority-Analysis: v=2.4 cv=fYaty1QF c=1 sm=1 tr=0 ts=68937ce2 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=0eeH10lqnmqnvABTdCYA:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12069
X-Proofpoint-ORIG-GUID: zBFu4aUTZzCYgoOH314-r8ozWeThMivl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDEwMSBTYWx0ZWRfX7aU6aJUB4Kl5
 uJRjCrDD+l+tWbbU6fqoJgBf2GnnyRAKEj1KjHlLRlP+F4h1SLg9py0CEfOIRbwvhw+KzZWtgb+
 87ALpeHeWe37TtJPRS1h4XqquBl87JycHa4gl3/A4UmJ/OCgzsG/GQPPgyg+Cruf83PBGsghu9l
 Ti1/61ea7ewxKDmiLP1lEF4NGwhbIOr8JA2+XafJvnC/Hd3afhtltrt4iKZ40QdIG2hMpidWXEv
 /BBeY6/bBmprA9XYPIMgSw+YIb00a7H72eTDWxqY4SY08ejgxwHrdQtMcv4Ad0U0bYEJpXqQJip
 FxcpOysjAGP+1r8QHIFl/Ggk89ZCl+gq6XutslX0O8Tii4n+K0K+jNnG4rD8qPt+1asG2flF9JC
 eyNPwdFQ3Uke/TDrc4zQ9bPS1u2b1u7OCXu3iDF0R3cTrQmqgPPDk+aC6TS3bDE5SiHQiqq7
X-Proofpoint-GUID: zBFu4aUTZzCYgoOH314-r8ozWeThMivl

On 06/08/2025 15:29, Nick Alcock via DTrace-devel wrote:
> Otherwise this produces horrible output for every test run in
> the entire testsuite when the testsuite is installed from an RPM.
> 
> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>

oops, thanks for fixing!

Reviewed-by: Alan Maguire <alan.maguire@oracle.com>

> ---
>  test/utils/Build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/utils/Build b/test/utils/Build
> index 7976272f7ca95..e19a1171cea2f 100644
> --- a/test/utils/Build
> +++ b/test/utils/Build
> @@ -4,7 +4,7 @@
>  # http://oss.oracle.com/licenses/upl.
>  
>  TEST_UTILS = workload_kernel workload_user showUSDT print-stack-layout
> -TEST_SCRIPTS = check_result.sh clean_probes.sh cpc_get_events.sh cpc_temp_skip_bug.sh perf_count_event.sh workload_analyze_loop.sh workload_get_iterations.sh
> +TEST_SCRIPTS = check_result.sh clean_probes.sh cpc_get_events.sh cpc_temp_skip_bug.sh perf_count_event.sh workload_analyze_loop.sh workload_get_iterations.sh get_remote.sh
>  
>  define test-util-template
>  CMDS += $(1)
> 
> base-commit: b420f057c85b0a57bc31e106aa2440b2ada3a4ea
> prerequisite-patch-id: fbbc0320814e7df4d38ae7f8ec26080e10c44433

