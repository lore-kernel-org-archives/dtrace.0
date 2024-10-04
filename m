Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32A282D66
	for <dtrace@lists.linux.dev>; Fri,  4 Oct 2024 04:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728017373; cv=fail; b=jS7G0L+D+jKIem2Bm9fVkyg6mACFB2/aYtPti4Iv6QD+ADONbXHq5GK5pE1JfFl+AOF94KgS+DekBYi1ZzzLAsDqA9o+NDDDEc+z/IDt9nnKsXqWlg9ad58kwiUUB2fhn8F6W1YaiXkrI6deetAOPd0XiX5EELxRxUaSOMjAjOM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728017373; c=relaxed/simple;
	bh=j5o6tNXSCTcFX2Pf+U2h6Kff15iZ2i1/HvC0ZqL2VD0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=T5mSdXHGaecYMIjOXUDtwgUnO3al1JULbPiN6PBMlJ79JmNEQ8y18j71Jby2rOUmxlP4yrJpOUrnPLUez2kXD9+CeMdD8rnvtALhH6yC7fdLQenScmxg9Nu5NGWQCm4qIRAze3DOMTo/NgvrpRrLD+MNxZQdR/IaGkIyWn566CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=K5qIi4/P; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=XOmeA989; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="K5qIi4/P";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="XOmeA989"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4940tekg007643;
	Fri, 4 Oct 2024 04:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=NcJEukUvjNKIK5VuFiMt1xNREkwkUGfeRW6clqTM08Q=; b=
	K5qIi4/PVjH2PsMEeM2W6ExO6NfFYHEXMMbqH1eJlTE1+b6/peb713+YokWhv8XI
	IndiCfkK5Mxgdo2p5rAtmPcqaEaq82jXUJjSuIrMzMJ7nBrHm95YYA+JGy5JxDYI
	a+wPikPjKAWrms6xM/cYR/ZG1wg75cxoG7rCt4oGcnBYoM2VcpuYrv7TAmLzr3+P
	RQip37JkITS8LRCtF/7vgJ1XQkTve1px0/gvej0Nb+kirZtVYvIF1PguKM64jtaw
	Ce4IRUIB+dOuMwr4JCSu2wsDpeOewifeTDfdCL8tIUJL0bpwf+xo1ml84JiNOCPL
	1ZeHY2+T87zg3nyNux1cUA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4220498t7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Oct 2024 04:49:30 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 494414B4013404;
	Fri, 4 Oct 2024 04:49:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4220571hje-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Oct 2024 04:49:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIQ7BwR01qwK8KZQ5urpKdawW2vfrJwRp1wVQ/nrxOJmGz6EuBwx0ysLWN5U6QvRc355mZkPM23PSkhzg8MW5ZMcYnrwCkqkUIrtJlLfOOP3/335VJ3usASHfDFkDlXaItsti0/umdkNcHMxIjU9AMPCeCviYtNkJGtbeXJKLCsyniDrn/Cz2qzQbA836lBlU4i2LmldCSIAxgSIzna2AmXSl8asJTNF63Hu5nFAkuUkd+/28M12rKLIm3qwJdoPGCxpvRbfTyI1yiMcleZy0Xl97k9GtlIkSCkGtgAvv0JWD5i8TiX9Rl3rNyY8uo1yU28VwRzzhCQtk5xxRbjbiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcJEukUvjNKIK5VuFiMt1xNREkwkUGfeRW6clqTM08Q=;
 b=RY3gzTth+iXG+abzABgWRb9jbbSZdLseaTAUboqVow3rP69k6vKISHvZVqdxz/gmfctbgLDC6GWvcXGlMAvoyp6QRyX3nYpGyg9Fk5Nmpk3/HsBJsjC2sROLKta/gldG4D/OQ0oWRdwf0vx3f6MUK2+ImPv2RIGnHn59dSXIILrUSvE8G6KahN+X73CaVbK89lCyoEP9UUnnk0d1OMFKIsC37k72Yrj0rfH0O39MP+9D8D+m17479NVTFY6Phw/fs4GQOfbd2SNp8PXZC4EvhPZp1hSnLM6iU05q/UVrsT2KwPAD9wrOIdNQjqhE7mxfojxtgVxC4PNMZbQq89IQqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NcJEukUvjNKIK5VuFiMt1xNREkwkUGfeRW6clqTM08Q=;
 b=XOmeA989fhqMxBLgVBIsxzZcPpzfFh5R4Job1iccN4aHmSF6mAe7xJWzUM9s5vPO6QxUaCbH7+Dwlb50wNRkqqZXkeGcEfe7jr8JJxrp0o3OoGZhZZUP3fEzXOWbYYtsqYzH0tJtgL08YqXXv5KPmcphIW3SkvKqzm7TKKmxJ70=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SJ0PR10MB4464.namprd10.prod.outlook.com (2603:10b6:a03:2d0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Fri, 4 Oct
 2024 04:49:27 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 04:49:27 +0000
Message-ID: <ad5e0e40-1ba7-df9c-71a6-1008c9897694@oracle.com>
Date: Fri, 4 Oct 2024 00:49:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 17/19] test: Add a pid-USDT test
Content-Language: en-US
To: Sam James <sam@gentoo.org>,
        "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev
