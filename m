Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01361537B9
	for <dtrace@lists.linux.dev>; Fri,  4 Oct 2024 11:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728041391; cv=fail; b=CELSOzPFn1kwdwOUv8LUrHFfrg50GWBgA131KNSsJ8ccXkQT4QVVBEcI/QnHx9/ec7nErn6+kvtc0+91qtth7t3vf1wHq5u4dXKNcCTZaaa2q8U1PJhBUqjsRQpaA1XA3HDxEctDdn8GQfXJSFz+6pisfNVbbM1N2kknlqyzbiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728041391; c=relaxed/simple;
	bh=Q+2aeeosCFkRKdnXazzoDhrvxsZVpMYcR9BSm6RmQ+k=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=GwW7u80XdCIldGYbHorSvEbudFyA8UI13OCWHkh9vWityFZli/WdO4a+eVwYJHceZpTY1iyAyexsdqIaYxgjd2/leOe5DwwIm8jTtKtBiUbECDg3DP0XQR9WW8fmbf9xEwk+/6Xybp1UiypaarAELbfGJUW2s+dr6Nn+UpvC0Y4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=WkS06tzT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=I3+vI4b7; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="WkS06tzT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="I3+vI4b7"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4947tuPg016108
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 11:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:to:cc:from:subject:content-type
	:content-transfer-encoding:mime-version; s=corp-2023-11-20; bh=/
	gm/Cm7RrvagtaPK6c8Z4wDIP6Ce2UE/FdF4fV67Dec=; b=WkS06tzTieG00WAst
	FnSwRaTRJaBRp4V8WoNMiAgjA8iTemOJ3cqlUuAPIT9nYAzI5ORpJTPJiDH/m8OV
	M3nZOKixw09zJxWdg2AbO3iNf9kpc1pGtoiiMHNurlyexPDHF/Ixu7Ol+mGX0hpo
	fpfhtslyr0GocMBhibqq99zTbknBgE70yX1BLqvym7af2+Alz/I495px0nTQPVu/
	m+fW4kw4zJ+fJfVVl20SCQhnLczD5qUWX5i5khN/HKkVweGF9SKgw1ATWR69LXu5
	UyfwO4vViZvVKWxdnCnqhW8CUYQ+qh8NYPfW/E5xgcDHuRR5aLl4AM8ugJXJrwaY
	ouDMQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42204b1dsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 11:29:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 494BB4iX037481
	for <dtrace@lists.linux.dev>; Fri, 4 Oct 2024 11:29:41 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2047.outbound.protection.outlook.com [104.47.73.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422054wjxt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 04 Oct 2024 11:29:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ku+7mNKQz7fU6mVmPyCSimJd3Unm7QuawyC9b2lPHfzRvD9lOCePbCrNpzmV3+pUBRqOKPipzHeFkKSCMQaZlNcZ1uJWfy7VOmDcYsuPs5OMo5TpOGE+2zMG+VcMmBjsqycLn+9YeDI15qrIzyBInW4+fGsPwLeKK+fcVHgD5vZ/5cmm0Yb+q7hoq5BwqBY7ij+vuN2+IBTIW5TZ7dplfvj353/7tIWNFSxSkhzk4aSfMbcZG4De0DFNM37HEcWwtpLtR6yf+qtK+KjQ2XWoRK8dVeZooD6IWAyA1PgoLvBsFCStqFQA/9tmD7ppGwD5eombUl8uiBbvsNz+JtOPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gm/Cm7RrvagtaPK6c8Z4wDIP6Ce2UE/FdF4fV67Dec=;
 b=Qyqu7vFfC7ZU5wBHevdgwzOKTdXVI2brwGO+impnhmqN00BwHJByFGL9mXEfB6Ak6EsBKx4w5eghbZLfuE8zet/8KLgnIyoHUt0JY6kzpB7orx35p0eaWXxrYhOr1ZFVUKM6YzLX2cLRDrzVSZIWU8nsxYK8wXD8M9GJ5arK0piIi7/nWLbWz5xSeP0PG0Y62SP5nzO+sY3sS7mcQKQw2RM4DM7mDdqrAjncm9rzf+ZOGRJq29vKiK7RyZfqrsyC02E/O80DipMsxAs8PfuiRtH1SuQLICniEznk+dWk9ijHiGQGFe9041PiAR25q0tOWt94vdWyLQnYVidgG6NaEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/gm/Cm7RrvagtaPK6c8Z4wDIP6Ce2UE/FdF4fV67Dec=;
 b=I3+vI4b7OtYb7T1coCKgUU1FYxEaJS8K07NbS2wAUzrAfxH9u8RFrMYz8Y2pilbEKLEd8639oD1EMFiXxzpVsnMej0ni4dVyQYcH/i0yTwDDv0nZk87mupfl5SEMLLp6QOl3sGQFJfG0f6H/QmZvOpLPO9QlAo0B5u4guKLfAVY=
Received: from BLAPR10MB5267.namprd10.prod.outlook.com (2603:10b6:208:30e::22)
 by SA2PR10MB4716.namprd10.prod.outlook.com (2603:10b6:806:11b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 11:29:39 +0000
Received: from BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f]) by BLAPR10MB5267.namprd10.prod.outlook.com
 ([fe80::682b:c879:9f97:a34f%7]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 11:29:39 +0000
Message-ID: <9253be47-c9cb-4967-a090-cc1cb1f23c91@oracle.com>
Date: Fri, 4 Oct 2024 12:29:35 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: dtrace@lists.linux.dev
Cc: DTrace development list <dtrace-devel@oss.oracle.com>
From: Alan Maguire <alan.maguire@oracle.com>
Subject: sdt provider and access to the trace_event_raw_* struct
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0035.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::19) To BLAPR10MB5267.namprd10.prod.outlook.com
 (2603:10b6:208:30e::22)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5267:EE_|SA2PR10MB4716:EE_
