Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8601C1AA1C1
	for <dtrace@lists.linux.dev>; Fri,  8 Nov 2024 20:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731097314; cv=fail; b=tKaeh5ZXLP0I3aT/kZlBTi0J5bcul5uBHRQS2WGPsCD6xekdp7qrvUgTjd2gowCTEedryyFWq0+GjhZgjcRvFlEK4dDcWd6M9fr37MQ44qCAtg2wzyW7c0FInLVKR5cxMwqLQOWyEIjQmwxsHiIaD06yW1byzxKa7BgX1/39npc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731097314; c=relaxed/simple;
	bh=FB3zieDVZ1n5CeRcgyXMOB2RVGH3ZVtf7NzO4QJo3nY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=QqvnN2bGyBS1MSddAaFVsGx+9hwb1MPdVG1Ee4wI3yW8J2w1TliDPWfIKjjXWIZDZmteNC5G4swhfit12Zs97PNyUrnVkFufl6rAcBwdvTWDZqU2IPPfb6V6Zs/ClxwlwQEJ9G6CM92pmhFzS1EirDBJqGVnt1d90do2CEN0ZXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TPQaVtbL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nzRIvz5D; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TPQaVtbL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nzRIvz5D"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8FtWoT001560
	for <dtrace@lists.linux.dev>; Fri, 8 Nov 2024 20:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=BFHdFPUfzSfQQVnG6pjjo5Jvjhz3k+BuGQPttMNv8/o=; b=
	TPQaVtbLBlEs3wuE8Y11lp9ai0mQ22Eg/hKv/KJ+6zLNQLg3ess4Zy6r2HjgczZY
	RBJGItKwqZKMRBDd5LByu86pNAEN5ahOIy8c5we2tGdCw7AB59Gf5ow73j+hquTk
	VDpZBqcdSoeLftivxLL4SoFgfYtC1LkoX1r//WUT1cTeymorgxgMi516FSFWoZ11
	wyXTBPvVPFLfvXGJa3F7TEDpYaxq6RlBqtUsK01dOzWVMUdcbnZGFZ5T4O1N3lsf
	JroRf3wEPZkQsPxMEMVUcmcRrNi+Z3xkg2pItYWdD19PurqJhky7VQY9PsL4x6mK
	rsxuRMI0EAHOBdzt9ZuQZw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42s6gjjdtt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 08 Nov 2024 20:21:51 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8IqvwY026828
	for <dtrace@lists.linux.dev>; Fri, 8 Nov 2024 20:21:50 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 42nahbkdh3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 08 Nov 2024 20:21:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmh2QTyb+i/PxEUYVtAL8BAcZXrR+UTH56eB3j1fea+woUW//dpmAllMzJ41RVwymVDrvoxXfTDefshRplLeNV1q8Qt0gMsbzwK/yzaCYkdBD8Cguldkq/LPltzFPxhPSWga2YMzzT6u2ROUBfCRS8c+ERFYBjXmXnukkVENWNgGhEkQnRRz5u90m+AzTGeG1ykDlNyOcKrDJZx+q7WcTlBGTOVYU68vPDGAUJ7DUMtzJldy5hiqivhRZbtrM3aabSkKxMaA5NkjE1yizduqLW1AxLppJEjedVEAOJ1ayoFIo34OwNht0fgM9Dry3AeIIdc2WayLeNnKPQ3qM8f9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFHdFPUfzSfQQVnG6pjjo5Jvjhz3k+BuGQPttMNv8/o=;
 b=LxT+UtK404uepWqrvVJIEttWc4gOvTpPsZi0x4UNR8bIluTlch9DIHn3ghNDxrL5jseNucXqa/dD7QJNaItSv8+pzZyEtPu9/FKbgY0GVX8F9v/QR53DywIGvnJYddb+6owdgaHeLnR4JEbOtIFmduEAV6sz0Eq0xY7PAx6xnlkh92kOYAMhG3MhZ6G2mVYALR+WAoBM9iiMnFeFCX7xZFqUAQK/HlsX2YB9ZYIR7rnKyx8sDajawh8fy8c+c8XqaT8W9JVrzWz09iLa8oZybzXwKaj4CqzOt4c7VdPFXyVeCnk5apUD9T3DyniBePBjmEcFEHRtvSOxztKMT5fXMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFHdFPUfzSfQQVnG6pjjo5Jvjhz3k+BuGQPttMNv8/o=;
 b=nzRIvz5DmqbA0DdQbGCaOLme/4TmwL9mjvb3N2KbZevyktagjIb50qBXGTM+uVEgFXkB6i6UGykhNoZF8gXC+wxYDGoAHlMUW1HuUrxX0Zu60ywvNiqeYuC/+ALHgGJzF6/+fQaB9gspSQQ79YwaEIomlLFmegU1vmMQqyq0624=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by CH3PR10MB6857.namprd10.prod.outlook.com (2603:10b6:610:14a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 20:21:44 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 20:21:44 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v7 5/6] usdt: new tests for USDT arg sanity with
 overlapping pid probes