References: <20240829052558.3525-1-eugene.loh@oracle.com>
 <20240829052558.3525-17-eugene.loh@oracle.com> <87cylrf4sr.fsf@gentoo.org>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <87cylrf4sr.fsf@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0182.namprd05.prod.outlook.com
 (2603:10b6:a03:330::7) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SJ0PR10MB4464:EE_
X-MS-Office365-Filtering-Correlation-Id: 814a4b73-42ff-4e41-36b3-08dce42fece8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHN1U0tIT2dVVVlIYmE5ZEZGUTZocnJYM2N3ZGhwcU1wK2F1VnFTY0E0bmtY?=
 =?utf-8?B?VFlnUVhOTVNHZEkxbEdQUDRVTWxsOVcvOG5rR2FBamFwZlkycmVwSEk1UWFQ?=
 =?utf-8?B?amJqc3ZqSHhXdHhvVXBReStHVUZJQW9ySmZiNVk0Zllpd2NaVW1lbVVFYzdS?=
 =?utf-8?B?WjY0aWdrQ3VUcVNaTmIzM1dDdXIrK0ZlMHZGNi9DeVd5MmZ1NFhnczRKZHIz?=
 =?utf-8?B?UUlYS2RXSXROYllJejFrY2gwOStyMWtkb2FxVGhucm9GbUsrZUMzWEg5U3p6?=
 =?utf-8?B?UmFQWENqemZycjcrMU1raVhTU1RSK2NWTkhwaHh4QlROQWViSGUwcG5VMXgy?=
 =?utf-8?B?bGM0a1BwcGtjUWd1dFVmOXpyUlBLUDY4TzYyTDd4aWtuakNmNk1aNEtLaWJp?=
 =?utf-8?B?TUVkWXRaQ0FVazR0NFQ4QjJGZGs5OERSSjhURkRVVmtiUXMvekxyZ1E5d0I2?=
 =?utf-8?B?WVJ2ZmJ4cEFXME1HWDltVG5pSjN6dDBjaklYeVJEdHRKNGY1R2VmbnM5ckhU?=
 =?utf-8?B?QkZmbFVBNHlSdlJYMElsTllQaENnLzl6Rm1DWFQ2aHBXRkMrYSt2anV2TUxp?=
 =?utf-8?B?NGxoTGh5aGhtdFhma0RoY1d2a1RYV1hHcitzL2I0N01JaHNacjZsOUwzNTNS?=
 =?utf-8?B?OWVqWW9SbGdoWmk2WlRZaHVaYmVzbmcrWk0wVXI0Z0NveFBiWkNwR2ZWejd0?=
 =?utf-8?B?TUpEN3Q2ZE5CdTBzVm5XeGpmNUpyajFQK0F4bkM1ZDE0MFVKeTJpRklBczI4?=
 =?utf-8?B?Z0pybnZwYXRkMmpraTIxN2MzaFdlY3grdjdvQXdpM3JBMHRJV2pmMWJDMmtw?=
 =?utf-8?B?WW1JV1ovNHVrK3R0djlvdVoxSi9XR2lnc0RXTUhqbjlKS3gwL0lEcG9NcnNq?=
 =?utf-8?B?TXdKcGpjczVqb1o2cHVIWGdMdXJ4dG41b3l6MXJEYUNyVW5IdGQ1a1JrK3Rz?=
 =?utf-8?B?NFU2THArL1BmMjM2Ync3Si80YXJiMUZ5NS9kOXJqUnRkVVBUY0lWK2Fud1Fh?=
 =?utf-8?B?enAwbHJnYW5tR2hTQ1N0eUg5M1JEamlCNm1EY1QzSVVDSFdsK0hMOFdpZkpT?=
 =?utf-8?B?YnVvZUdmQXpwaEM3RkZZQVpId2hrRi9pZVg1SU9XSHdRZVNMS1pTU21vQTNX?=
 =?utf-8?B?RjlNeUNDTGJDMk1lTUx3dXRqZzFjYmgyekZyT29KRVBvb0YvYlhnV2FuMXJN?=
 =?utf-8?B?N25nR1RMdldtcTBTRlFMRnlJL3hhZVJRZjdZUUxTV1R5c095cTA1VzNWL0Rk?=
 =?utf-8?B?OHoyUWVFditNL1RPZlNscGZFZElGbXM4d1RHZGpKWkYrcHYzbk03dWM5Z1JK?=
 =?utf-8?B?WE1jL2J3b3E0dkNVd3FMUVp6MnRwZTZNL0NRMGMvbUpya2JZYUNpalF5bkhz?=
 =?utf-8?B?M2VhMmM0NnZGYUl3Umh5UlhPUXB2UnI4OXpiek52UHpoWUZSUDRCclNieThW?=
 =?utf-8?B?Z1NON2ZxZ2dpMWtFOHpGVEh5ck85ckhPWEU3N3E2S3JQdk9zZUxvcWx4akg4?=
 =?utf-8?B?Y3BXUVRyUVJScXdPcllUdkM2UUltcno3UTdhQjBtSW1pT0F4YjcrOUFoaDM4?=
 =?utf-8?B?WDZpckVVUW5IN0oySjFOTzhQYUswRTlvTTNaNXhVWTNzeEQ2VHB6ejRZMVh2?=
 =?utf-8?B?dUtyZE5wRHdkeE01UmdYNTNWUktQeDdjeUN0bDc5cGtDUDVMN2wrbEZxTCsw?=
 =?utf-8?B?c00zYVFFZW1xSGs3TkxUTGIzZXlOeTgzWlJlQW94N0J4K2FOSXBmcHB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M1pudkJtajhYaGpnbXlPTUJMcmRIUVZUL2o3UjFsTk0vTkZ5TlNLZFErQUJW?=
 =?utf-8?B?T1dDaXVJSHBhWGNjQ2p3ZnVEMkgxT0FYMkhmSGprUlQ4a1YwU21INU4vckhl?=
 =?utf-8?B?SGpxVkI3WE1ja0RydEw3OXE2V1hZZEtQckx6ZkRxUTFzT0U5dmV3Q0FtNnRi?=
 =?utf-8?B?b2pDSDNTVVNIWTliM0lIdjBTMTg5YkJtV1FYSFlwVCs2NEVQYTJFZ1Q0ZnNh?=
 =?utf-8?B?cjZSUzIwamZ6QWNITnE2NlBTK21oRDI1OUZEZW5aMDVJajgvaENXTVZUTVZm?=
 =?utf-8?B?b0I5SkE0cUFxWmVFYVdWSG8reFdabjVTWnVoN01FL3FsNVl5TmVQdkhBRXJC?=
 =?utf-8?B?YUZFdGF6MjJKcFF5U3RNVHB2dTBGbTFwT1crQnh0WGVjTEduRm1OYmRjTHMv?=
 =?utf-8?B?b2o4UlB3WFBUV2pnandBNWthcFB0ZW1hbWs4Q2NaSFVOLzlvUEtWT1lXazJI?=
 =?utf-8?B?UEI1TFFvcTBpblNZNmdPWTFNZ05VdUttQWhwWFdRaFlEQzRIVnNpTHdib3JW?=
 =?utf-8?B?SUhFRGxMcncyQmRIMmtCbDEvZGVQUklSdDhwYU1QaGVnZGhGL2l5VzJ4WkNk?=
 =?utf-8?B?TS9lOGo0MHlWQ05DRkFsY1dJRkVUM3BvdTZSd2xCRFUzZUV5RWQvR0prL0s1?=
 =?utf-8?B?Y1VyMWUvVW0yRTBvSDA1Y1licUZVK3plY0dVNUFvbUlqb0xCbVdFVjMxdXNr?=
 =?utf-8?B?dDlmWlRJUHltdjFlZndGR1ZnalF1L0YzVit3eGZXUHJBeStzZ3ZTRlRjTmhB?=
 =?utf-8?B?N05zS3daVml0K0NBaEdiSFAxWi85c1BBYUhZM2tJVEFtS0hYOC90YW1ONzNH?=
 =?utf-8?B?MGNhS1gwRWV4dUNwRkZhSlVUeTAyQzJKZ2pIcWNGRlg0NjRmUGQ3ZWZjUFNs?=
 =?utf-8?B?R2lzdUJMQ2JJRXZNUjNTN1doRXNWd2E1VTVEbklkd3k5WTBTaktQMzFyR1hR?=
 =?utf-8?B?aHoydXpHbFNWYW9VbGtLUTMyNjAyS1pEQWlocS9JclhTRzl0RS9oUE9aRmk0?=
 =?utf-8?B?bUVyK1dXdDgxY3U0RzNqTm5UZDdIejRoWENqOE9ZZDNUalh5WnRUUHo3MXll?=
 =?utf-8?B?ZVRCbW9NWEltelF4QVdOMVdhbllPWXgyb09LNStRNHkwbGpWSVhaMENZTW5G?=
 =?utf-8?B?aDhqdk1rVHFMRFc1Z09iTWNEcXhMc1gveno1YTV1SGtKMG9nbElBSS9GdTdM?=
 =?utf-8?B?USsvNjFBNzBnbXV1VytjckpWQmZ2eThReUVLWklQL1o0MmMvUnZORUh5TitS?=
 =?utf-8?B?cE5ETVlLYVZsdFBoZGxKb256cFdsanluQ1JWMm1JTGtUZjk5c04reUE2a3A3?=
 =?utf-8?B?bm95dUcwemJlUXp0bG5wZ0Nrbk1yMG5IN1hCOHpUODBDeTZWRkdhRUhybmJS?=
 =?utf-8?B?ak51L1M2QUJqSEhEeWVwZEpKZE1ma0JnTXd2YUpTdnB1eENZazVRYmRJT1k1?=
 =?utf-8?B?UlM5WDI1SW5HZStRQ0FZOVYxQ0d3M3FER2VLbWhrdzlLalVicnlXakJUR2o5?=
 =?utf-8?B?alJHRWUxaVdPQjJUYUJZV21LS0hVbkxwR1luQVVxS0J0U3pQSkhWVkEwcVNl?=
 =?utf-8?B?am1TV0tqQ1VocUhJRm5zdzBQUXhwZXVZZE9LTjFPV0RBMHppdDBlNzM5Z3RE?=
 =?utf-8?B?S05TZVdHUlBGQ0hKWm9XK1RoSmpYbWY3SmRCNzI5UGsyNEpGc2dKNVVIbVFC?=
 =?utf-8?B?N0MwdXdYZUhsdWdkSjg4Zk95M3g2bFZMbTVaUDdUc3padXNTSDVMVW85SWVt?=
 =?utf-8?B?TzhMUElQNE8vYzQ4U21PU2JORDF2WmdqK09ZSVJqRlpsMStMYno1cVJsVjJj?=
 =?utf-8?B?WGNvend0L1hwUjEvTkVleGlVNXpsbGcxazYzWWEyTHUvVldlVkh6MlM5SW16?=
 =?utf-8?B?dnl6bFRGY2RqMVdiOW85aTQvZm9KWi95RFZQMEpMMDhCUlBJVyttMzROM2h3?=
 =?utf-8?B?djh6T1dhc3Rkajg1TTc4cnRiUVIzRUlRLzVsOUxHYXEzQVJoN0l1UG4yTFFV?=
 =?utf-8?B?ZmZnRmIrbXYvWnFrckN6VTZHREVzVFNkRHFEM3d6dlVLWC9Cbm1pWkNGZXQy?=
 =?utf-8?B?WEY0V0ZMNjBQS0xmVSsrMHNpdFBEbzQ2QUV5cjJqQTVGcGRsWmpyUFhjRytq?=
 =?utf-8?Q?Fe0kEDh++vBGl2n4nvY0R2jy2?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	J8QXy69CynqMLvNpLyk3Bgss1DRtH5ri2euWQUCJzOGwESGvHWfvU2l+TQ4eyryK1LFdaeK+tpCXUXShBvHJI1Z0RalKjwawlFhlMBltSfXtnD3HN+kKvw00qNkxBp2SG++wOmRcRKsCygqtqz1bVdKU8mC8anRPwRXtfaiTkPexjf6PNzdU6EdEgu8dP7XVnibFEVG+lD/uoy1DvKI6DCwZ1D6+SqWashkXJn535PnCa+LnFx9xKtBNrl6li3T+qkkDEAJCt46P59ITJZJSlI32PxyJYlQYWL2MoHzwBS/z97UkHmcJZaDQmT9pYrZYsi/H0oKHtH+IGpDv04tLnQqWNliisqKMliZ+bYYIVf+7zjwSEc0k5FqUmin5QMsgkydduqAKwF5+x4J1zv8G7c/WNNi+83aivPibziEaLM5EMvX2dy3baajNWJ1yDrwpjaV4diHOCWuI+qpztnLxW//r/CzadW0gconETHI2b4QH18qNrUjAoGM1RT8PyARC9aoD1+WRI7VyvBGnfA/PgtBs0CfRkzuMOAjpy9uDvB8z1b0Sh46KtWnB6Lb7QoCl79Ljm/egYcknyIWPlwypdVUGahhxugH61TtfhywsFCw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 814a4b73-42ff-4e41-36b3-08dce42fece8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 04:49:27.0123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 755TrWf7zCTPlOCtKa+lEze+sEgAbSCJSJ1+IqwxIPw9RSa88GGH+epuedyaYbXi17uqEOrA0lto6BczQRI5Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4464
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-04_03,2024-10-03_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410040032
X-Proofpoint-ORIG-GUID: FtI9Pn1bte3QCmTn_8fV5e-MtA_14sk0
X-Proofpoint-GUID: FtI9Pn1bte3QCmTn_8fV5e-MtA_14sk0