X-MS-Office365-Filtering-Correlation-Id: bd2e6005-6552-4d6c-42ac-08dce467d51f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cDA2TVNvUXhXTFhqTk9zbk9SenJKS2xVTVFkSlY3eFF5cFFKbmUzLy9WZ29T?=
 =?utf-8?B?QTRMeStKbUtmUnk4YkF4MkdtcGdXWUliZWJFUWpxd1lYS3c3aW9wajBjems0?=
 =?utf-8?B?TFd1UGVCR2QvNU04d3VTNE51QTNGRWVhb2F6VmZISFhrRGM3SmR6YXJnaTM2?=
 =?utf-8?B?bHNoOG5QTHRHdWRmc2lLWkFKQWVweHdvUnFScEdMcFVCV1huOTF3eS85b2Q3?=
 =?utf-8?B?V3dqUERvaUw1dFZWVW9Ha04xTTZadjJHcWxSY1JWWnFod0RBQzhDK2E1cGFi?=
 =?utf-8?B?elB4ZkZIakZrNVdERkhqV3E1SHJPemZIc0FDMjlaVzFGOXh2dityM0RUbVBU?=
 =?utf-8?B?VVVrRHRtMWlKRnJMbEpqNnh6RGoxV09ETVR6OFM3U2gyZ3k0Szh1N3J0M0Y5?=
 =?utf-8?B?c3hiRUxjUEN4alZYSGQxeEZnQjM5UlYwbmVUM2lkZ0g2d2R4WXFJenhQMnlZ?=
 =?utf-8?B?M2h0dmowSDJmU29zSW42SmpycVZRekZMWFptSHIrVnJ2ajFPZlQ1MlVGdnlL?=
 =?utf-8?B?elRzNXhiVE5JYnpjZzhXZVhTK2krNzlKaWJ3a3NYb1Q5YXhkejNUNm1Ia212?=
 =?utf-8?B?ekhWOW5QREo2OFdmaElTODRYUmJNVWwvT1JLQ2lFUVJVTzYrYWVkRTF5bGZT?=
 =?utf-8?B?UDQwZmpvSndyaFl6dlpnUVI1SGo4ZU5XSWxyRG5OK1czcDRleVVIZWovM1Np?=
 =?utf-8?B?OWt0Yyt1cTR6TlUweUdCNWdhOGFUZWJkVDNHR0kxMWp5T1NCOWhTYi90ellH?=
 =?utf-8?B?SHBjODFFTDFVZXR0am4rSjg3blZhVm5uZngwRFpFa0ljNEVGUmhLaDZHQzFK?=
 =?utf-8?B?citYVy9zMVpxNkg3RC8vYjdVK09saVo0a0JNakU5cGw3KzVQVGdjamN1bkJI?=
 =?utf-8?B?OEdzekw5NzFZaGFTYnU1Skp2c3RhcHREVk82TEhCNzlmdWpDRmhnRlZ1dVQ2?=
 =?utf-8?B?QjRFOXVuRXJOVDRIeC83Wi9WRTVVV0RJZDMvczgrOEpxcDVmazN5SFdFMzFy?=
 =?utf-8?B?N09tSU8rWmpXOUo3dldhaVM5TzF6SHRIQlJGTDVjNDhxVnJtdEx6U0kvb3RF?=
 =?utf-8?B?VkVKQWVxMHJYK1FPcjREcnFONi85enBmb1cvaGpmd282UHZnaFRidHdpREIx?=
 =?utf-8?B?T2syTU5HUEZ6djVGVGJzYkpFOE54aWVHVWk5SytjVHhZNjdzcXg0Ukd0azRx?=
 =?utf-8?B?U2FQdlZ3RzYvWXFmV1dmRFM2dUI3V3ZOVkZWcVByRXVDRHdiZUU4WlpzSE1v?=
 =?utf-8?B?N2hqRkFlWmsrdERQSmJ0M0U3UkVSN0grUHBSaHlrNXE3bE1GRVdyMXdZYUF5?=
 =?utf-8?B?MmdGV1l4dGNJNTNFTXplMnlpTDBUOGozbFc2Vmx3alBpZG95N0pnNkEvbTRD?=
 =?utf-8?B?cC9ZTzhjWHFZZnBUd0JJcGVmdFI0ZmRNa0gwN0ZLdUJPREhmOW9QekFreEJ6?=
 =?utf-8?B?bitFSmh0a0NybTFBQlhZY01Ic2ZrWU5waFd0a3Nmdll2Q2JDNG5jK3VqcUti?=
 =?utf-8?B?NXZoL1d2OW5RblRMTjRneGhWV29MTUFkNGIrS3B2T1VQTUFLS3dMNmJBTUUr?=
 =?utf-8?B?b3l3M1krSC8rallVMnhHSVB1RVBZVVU0ZXlvcVRNRmxVRVp0dFJTZ0t1alNS?=
 =?utf-8?B?Vk5RR2ttcnlITWk3d3VUaVhuVnIzK0pJZ0R6dzEzajdjMnFFYWJ5dW1uMk1o?=
 =?utf-8?B?UnVOajY2YVlJTFdCakVmYkxmV0VwZXFkRUVBc1N3M05tUXRySlhMMGFnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5267.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TjJJYkJMMUVNT0pCMTZ2ZGVNVkdJZGVHTU1lZjNxeGxDOS9OL1dVTTI2OUJt?=
 =?utf-8?B?ZC9jQjBjSGduRHVpUWxRenN5Z3g5TGZGSG9PTXVqUGlUZVh1TWtDd1VwaE9E?=
 =?utf-8?B?cTFTVnhTcit5K2x4T3BHVzdlNkJEeWFzZFR3Skh3ZEQwN3ZWMHFvSzNRSUsv?=
 =?utf-8?B?M1R4emtZeWlqQ2lXR0pNeXI4aHAreUVDTEEwakFUc1hiMmhyV1dCZ3dsSTZY?=
 =?utf-8?B?YXFFZ28vdFZzd3pTbTVadWlxYmtaWU9GT2o2L1AzQnpoNVhXb3lyc1dnN3M4?=
 =?utf-8?B?WjdPNXBFNE5VNVIwN2pUUC9ZMjNvZmlQZ3dEZ2l1aVhDdUdLYUliajg5bUtS?=
 =?utf-8?B?SmlDY3cyTWorTHRoVE5Wb1VYNTErd3ZiUUN4K2tNamQvd1JSSTBWVDdtZEdS?=
 =?utf-8?B?emlVaUs5Tnl0Zm5GL05FeUFhdjkwUkNscU1mSTVkN2JBQkNyWmxmUUViaWtw?=
 =?utf-8?B?OHgvSkJWRGZlZzNjakVqRm9Ed2tEWXJpeEtZYzJPVk9DbzBRQUtaODl5V1dN?=
 =?utf-8?B?bU9NUjl3ZjdTeFl5MXpYUGpWM3FjMlVGOG0yRTgvS3Zoa1FZc253elJrMGtE?=
 =?utf-8?B?VTNqallkZEsyVUZYc3RwRnRjZEhzT1hrdlJ5OU9hZmpZUkk2R01zNVErcmdm?=
 =?utf-8?B?TGdabXJTakF1N3RtNVRVTHBTM25OU1hmT01YSXhvS2JZUEYzV0NoRmFPbWJ1?=
 =?utf-8?B?YW12Rmg2dHV4d2taa3lPSGt2RWw2NGN0bmVYLzVFRjZSN0Q5RXEwKzVJaVo5?=
 =?utf-8?B?YjZDYWx2dGdYNXZSVVFPNnlNRk5wT1p3cm00bHZGRDcyMHJzRlFvRDRFR3RG?=
 =?utf-8?B?L0FOK3JBd1VHam1HVkgxMDdmM0NuVjN5QkQyVldMTS9KMzczNHBLNUxEZWlm?=
 =?utf-8?B?RGlrVXVJNzZkL3RESmNWTmFmUlJUajdCK3QzVTFDbjVBcjh1SnA2eUtIeVdM?=
 =?utf-8?B?di9lNS9IS0NNZTc2V0QzWE1qQXI2c3FyZ0lJZzdZaXZaYUVsei9lK3BzWDN1?=
 =?utf-8?B?akVqazJCM01oWlRJRW5SSEVrN2dyVWZBT1BxMUE2dzRxNHQxWlNWczdLN3Fl?=
 =?utf-8?B?RUxvQ2k2czZybkZRVmgwb0gyRmNUTWlqUnNsQXRsV2pkVVBweFB4RFl6SENp?=
 =?utf-8?B?TlQxN3ZFbDN2TzROUDhyNFMvR01Ucm1OaEZSY2xOY05YVE9ZbHpoOTFQYVd6?=
 =?utf-8?B?bjhYRm1GL0lTU3U4YlA3VzlNTldaZ0E1czB0WTNPMEpsdm9tN0l1QkhkUXk3?=
 =?utf-8?B?THBxc0R4Ukg1UU9oemdiRS9kQzViNHBMSXlxajF3bm1qTGxnSHYrT3RwMmJl?=
 =?utf-8?B?MnM0YWpwZCtJNXRVdnhOUWlHOGkxZmlGQmdRWlYrMm10YWF5eFMwZTBwaTBv?=
 =?utf-8?B?dkI3K2duUmxyZjRGVUhHbzRhSzcvd29SVEM3djRtc2NKb0ZhVTVtUUZuVlZM?=
 =?utf-8?B?blY2RzNLQXRGWlo2dEppcklENEpWdTNOYmNLSlJTU0hNdGVadWU2cS9LQVhW?=
 =?utf-8?B?K2NVV0p0cHM1TjhQdFZXcXVpemM3NHYzdGptYVVLcjlsZVVwNDZybWRDY2tB?=
 =?utf-8?B?cm56M1JrUDZ0cWg5WGpkb3FZRWx1L3hTTiszZVdlWi9Nak5mOEwzakZvTjNI?=
 =?utf-8?B?bGN1UHZzdjZGZ0JEUjNhY1ovREpRZ3BwZjZGQ2lWN3pQMWhuM0FKcHJuampj?=
 =?utf-8?B?OUVpVzBLcU1tdFJwYUtsejh1Z0RiRFNHdnhrbUY2RGZ4a0R1eXBmalNZTEdj?=
 =?utf-8?B?L1JZeGxKRlFNMjB3VUl0SlB2dTBzOTVvczdrZjhIdTZaOS93eHdPMmNiTWI0?=
 =?utf-8?B?U3NCSHg2MmdTeVFIaG1RUmgrTDdQcDN5U2RwREJLaDdHN1UxQ1hyV2IzRVE3?=
 =?utf-8?B?WVhVa05MQUU1S283bUJEVFA1V2xmZThuODIwelNMMDZlQmNJQVFZWENrVTBr?=
 =?utf-8?B?NWlNLzIvdkUrQ2NlYUt1dE9PQWwxYWtETHF6enVMQVNoakI3S1ZjVXJpWTky?=
 =?utf-8?B?THFwRERET29GMVFtVjA2YU5ONCtnU2ZsTEhYd0dIUSs5TjNjWmh4MUZkSm9r?=
 =?utf-8?B?b29PV2xMYWFIc3lZd1VhQlhrNHlWdmJwYVpYRndvdTdNK2xWckkvVzlvTEVn?=
 =?utf-8?B?UlE0aGhkVFFFRGtYZjgvaDBTNHlSQXhGdW1TVHZIeHVjd3FtUnB1aUExeCtV?=
 =?utf-8?Q?hnYseCFEvqpbxEiO7GijpcQ=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XZCPUKlxZ/f4/hmNhc2zvo7w8ckzcdxymSfBrn52zHh74sC8irfN2EwQDsYFH3lFuh9ZLm+ERmBQYZv30V4on50uLpxvrg27nXhk47OSKH1ajBdVlmAHkkZHX3EgcHIe9A8h06Rh/MHrJyJnutyvz7T/hS9qd6gWMx9HNhAPvR8v5rUuNTacb3a5PLIkeQyVva6yxoqVfiei2w+65yfy33KnvZpxJ5G704tSybcucvKG5M8phIhYULybEX7CEPqnossPHkNPBfwghNtM5egdh3h//0YE9vHYbpZGcbqRsWK1LyptVYgmngw47D9BZLV7T8RiwuQuA3w2D6Azyq66wctNXcZkBnjf22vA0X4cu3IipAG2eCuq6jJqDm8/CrpQgBEOpnFhWzGU/W6+3KVuILDO7z8/LNiTJoQ8uUsyR4mWQNTmVVKzWk2mJ/auN2VFm4xh1V/8bsrPWGbFh1RABLD6fyFQ8xJer8IA8Uwncv8T+h24f+09j9zu7NuNGn3mnNYztOob8XSJpl0LmkYXRMeKSeNQSRZ/Lb7hiB/H6hlvOlDTiFMWqIJZWMhkPaevFvVLI2ViXR33H/6A0YoIXxA1yOYwuEs7pN6iF75XGgg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd2e6005-6552-4d6c-42ac-08dce467d51f
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5267.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 11:29:38.9864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YaTL5OEPFee0ymzYHR4TuJIeDp+Etk767N4eiJ5aMcNl4gxPUugPi3ju5Bhvp0nQLRldULfn/CQbDBk+IZLkHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4716
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-04_08,2024-10-03_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410040084
X-Proofpoint-ORIG-GUID: XvkmA6NSdVOgfg1016XogBQ7jq4tci1m
X-Proofpoint-GUID: XvkmA6NSdVOgfg1016XogBQ7jq4tci1m

hi folks

I've come across a case where I need to trace a kernel tracepoint with a
lot of associated trace info.  It seems that the current approach for
sdt probes looks at the "struct trace_event_raw_<tracepoint_name>"
structure and maps its fields into args[] values, translating each
member into a separate argument.  That works great for tracepoints with
a limited number of fields. However in the case of a tracepoint with a
lot of such fields (i.e. more than the number of args[] supported), it
would be useful to also have a convenient way to access the raw "struct
trace_event_raw_*" data, especially since we have access to it directly
via CTF. It's possible to do this via a hack, e.g. the following works:

#!/usr/sbin/dtrace -s

sdt:sched::sched_switch
{
        s = (struct trace_event_raw_sched_switch *)(arg0-8);
        print(s);
}


...but presumably that only works because the first arg value isn't
scalar. It would be good to have a helper or builtin variable to access
this pointer directly. Maybe there's a better way to do this, or maybe
we could add a helper/builtin to make this pointer accessible? What do
folks think?

Thanks!

Alan