References: <20241106112942.264351-1-nick.alcock@oracle.com>
	<20241106112942.264351-6-nick.alcock@oracle.com>
	<c7e23550-b87c-9750-e17f-20b7b060854c@oracle.com>
	<87r07l7tsx.fsf@esperi.org.uk>
	<7a85ab3c-a335-1248-069c-d5600f2ac427@oracle.com>
Emacs: because editing your files should be a traumatic experience.
Date: Fri, 08 Nov 2024 20:21:37 +0000
In-Reply-To: <7a85ab3c-a335-1248-069c-d5600f2ac427@oracle.com> (Eugene Loh's
	message of "Fri, 8 Nov 2024 13:30:27 -0500")
Message-ID: <87r07l5ve6.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P265CA0430.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::34) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|CH3PR10MB6857:EE_
X-MS-Office365-Filtering-Correlation-Id: b30d1acc-8c1a-4ee0-2f71-08dd0032f6b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|10070799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmQ2TS8ybXFqTGRGUC83bVgra0RPWDdRcVZKNWtxSUx6WVNZZzUvVXdYYm84?=
 =?utf-8?B?aElRekQxdHhHV3RhVWxYalQyb0tqb3hsL0MwY1NGU2pTRVQ4Vi9oTXJ5ZGNo?=
 =?utf-8?B?NjFMaHgwZ3RoczIwT3ZDeTRwSGxwbmN5alQzbjlXNSt3TUtpZXJBbngzazZR?=
 =?utf-8?B?VlBENkdjblFkWno5ZW95Slp3NDNjLytVNmhSdmhHdnJ1Q0RPQkQ2NlBjNDFT?=
 =?utf-8?B?SXZqb0szbTUrTS9ibU5USTc5NEl6elpZZ2RhWUZvd1BGWEt1RHVFZ21NM2RZ?=
 =?utf-8?B?dklteWZzTXZENkZUKzg3RUtyelpSQjNlNTZ6VGtSWnE4OVllamFRL3VITXA3?=
 =?utf-8?B?Y0R6dk1mdjFxTHNSMlRYVEZlUG5mVlBlK2dTYURDRnFxU2NtZXQ2dWU4VW13?=
 =?utf-8?B?TU02Yk1ROUtHQVZqQzh5QXZENkNlVllDa0JEcVpzY01MVS82cDRxRVNtYU00?=
 =?utf-8?B?ZnhlNkhQNUJXNWtxYk5Ob29tbERNY2FSYXRBQU1ZcWJPdWZ3VytGeTl6bHc0?=
 =?utf-8?B?dDJqRXUyaFZZSEdSWUtiK0Faa250WVlONlE1TGl6L3F2RlB0WjVkWGZsYXJB?=
 =?utf-8?B?TGhiWERic3FZMDlvRDVsdktRaG1aekRLOXNoRlZwUFhlRnN0NGtkMkRRTGNt?=
 =?utf-8?B?SEZCaG9tQ1J3cThQS0pxQWFhWHp1Mi8rOEhKSUNuZlF4S3hWZTEyRDVGNUJy?=
 =?utf-8?B?YnpiQVhZOHhUQmxJVWw1T04wdUdJRW5PVUd2ZzdUalppbFhwVC9YTDVBYmVJ?=
 =?utf-8?B?MEpEckd4SEdDbHB0ZmR6bWpXM0ZLYUo5ZzZYYzBxTHNYYWVwWDJwYjhEVlJG?=
 =?utf-8?B?WENORTI5UkRZZE55a3B5WUZzM0hJZ1AwMmY1L1VieklwRU5lRGFFb2hrczdp?=
 =?utf-8?B?S05NSnU0NFVXcEowQW9CRXc3RTRhOHdWL2N5SThQSHcxcHo5UWtKMEM2eFVs?=
 =?utf-8?B?Wm52N29HWk1aTm14K1J6R0NNT2xzemJHblAvdW5yY2FsbkZpZ3dmSktNblM4?=
 =?utf-8?B?SmUzRUk2UGM0RDM5a1dqRTJFSkF6OWhsOG5GNVRNVHhwNFRpS1dvNFhxWjNG?=
 =?utf-8?B?K3c0dk0rNlR1SXFCU25EODljUWFPM2VDL3h5MDBCTVJCVm1SSExhS0NvTUFI?=
 =?utf-8?B?azVhempKOTNSaTJYY1hsa3l5cDhPSkl5K0phWEpSQUQ1Y2hWdnRUSlhaMGsz?=
 =?utf-8?B?R3l1WTVQRDQ4WFplZVF3SmxqYXg5OCtndjJGdjhaS3RwYmhGNlZINTVzRWoz?=
 =?utf-8?B?aVV3RGRKdDR4VE5jYnhDckxwcVRjc0lGaHBCVnRPTFAyQ1lSRDkyRURTTkZT?=
 =?utf-8?B?cklsVWpwQS90SFdBSDIrTzJLZ0FlREdkTFdXbGVJTVpUNnJTeTg0MTk0RldQ?=
 =?utf-8?B?bnoyNkV0Q0lFUkhaRmRWZnVlRFdEQTlrYm0rRTU1clBaa3N3b2ZSTEFqekFK?=
 =?utf-8?B?WklBZ1YwakdJeEphc2RTczRBU2JjaU92cDRSU1NLVUd2Z2VWZGdIbnp4RG9N?=
 =?utf-8?B?NE9FVlFmYXBscXJUMWZ4YUYwb2NZUmlhY0FudGtmV0tpSWZId3JCbHBZWmdP?=
 =?utf-8?B?Q1FoYnc3WFhwVUcvZGN4SWhzd1dXa3JqWWJ4WFpGUzdCNWgwcHg0UW0ySHp3?=
 =?utf-8?B?TU13OFVCTWR2TVhkR2QxRHh2MXFwM3pVc1dMNWhwcnJCb0xralZpWTV2cmI5?=
 =?utf-8?B?aGZQblpNS0xKTEVsa1FYZ0d4WnhiNGhiTTNiY1N2M3U3a2hVNFh3enFqWGhi?=
 =?utf-8?Q?ux4Rl2AFX0HWXQrJ4nZVaMs82BeYE/fEqEy7Yvf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk1zVkZERkRXL3pEZGxtSWFmaWQ0bk41azBxK0Z6ZEZINWZPdGlKcFltUE96?=
 =?utf-8?B?N3pwcnhWOUlPYmh6NklBV09yNXNweVJOMWh4R0Y0aWh0Wi9hVUNKUVBuS0gr?=
 =?utf-8?B?QXROMkdObkdpWTVtUy9TT1Q0dlNlU2tvWjh2N1hxTTl6NG96ZmxreHZUSTg1?=
 =?utf-8?B?WDNDY1dDMndUam9ZVW9IaUxGZlZoN1dDWG1lVitVcHBRbWVEdFd2ZUVqNXM5?=
 =?utf-8?B?cVVDVDRlU2hLNTdmWHRhSjNiSytPUVJXWkN1NkV6TXA0Vm42ZDc4VzU0a2dQ?=
 =?utf-8?B?bkJQZllsZ2lYdERaQ3RKbmhqcENKajdyU29LcnFra2EwdERhSlhpRERMUUt4?=
 =?utf-8?B?K2cwOEJuZUprZWRCR3lZbnpJbkE3Skx1NmNPUHkyWHlDaHpUWTV5WTV0V1hw?=
 =?utf-8?B?RnYxaVJIeG90Z1VaVC9RczNQU2J6TGE0ckNGcTVVS3BkZU5WalBKeW9uZEdH?=
 =?utf-8?B?WmNHTjZpY1U5T2N5RkFoZlBUbWNDT2FZZ1ZHU2NvVGdIM3g0eWtSd1NYQ0Ew?=
 =?utf-8?B?WXlVN1R5QVpvTFkxSDJKclEvck1JTnF6NDdUZVdOVEkrZ1BBZEdZSTlNNWVE?=
 =?utf-8?B?dzBjeWVnWHY4WGo0NGNZVDBuWXNRL01RUVA4U0lFdkhkNG0za3o1b2dWSmhp?=
 =?utf-8?B?SzM3SVJGaHRUZjBMNzJLalF3NW9DZnlPczNRRkRKV1AzYi8vRTFQZlg1d0Ru?=
 =?utf-8?B?K0wzRTJtVnNMQkxtZWVlVXh6U2pOa2tOUXJnNnU0M1ZBSm1zaUF0eENiaENG?=
 =?utf-8?B?bjVpUkVsellNb0VnRGgrdE5tc3RJQlFkUDZHVjNEMnZWeHNNNDhQaHdaQWpZ?=
 =?utf-8?B?NUlPZGdyVnp4dkt1NkRWZ3hTUHNPNzZrdFk5TE41VFRIa3IvdVpSNElZeVdF?=
 =?utf-8?B?T0JiVVY1RHBpL3huUDdTRGR6UGFvQ2tsc1Z4L1ZwMEYrOHJwMGN6OTRjYjFH?=
 =?utf-8?B?M1haZmR4U2lpTjNVY05wWmVXY1hDRy9GbVRKZVB5WFBOa0IweUw1Ymsvd2V4?=
 =?utf-8?B?WGk0N1JhNTlNRzh2alVqVGRXM0JiUjJnMmwzZGsvZlI1eGRoOUd5ZTBZL0M1?=
 =?utf-8?B?ZHYvRjNFajA1T3lXSEQrTGFydkN5L3E5TWx3cjVqOUNlMTBnbGNNNHdvcnJM?=
 =?utf-8?B?eEdWdFNZSllUNEJjRDkzbmluRFl0QjVRNU9odGZwVGRVVnhNTVVxUjFOUFg4?=
 =?utf-8?B?V2dnUEk5Y21EZm9uYXRHeWtYZWZYN2dWRCtDL3J6anFnNXBXS3krc1dqNEpM?=
 =?utf-8?B?ejE5SDEyUVN0MXF1VzFFK3NnUmNLRjdXSTY3M3oyM0QrZFd1elp2a0xZWnNk?=
 =?utf-8?B?dG9DbUVnVjRSR0VOQnhsbkVldXA1bjdldVpPRU9TdUxqQ0dGMlliaHhoeHVG?=
 =?utf-8?B?YUFVbmFYNDJQdXFVNmlYL21OMUY5L2pjbkt2cjB2a0V1VkdpMjlnVHhkaHZB?=
 =?utf-8?B?bUtRcWZVNFB1eXN1c1c3U0ZYUFEzVlYreHlVc3B4L0lkOVNFSHNnNVVocWM5?=
 =?utf-8?B?WHVpQ2NtaGZPc2pmOWRUUk5jeXZPQVBxWHQ1WXZyOWtGLzBib0hKR3hiSFc5?=
 =?utf-8?B?dXRmbmZRbGNHR1E2MlI3YWJpZEg1d2lQQ2FuYXdVemYrcFZlZWJFanNiUnJG?=
 =?utf-8?B?V0lxRlhGVjVaaVY2Z1M1RVZWdVVnek1QaEg5aVRrbmJZNTgwNkxnVWtNNnMv?=
 =?utf-8?B?SU5YQmowTVNyaXBaS2N4aEx5cmtleXRvQTJjeEgydGdqNWVubFhaS3gxWEtx?=
 =?utf-8?B?N0hFbXcrcXpHZWczemxDTlVuakNGSHpYS053Ynlva0ZjTUsrYmV1NGZZSFBF?=
 =?utf-8?B?WHRPeDdiTTRtUk52OG9SSjkxUklpNVlKV1RBemQ3SlV2V2JodGpiTmVLOUh2?=
 =?utf-8?B?Z0VqSCtTNGFrQjhSVHdzSnVKeDhlbC9lUjdUZ3k5Sk9kRTQ1VDhtNzJxWk45?=
 =?utf-8?B?RU50N1RWRk5RR2R0ZC9Ccm1QQlZvcGhBSnlFa1VFOEgrTnpFSW14Ry9yVXoz?=
 =?utf-8?B?YXVRMjRPOEN3ZnF3ZHQ3ak13K2VvTldoNEFhY0QyNXlXVW5oNXozSDVzOVJn?=
 =?utf-8?B?NXhoWStxRkJaZ3VMcDFYVnhrcE56QXhlcXNZZFZidDUzT3crWlk3NjgrcmlT?=
 =?utf-8?B?eWQ0WVJMQllON2orOXpSanh4emd6ZThxSWdYMUxNZ1VxSDJLMmhJY0hPRnJy?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GTpYyNCRA+4UjzxrU5pV2lws69MSBpfjLbAt6qWneMMFcuuCfgI5TzU1VfNl4s/24mSyPabgXZ3p/S26wCMnwynnvQJzT6INTC+XapT0bPhQaXMXOr1DHdW6MCgC2miDn4G6CquEVqBhEWQz0y9dBbqRSwOjOcUsaoqQiJUiKNm76oSwyVsgUKTJGe0TCxPlI2yZx33DFSJtuy2/tVS9uS/+CmOlUUOmzMwD6oPHNwEsWELQU9CZ5aHFTWWaCjIhVZHe8pOrjtgacvqwKnQDstyQjn8okpRABLv4XW8gAyFkBiWJqZCtaytu3HbNYh2HIJR4RHq31cH3M200S5Eh3fEfqGs5iNaVAKOVi6my3YxEhH/MmHpEWSVnthJcse8mthSBARgY+bEQbTHzWhNZLt6dVEUKi4DcP7tOV0C/Z581VO6zLC1+fHhhxz/q33gxv8qeoIpf4bYNuQs7/2DjRvLeV447iBjw2uBv7yvAXS1Bm4EDDP1SJe8Gd/U6GsIbLgyAswWXH0CsO13iHucvDgR9N26RgC2eu+FDr/9a7jKwtYXDZOK9MaE9o0/daanBnh34Vj5Obk9HDHtkuX0msBP2HgpW2A82/0w8l4hNFss=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b30d1acc-8c1a-4ee0-2f71-08dd0032f6b3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 20:21:44.6013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTmgKocsKxR4CYSU00fD9BXcreo3JHu9vgrszXOtGpqbpziGp+FFyhHszm0E+eOqpFpq5jGzYv3Yb69rPhmDhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6857
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-08_17,2024-11-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2411080167
X-Proofpoint-GUID: VVI4FmeIqa3kNidqrDrO9b6jD4Cr-B4q
X-Proofpoint-ORIG-GUID: VVI4FmeIqa3kNidqrDrO9b6jD4Cr-B4q