On 8/29/24 16:32, Sam James wrote:
> "eugene.loh--- via DTrace-devel" <dtrace-devel@oss.oracle.com> writes:
>
>> From: Eugene Loh <eugene.loh@oracle.com>
>>
>> This checks that pid entry, pid return, pid offset, USDT, and USDT
>> is-enabled probes can all coexist.  Specifically, pid offset probes
>> can sit on the same PCs as pid entry, USDT, and USDT is-enabled
>> probes.
>>
>> Note that PCs for pid return probes are apparently in the caller
>> function.  I guess that's due to using uretprobe.  I'm not convinced
>> yet that that isn't a bug.  It isn't what Solaris did.
>>
>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
>> ---
>>   test/unittest/usdt/tst.pidprobes.r  |   1 +
>>   test/unittest/usdt/tst.pidprobes.sh | 243 ++++++++++++++++++++++++++++
>>   2 files changed, 244 insertions(+)
>>   create mode 100644 test/unittest/usdt/tst.pidprobes.r
>>   create mode 100755 test/unittest/usdt/tst.pidprobes.sh
>>
>> diff --git a/test/unittest/usdt/tst.pidprobes.r b/test/unittest/usdt/tst.pidprobes.r
>> new file mode 100644
>> index 00000000..2e9ba477
>> --- /dev/null
>> +++ b/test/unittest/usdt/tst.pidprobes.r
>> @@ -0,0 +1 @@
>> +success
>> diff --git a/test/unittest/usdt/tst.pidprobes.sh b/test/unittest/usdt/tst.pidprobes.sh
>> new file mode 100755
>> index 00000000..7eadb9b7
>> --- /dev/null
>> +++ b/test/unittest/usdt/tst.pidprobes.sh
>> @@ -0,0 +1,243 @@
>> +#!/bin/bash
>> +#
>> +# Oracle Linux DTrace.
>> +# Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
>> +# Licensed under the Universal Permissive License v 1.0 as shown at
>> +# http://oss.oracle.com/licenses/upl.
>> +#
>> +# This test verifies that USDT and pid probes can share underlying probes.
>> +
>> +dtrace=$1
>> +
>> +# Set up test directory.
>> +
>> +DIRNAME=$tmpdir/pidprobes.$$.$RANDOM
>> +mkdir -p $DIRNAME
>> +cd $DIRNAME
>> +
> Let's do mktemp -d?

Thanks.  On the other hand, that sequence is very common in the test 
suite.  Maybe there should be a massive conversion to mktemp if we want 
to go that route.

>> [...]
