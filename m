Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E245A2E9EB9
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753191427; cv=fail; b=s/cwM19yfRAcnyQQByj/kHfeQdOxyQV/WHk6kap8ha21iGvWe35JqaWiFXcycSVnFth59i5fsatJFKWLwtm48TICluCgmjFL9cwdTkfQ2ykaxhbI0druFAaiRjcEHtcUBsJLrJ+quKkhBo8KjOBSeGZrgtCYBC38kR5e9wrxB8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753191427; c=relaxed/simple;
	bh=7KMn9ghTh30RhIjwMOaJG0QskDzPSPcFEXsXbPzOfvQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=bw4mNF+C9Bs3CGvrxdhZmg3mGREDLu2Jmeor/McTF8rml01RyIN8gmSkMLXV9A1cpkmuIR0VQAAXUXuKGvW/d0Xjipxg+vM/Zmrq4wAYmW2C+WfnvQM6qumZE1QNbD0W9ktYLdpulppnYRCafaTZQ1KTpR6w3dFi6uTimmVdjJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L+dkgSfO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PBUEJaJJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L+dkgSfO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PBUEJaJJ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M5TAX6002490
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=X0b2NUBOy+7z0cDz3Lw5IRMMR0zMqoeWtRQNxAh+z+0=; b=
	L+dkgSfO/erb/jEXa34Tc6/7E8GzA4K5zy2ijVEQlVggqpU4ViQCTVPx5QWIK3Vv
	oRWh36Ote872iygeRfQXpfbdhJEOyoRi3XUCR+SbNS4VBRSPD/UOPCrW2O99bNN1
	z94xOuilX9cIRRiElxXONYD3ZewtngrO3kSDrkXcBuokPxAOUYYkg6/+ejoBK+7P
	RHtO2e2s7t8PGT8gttwDT+AR/5IHaBUBqT8wJbdPC+LslKPV2W/YDzOEAmMAbDWZ
	Ju3lQtSIs4IZb6EcuS6ApYXnk9Qlumv4KM1b38Ju+WDLaWrYWgqqu46Neu2TRI/d
	fk8rcnt6n4K4P3qGCp1aQA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4805hpd8qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:37:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56MDJnP0037670
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:37:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4801t9bj7f-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 22 Jul 2025 13:37:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7e9LCVhyku3sIQZE0SNi+hjEyiukCAi03zLeyIDRBhXSMkg8w5vBySYzb4OrWZHf9uZaNUuZMrbC/hEn466ofc4F3/zsfGGHkEddXu68MFEtWDb4iCTieELtZbPRh66BdwvGdlDr2VLLg/J34RGkwLP4DB04kNJOWyAj4y1Xd01n408oEtBXDHZF2NDvkXVArr84ptl8p5D4AZlaKSTLf9LeO8T7Ix1u7t3ZaCAYkpEbPZXAXC6lYca3MnPTDMZPbilI3gH95uz73Qn8XDEvCYhJ/ymCNp2XlB2f/U1iz9FA4MHR+VIjYaoyF9lps8RCoBTzwQ5nydZlwok9PeHJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0b2NUBOy+7z0cDz3Lw5IRMMR0zMqoeWtRQNxAh+z+0=;
 b=WM12Nmer6DXKKqG8Uy9Pbbf4HKG/hwADSOFCUd0l/7Mn4L05opuQdvWQ7dsMDEZC2j1oppzqAjNuHNjLBPXv3CPTle6HfBIzzdqq2q/KfdvdG5x+/Yd2nU+CtDOi7iw7yePWICLPQl2SN7bh7kSLJPn9vxhWuOJb/++9Fr266wSXaY1FARwXGg/PN+vwH86LD7uK/XmULyAP0d8afgxiXO7Jvb1nJBe5oD5UUCQh5efRFWUwwtGUhsXjIXQSs907adkDyYTuEKDQiIAWdm6v7zQJjOZOJTnTsfdmhu+C6olfwwNNOF5eGyZrU9sCG39zTA6gBLgViRHQJdF7y+inog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0b2NUBOy+7z0cDz3Lw5IRMMR0zMqoeWtRQNxAh+z+0=;
 b=PBUEJaJJFwEHElhKqrbABtA/Z/Vq2xbPSQOewdM7DL1MhM7e4AxAwBsG8g/rZ0M4XZUUlhmwS1cMZKDTSD1T7aDBycLkT47h0WAnTwY/yFWfgZ5T7PBtCjoUx7z6zAIgbSORPE9blhQw4nbMV5F5Dztp1dsuZrmHeWVO4ZGpRn4=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by BY5PR10MB4130.namprd10.prod.outlook.com (2603:10b6:a03:201::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 13:36:59 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 22 Jul 2025
 13:36:59 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Nick Alcock <nick.alcock@oracle.com>, <dtrace@lists.linux.dev>,
        <dtrace-devel@oss.oracle.com>
Subject: Re: [PATCH] Need -w for destructive actions, even if clause is not
 used
References: <20250711044024.1587-1-eugene.loh@oracle.com>
	<87y0spsosn.fsf@esperi.org.uk>
	<f7a6a3e5-0c05-0b9c-d46b-1982b67e16fd@oracle.com>
Emacs: resistance is futile; you will be assimilated and byte-compiled.
Date: Tue, 22 Jul 2025 14:36:56 +0100
In-Reply-To: <f7a6a3e5-0c05-0b9c-d46b-1982b67e16fd@oracle.com> (Eugene Loh's
	message of "Thu, 17 Jul 2025 12:37:20 -0400")
Message-ID: <87bjpc5ouf.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P265CA0195.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::15) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|BY5PR10MB4130:EE_
X-MS-Office365-Filtering-Correlation-Id: 55457ae2-212c-416f-1a13-08ddc924d56e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUY0RklBOU0vYjhRMkdDaHBhaEVVd3BZOVlWZzRoeUlOTzBVL3p0MkRRemZ3?=
 =?utf-8?B?aHgrVGFVempSeGQxSVpWdzRSUDBrN081Q2VxSWowRU15MTNHRnV1ZTh5VWcr?=
 =?utf-8?B?bjRVZ0xLQWtJcUdaTlUxMkwxZ2hDbzZxQ0xWOEtXU3QyNEovbFZoVWlaTThq?=
 =?utf-8?B?U25RUjhNQjdQQURFcXRHWStFbGFGMVF4LzlRUnl3VlJNNXVTcWtqT1YwcXIx?=
 =?utf-8?B?T1U3L3k2akNMUTByYjZxTFdpaWZ4clluZDB2azI2MVJIU01LcVVRVXFiMW9U?=
 =?utf-8?B?WndCNkZkSlIvZDQxRGRDbVdZMlZ2bW9ZTHdtcmF1ZmtWNWRjeElKdU5zb1Jz?=
 =?utf-8?B?bW00cjRCRnpZSHZpWVBYK2JMajNzMmxoNy94U2kwdFN5cEF0aHdnVE9hK0Jz?=
 =?utf-8?B?Ri9yL3Bibmg2bDYwWVJpQVV3V3pvdVl0dCsrQnJHSEhiTC9UaHlyTEkyTnV4?=
 =?utf-8?B?dmxNNVdTUWRYWHdqNHF0MTJINDdoOE1NaVNjMmRhMHhwSE5tcWZ2WG9CMkhi?=
 =?utf-8?B?ZDdvWDd3bzBUYlk1YS9xYWpGNThPM0paNEF4bkszNU51dEttWDdQMmRiUGYy?=
 =?utf-8?B?bzdPeUdmZVZZNGQyWVduUHNXWVU1RVNEQTVGdE1VaG9iZ2o0RERkYjlJVGlx?=
 =?utf-8?B?RjR5Sy9DU3l4dTNHQlp0VUdhSlVyUWVLdkNjd3dSMm5RSlZnaVVraWY5SzdP?=
 =?utf-8?B?Q3NhaVpFRThmNkE0eTVXeCtZVHVVeEIra0xYU1h5aEVmaG9OYlJIekRaL1N1?=
 =?utf-8?B?dGhDU09EYXQ4S2I3ZHBCSS9oS0IrUzBYU21aZkdDb0ZpVG9ZQ09lZkhOMERW?=
 =?utf-8?B?MkhkRDMvUkthVFRLTHVrVnUyS25iUVZQTEw0NGtSTEFUdzE0ZEN0REw5MTFt?=
 =?utf-8?B?RnFCRWUzUEFSVUZMRXUvczRxZ21vQ0NpRFE2cDhWVk1TWnZNODdkSFVYLzll?=
 =?utf-8?B?dDIrK1NUVTFNeEU1Q0R2SU5vSVllWkpYejNpbytLL3V6b3pERm1sSU0waVVt?=
 =?utf-8?B?ZlVuRHBIbVVFVE95Rk1KMnZtSk9hN1h0QU8vM1ZtdDBuTUxmRVJkdWk5TXNu?=
 =?utf-8?B?dk1wQUNzYXV4WEExWGllWUx1TmN2dWtKSk9sTXB1MWdrU2NDeng0U2kyQkR3?=
 =?utf-8?B?ZnlnM1ZzK0pTQitZSmJJN0w3RmVtSWg4UW1GRUsxd0lPVkFjczFWaG83TVl5?=
 =?utf-8?B?TDZidkw5V2tGYmtuU0JOVG5aRmk0L2IrVFdKRm0zaHZmelJzb2Nmb3ArWmdj?=
 =?utf-8?B?UVcvVkpWZXQrdVdBQ3pUV3ZiVmRGMmZkcVE5MkJiZ2xFZjhiSzV0L3NQYlRi?=
 =?utf-8?B?QUdDSUM2QVA1enBkVWhRN0FHV3VmaStUbWFFNkllZHgxWTZyTlNGVU1tOUN0?=
 =?utf-8?B?OTBEUld4YXZIK3k4ck1sbHhnOXFzYTBtYzlJbGJOZXlkSEV3OFFoZVBrem5G?=
 =?utf-8?B?cGJZMTVCN2Q5ZkpNNDVwZU05bDM4Q29hWTA4RUMwWU9WRTdkbEtRTTJLbEhC?=
 =?utf-8?B?T2I0U0hxM04xY0IyZkRnYWdDZU5Pek5FSXN2dHVLNGVCU3F2bERRRmRmZDIz?=
 =?utf-8?B?Mjh0eFpUOTc2dEZRVjhWSFhaS0JGbURiN3dvUmJGS0l1UW4zTEo4TngyQVpF?=
 =?utf-8?B?dVJGSmp2b2dTc0YxNVdwbTd3andFLzI0WTlQMWlrTTRrMFRPTHE0N1dwV29F?=
 =?utf-8?B?RTMyeFBWQWd6RDNubFppWlZ1ZEZkM2NmWVhLK1lMM1pqMjFiVFNKTFR2bGdM?=
 =?utf-8?B?UDE2OFdUZktKdXN2QXY5TVlUNUxjdFRXei8wMzBqdlg1TUhReWRMMEt2KzNk?=
 =?utf-8?B?WUJvaEZxdGhTUDIyUll5SnNXNEkvWFF5MU1TaGR4a1VVdjlWNEo4bkYxMTVr?=
 =?utf-8?B?WVJsaitmN0dCc2xISzhxWDN3Z0ZhRVVFaUxINzBkcmthQnp4a2w4YnBSZ1Bk?=
 =?utf-8?Q?f+T1xBZyLak=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDlhUENreFdnQzBFbzgyNlFjZkNHU1RHRVRoZmZrT2NLTzJmNlYwN29mMmhq?=
 =?utf-8?B?SHRnZGZCQmVWczN2M0w2UDNnQ3hwQnNPVll6SC9pZUNxbGJCREpFd28xVjRY?=
 =?utf-8?B?VGgrZ3J1NTh3TVNqaUlkdVVSV2h3Sm0rcHJvNENqVUpTME5PY2p2Qk9WTXRJ?=
 =?utf-8?B?YXIxZk5rbXVyMitDeWg4c3djMWRZMm8xLzVnU09aRWhUWWU0Mklzb2pTQTJy?=
 =?utf-8?B?Z1pvVkhYb2V3UDF4YzNBNlN3NHlZcDN0UVA0MDhvZnNhYm9qNU1pVUhGODh2?=
 =?utf-8?B?aXVBUktZQ1h5clRuZUgzZjRXeldaN0o0M2pPOXp1akI1dENkbkg3RXFYRkJU?=
 =?utf-8?B?R2FuZGkwMGJ2MWt2Mk1ZcTNGOWlnYUQ2eE52MGxFbmM3YmxCcVRRa2szTzZw?=
 =?utf-8?B?RTNqcWFjSGVjV21MRE05QU9PcGRWNC84NitUV09LQVoxdlBmT3E5dUlwT2Fx?=
 =?utf-8?B?bHgxbU4rbERYYXFrRm9qR1ZGZzFtOWF6SHV4d3RFL0gvUStNUXIvR0liNGdr?=
 =?utf-8?B?S2VaV3dZQzhBRVA0b2VGMTZLWFlacDZwRXBUbjBCV2I5b0NXYTF4V0JoWGtr?=
 =?utf-8?B?ZkNyNXV2ZmM5SjdwYXQyMTkwd1BWYjBubTBMVTZnaWNwYjBOVWc3MXZHSDY2?=
 =?utf-8?B?ZW5xbTJvSEhkaG41OUdkL3c5OGZCSnlyY1Z6cWtxVnprempwTUdSNi9qdlJY?=
 =?utf-8?B?YUlybGN5eS9JNFV4QXpEOE8yZFJhY0k3T2VTQWgwcE4wYWNSenZsaUM3ZXVw?=
 =?utf-8?B?SGdjQzN5UWphTjFrWitzQWlDMEROUkdodEwwcXFXUGZSWnMyYnQ4dlU1Lzhi?=
 =?utf-8?B?MzVkSkFFdm1yRGpDRkZWU3NwcUhRZ0E0dHBsVlpRczBxSGsrYmJHRVBFZTZQ?=
 =?utf-8?B?b3pxWnNYQzRPZVZIaUp4SXoxa1RKMEc5TWNsZ3VKaWx5MlYxd0hOV1R1akZl?=
 =?utf-8?B?SThaL1NpcjdmbGUvbGJJVm5WTlNNak9TTC84V3Z4WFVkYWRHb3VhR3VqYVlt?=
 =?utf-8?B?c282MTdYWGN3Q2h6WC8xeUJXRTVzWkE0SHVtY3VpZ24razNxS2hvR0h4ajU1?=
 =?utf-8?B?NmpDSzFLcGxpSk5UN04zajJoYjJzRHV5WitGdTBXUkVIMEQ3QXFLZUROalA4?=
 =?utf-8?B?N1lJb01qQWNwSk9rU1JFWmlwd21kVTQ5RDZMd3AvNlZ0RVRxYytwSGgwU1Z2?=
 =?utf-8?B?MnVURXRMclNwV2VrbisySE11SUZWelY5ampRTTRZcVNPWm02cmR2eG1OQWhx?=
 =?utf-8?B?T08yejRzcmlMZjhzd2pxOXlxN2svQU5xWE5YOEtOMXFUMklUWVZiaUU5QzRF?=
 =?utf-8?B?ZGNGVFVNem5GQmJzY1lBUU9sdExhWG1wdHRYMnF0R2xZTnhsVXdKU2pwZVN6?=
 =?utf-8?B?QitsbmN1cC9KOVh0NmpQWTE5bElrT3FiNTgyUDVsQmpiQVdqUStWTjJ4alFV?=
 =?utf-8?B?U3BFbVRjWk55OG5jV0wrVHZUYjRENWp4SUlQQko4MG9HMGVldXhHSmxvaHpD?=
 =?utf-8?B?V1I0YUpYVkVWNEloZ3MxR0xXU212RjZpY3crVXRKMzB5SU8yUDZyYXNQaUt2?=
 =?utf-8?B?ZmYyUUpkekZKQm5HN1ZBcHRLNFh4czdCYmxGNy9Rc2pTcGNrRk9uY3BPejVw?=
 =?utf-8?B?VmxWdllDZldWSWpIc2RuSDIvMTB2ZjZmcUJoWmFybFRmUVhSUmJ6MmdnZmpx?=
 =?utf-8?B?NEd0NjAzS2pUclpmNlhaWURKSlExKzc5VEpiekpmYStCVHZWRWZ2YzhwdlQ0?=
 =?utf-8?B?a3VKTS9tVlB1NGNPT3FTN0R0cnM0anBqMlFla2txclExMXhPREVNaFdNeHJ6?=
 =?utf-8?B?R3RlOGRkTUpUR3B4TVdYYkJPSEdXR0M4UktpOTZhckVLU3F1Sm1adFRjbkJX?=
 =?utf-8?B?SlRQVlRwbzNZZG11RGIzb1Q0N0s4Wk5nMUxab3hLSCtPQk1MT1Qxd1ZZSG1C?=
 =?utf-8?B?SGpjTkZQS1ZOZkJyclBHTjB3VHZreG9jbnZqcnMxZ3FubFhic1FVSVZISkV6?=
 =?utf-8?B?NWQzT0RUcTh4TE5FRG1PUmRDdUluT3FHQUhmekt4SHhONHUyeTUzQ0pDa3Ji?=
 =?utf-8?B?R2d1RE85RGdwT3dpTnZWSmQyY0pYSEJiU2ZyMEZsS1N4NEdWbFZnd1EzcUNt?=
 =?utf-8?B?RzFnTkpYaEdDcjBQWVptMVNiOWFBUWsybWQrU3FNRjQrU3RVSVp1S0IvempC?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oNKvOuawtvQjrmZhgdi3nTmNCsMPfsWS5AtcynMIo51u2/5NNeW9U9ai9BlTvbc6cEVS/0o4bOOyYhg5j/O4ch1BPYonIGg94qf4mGOUqPLcNsY4ApNxpWdHnDIH3jMmCD3bx8t8GKCfX6Y8OifdQjkyuzjmhfVJpPkU3OZSAJR6WTaAzCqzLMATBkzMXMdYhJmMROrOdI1CfLsTIxkVsqyVbkxvVYJAE1ZmlsfrBtCFcReb4YlA5zSl0igxsy0GckYD20iiVYhynMQDY9I5N6kaoF56XUjjcpYnynkVYU2tujJdD33+DspyrJ7LVeh+5iubYrfzanJ5JyRYIjyXdbkUxBDSRlIp5ad1sd9vcxdkobGgJ5mjMxjKeuN7Ecx+Zw4dl+4x6MYDRJtLBN8dK3k+jGgFJhwaNs73TXCMN+U0W2vdwk+mZSOp0Pe9b9b5J2II/x11Vz0G/yIU5sfJOZnA69AG1bSurk9ElerU1dRVO5yU95dmzfqdLPms6lkjSgpQUweOj2jxFT8zcvMG4/xuNtZzjV2tvG8ueRpEqxFoR30C86fOd82DXR+yamE6LolrbIzu275jkkrD7K4mq7XOfmQ2KIXJJqjQvrKuOZs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55457ae2-212c-416f-1a13-08ddc924d56e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 13:36:59.6326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFrZ7yibqrVOKyA3f5K3zTXwEorLNtVNv8jCDAuKMzFplMpRLx6VR4yq6QkMjGd+nId8ENjq0cVcAQi/lL9rjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4130
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507220111
X-Proofpoint-ORIG-GUID: vbydFMeSCydv1p08twUbL6yeBILcFdfY
X-Authority-Analysis: v=2.4 cv=YY+95xRf c=1 sm=1 tr=0 ts=687f9400 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=lb8mcbRyFir6xY-D:21 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=6nhNqvp-GySmuxYUhHUA:9 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12062
X-Proofpoint-GUID: vbydFMeSCydv1p08twUbL6yeBILcFdfY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMSBTYWx0ZWRfX2NwIf8RJUN2j
 uJdtrG8qQoBjC2yr6EUQ/GJY+4taWdfaheDCC2HB2nhZGJLTqC4TG9U7cmQqtncFvICTgoiMwpT
 VmE+YRFQp45nq96pBhvhQaHT/cLMEijfoHjZk7I50w8HG+zwT1UKph/3ga1J9MR7JMvomUghntP
 2suIIr7SeV36ERP3LRfP3wQbZF7ZfTqP0oJZMcUjR1t0+3RhGie+RGmOGsBXxeZyGRnl77leBqI
 VIBOBkVDiuMXgaytYmhar7wkKBIndiZL8zaCU/F+abQapMk5OROPZnnKV+3Z1p9OEowkpwYmyLC
 UsUjesKj1VzUWc5jZGMaujKkm+ZhaCv42+PJyAdi7MkoBLiOuzfltFdJ0mu+FTpF6YubF6mxtE1
 62K0MkXaJJuZeKzp4otUE+8TXiWs3NXOhHESlkkC9bf36SUzxarK811Xg3qPl2izm44K19Yy