On 8 Nov 2024, Eugene Loh outgrape:

> On 11/8/24 08:13, Nick Alcock wrote:
>
>> On 7 Nov 2024, Eugene Loh uttered the following:
>>
>>> On 11/6/24 06:29, Nick Alcock wrote:
>>>> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
>>>> ---
>>>>    .../usdt/{tst.pidprobes.sh =3D> pidprobes.sh}   | 56 ++++++++++++++=
+----
>>> Why the renaming?=C2=A0 And, will "./runtest.sh" run pidprobes.sh witho=
ut any command-line args?
>> Nope! It's a library now, called by tst.pid*sh, including, uh, the new
>> tst.pidprobes.sh I meant to keep around and call it. Oops!
>
> "Nope"?=C2=A0 It seems to me that runtest.sh does indeed call pidprobes.s=
h
> without any command-line args.=C2=A0 It looks in test/unittest/usdt and
> sees a .sh file and runs it.=C2=A0 The fact that the .sh does not start
> with "tst." is irrelevant.=C2=A0 Indeed, we have lots of tests that do no=
t
> start with "tst." (nor "err." nor "drp." etc.).=C2=A0 So if pidprobes.sh =
is
> not supposed to be run by runtest.sh directly, it has to be hidden
> better than simply by stripping tst. from its name.

What? That's not what's supposed to happen!

... oh, wait, I'm wrong, I'm thinking of tst.* versus err.*, but of
course non-tst stuff runs anyway.

I guess library things have to have non-.sh extensions?

> Incidentally, there is an orphaned tst.pidprobes.r file.

Yeah, that's the bug :) there's suppoed to be a tst.pidprobes.sh -- and
now (as of my most recent push, and mail here) there is again.

It was not my intention to disappear your test! :)

>>>> --- a/test/unittest/usdt/tst.pidprobes.sh
>>>> +++ b/test/unittest/usdt/pidprobes.sh
>>>> @@ -5,9 +5,12 @@
>>>>    # Licensed under the Universal Permissive License v 1.0 as shown at
>>>>    # http://oss.oracle.com/licenses/upl.
>>>>    #
>>>> -# This test verifies that USDT and pid probes can share underlying pr=
obes.
>>>> +# This test verifies various properties of USDT and pid probes sharin=
g
>>>> +# underlying probes.
>>>>      dtrace=3D$1
>>>> +usdt=3D$2
>>> Why is there a usdt=3D$2?=C2=A0 It seems that usdt is always "t" and yo=
u'd expect that in test/unittest/usdt.
>> Oh crap. Sorry sorry this is a bug -- I lost the tst.pidprobes.sh I
>> meant to add back. Will fix and repush this patch.
>
> The patch has perhaps already landed.=C2=A0 So, a delta patch might be ne=
eded.

Sigh.

>> -- which reads, in entirety
>>
>> exec $(dirname $_test)/pidprobes.sh $1 "" ""
>
> Or, just let runtest.sh call it directly, as it does anyhow.

In which case I could rename it back to tst.pidprobes.sh and have other
things call that (and have it default to the behaviour it had before if
called with no args)... does that sound better?

--=20
NULL && (void)