On 17 Jul 2025, Eugene Loh outgrape:

> On 7/15/25 06:59, Nick Alcock wrote:
>
>> On 11 Jul 2025, eugene loh uttered the following:
>>> From: Eugene Loh <eugene.loh@oracle.com>
>>>
>>> If a clause includes a destructive action but -w is not used, dtrace
>>> should not start up, even if the clause is ignored (due to -Z).
>>> Solaris treated this as a runtime error.  We should do the same.
>>>
>>> The test err.Z_no-w.sh was misguided and is replaced by a more
>>> direct test.
>>>
>>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
>>
>> modulo one microscopic annoyance (I am not a real unix programmer, I
>> don't like creat() and think we shouldn't add more).
>
> Sorry, I don't know what you're asking for here.

"Name too short" :) referring to:

> > +	int dt_havedest;	/* have any destructive actions */
> >  };
>=20
> A piteous plea: could we call this dt_have_destructive or something? We
> call destructive stuff "destructive", unabbreviated, everywhere else,
> this flag is only checked in *one place* and thus hardly need concision,
> and to me 'dest' always means 'destination' and thus causes a
> double-take every time I see it used for something else.

Anyway...

>>> +		 * This check should never fail since, if any action is
>> Grammar:
>>
>> This check should never fail, since if any action is
>
> I think I see what you're saying:=C2=A0 separate the two phrases with a
> comma.=C2=A0 But there is a big appositional phrase in there ("if any
> action is destructive and -w is not set") and I wanted to set it off
> with the commas.=C2=A0 Maybe I'm wrong.=C2=A0 Dunno.

I tried that -- it feels clumsier, since you definitely cannot set it
off with a comma but *not* set off the clause surrounding it (as you did
above).

>>> +		 * destructive and -w is not set, we should already have
>>> +		 * failed.
>>> +		 */
>> (but worth keeping anyway, I agree.)

--=20
NULL && (void)
