Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9640ABA42
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 05:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725947515; cv=fail; b=G0CiGSrbtixLrPk+sBWDG2b9agDlvHO1tRZbtTAP9X3+wMLFNxz8gRfk6hw6jMTEzxwYOc2H4YTXdwQJcBtmAs+3GNLqeU+jJsSc2tm47WtF1DpYTLjmDJcBkGxkVFidaGnb/LyAgNgxOQ9PFzLFL+fjLhkt3FNMGpfqT4Qs+oI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725947515; c=relaxed/simple;
	bh=TRWXpfIPl5Wvu5vg7pFVxh8muOgJSVH88MqHKcKUBL4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Shhcd0KhgnvQv3kgddUBUrNEfj59ViZIs/1XYZzIRMzYNHIf6GdImPEQESIoEFcXVAmhrNs8f22/cC18H551/CgcSJ9KpCEe8PDOEM3lWrwpDVcLGIbSPZXk1kohdxi4py0iAFxsWkMVNau2ZvLgBZSZBaiKnqwMyiYi1Qnq0yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Xrx6OUqT; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZLsnS+fg; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Xrx6OUqT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZLsnS+fg"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A2tWZF003846
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 05:51:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=cF2WwOtpDIRzh4CYOt0vNjRwq3XsKrarEEjVofRPy+8=; b=
	Xrx6OUqTlnBJ3RJOqRWHFJimUFfQrjTgzIzrvBCDVVpenQubvk23orFNzFPudRcR
	VvEJOKVeKO7gdyy5u7OMPNmjvrlQOv8Melt4ZlGXtlttaCWoTrZSAZ3ClHy9B/l2
	SIs//Y0JVgE9bXA5TXClpneDK97EZUG7lwwZ/JfLGbIgyNsvk4JiHJtZq19iSKsh
	VHnAxNm0XVDg7o40/gTs44c08TJyGPRexcp+G4UVo6vsGThyYpOK/9rmjRgkbNKk
	X0yCk+5Rg4FdlRi8atx2UWT4WziUg8ghFnfVw/pmFVOSdVGyiHSxZ/SYjrQ+t4U+
	q/h7toTLSJ/l2kRrTU6fwA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gjbumeng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 05:51:52 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48A58px9000300
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 05:51:51 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2040.outbound.protection.outlook.com [104.47.56.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd99gfjy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 10 Sep 2024 05:51:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDrOiIemxPmk43wARyoLu5JMAVql2Kgpmj2gGWqV/I7YSJt/MVbCG6J+zAbUzLtFJzX+eUUv7L+/E1piYEazYeWKbIPGZ2/47bIAu4igNtaXeRS/R+Kz+fq49nl2UWpcZjuBdDtnOI9rI1kakN7WGsqFaBsS6riIqaMezLvjITNNVkJ8SO5hlQ3VIq3CStsAVmsHDFrqZjq64n0ciGETYqkpMyh7ftRYjdYu0eMeLoVm2aDeIIxUQ6FsZNEVqBtvIITgkx0OwDQcY3sfMgg5lCs9p5NWqC4CmM0ZhnJC5YX9Ahx7T6D00zjJrAzeKy7UP8VW7HMZBDxPN1y47yjR+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cF2WwOtpDIRzh4CYOt0vNjRwq3XsKrarEEjVofRPy+8=;
 b=o/oXVBskOKR4clu08d98laKNZZCQUOvSTVWGEq3e2ICBK7P5xXUksGw5nxAmN8r+yGnioGm4QrymDEeZx0Ab5sdlHywsZx+RL4McSSrKl+7TTG1rK/SRs4IqUY/4fdEi+fV+LLk+Q+iJhjSLBVFi9e4zWACsriptp4WmqYs6XMIe36CJGpO6/nRsmySTthnmX8SJfRdXxxkM4fBp7ME8pu7hYd6nckPqSveu3Tmcl9UOY5jDUStf5p7GR2TJLn451tOSKbMRtBQNwXzDSkP98LYa7YTkDuF0PKdV/FFHaZvreFDOJK/clR8vuG0sN+/WhPpBssFAoPcOT14ojamoWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cF2WwOtpDIRzh4CYOt0vNjRwq3XsKrarEEjVofRPy+8=;
 b=ZLsnS+fg9z9v5fiYvh8WOMlu+sw5EhJqt2cPytOAJ4b7IGfr577gUwIeNAR1EDadsjU6/JEK95JFaYNHi+K++I/SpZx+HBVYWg6ny+ACFUS2BRwBxvGjVO3jY5GleZF/rzBaUTVMgPn3pdMY15Mzv3PuOv/NWcGkPZFmhCux/1k=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MW5PR10MB5668.namprd10.prod.outlook.com (2603:10b6:303:1a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.14; Tue, 10 Sep
 2024 05:51:45 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7962.014; Tue, 10 Sep 2024
 05:51:43 +0000
Message-ID: <65f82c4f-e826-2f66-2ff5-b38bea4de817@oracle.com>
Date: Tue, 10 Sep 2024 01:51:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] error: ERROR probe firing should not corrupt probe
 arguments
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
References: <SN7PR10MB6287064DED46D0F4E2F055D2C29A2@SN7PR10MB6287.namprd10.prod.outlook.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <SN7PR10MB6287064DED46D0F4E2F055D2C29A2@SN7PR10MB6287.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0017.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::30) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MW5PR10MB5668:EE_
X-MS-Office365-Filtering-Correlation-Id: e01346c4-0652-4891-4966-08dcd15ca5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VERWVWwxUWJKa2M0TzhQZ3B6OEZEeGt4TjhabUcyOTdkNURwUXV3cHkrUzlF?=
 =?utf-8?B?akVCcW12RGVjQVFqKzdjMkpBVHp2V1VCYjNRL0F6ZGhIZ29Nb29CRXZLRW5Y?=
 =?utf-8?B?NlVwak1rNEM5UGRkelExdUdZSWd6L2d3K2ZEUDFwbWhhYUhxbmxVR1A4RU40?=
 =?utf-8?B?ZTZaRXR4OXlKQmE3TDZtSHpnZVdYQXlMZlBsWTJpQUNpY0h3ZDRuYmpsN1Ft?=
 =?utf-8?B?Z0p4NCs4c0hFWmoxWHlJMEpTdXozdHAzdENyUUdzTzNiN0k5Wkg4cHB3US9n?=
 =?utf-8?B?WkNsUGpyM0V0aGtIZXkzd0JMU0tDZW52OWh3ODdvajUvaitzb083ellaU2VG?=
 =?utf-8?B?N1I4V3cydTlkTWNla1pUS2hZd2hSUm5vZHBCb0k4QUZyTG44UU85eW1ZTW9o?=
 =?utf-8?B?ZE1lWTJyUXZSSTFpYWNVTTFlK2tHeGlpbHM1anI0L3QvaU9nLzJ1K1g5MmMy?=
 =?utf-8?B?RXE5RWphQkYwSUU4YlFqTlNSQWxJUGVZWUNWMFRjVmdHVk9YckwxU2diTmtk?=
 =?utf-8?B?NUpTVC9Yb0wwbEE5VlA2MEVYUmFmaDFQT2E1Y1lZdk01K2RtMldQZWtnY0NN?=
 =?utf-8?B?OGEzZ0VSNTlkNUdzd0ZmUUgwSWEySGMvWWc3V2hicHVtTXB0LzMrRG5Tc3Za?=
 =?utf-8?B?S2VGcWU2WDhLdU9aS0JianBxRGN4MTJuVVdYTXVDbnJhZlUwMzQreGo3RUQ1?=
 =?utf-8?B?OUFTci9QbThsVHczZlFQaDhzVFVWMzdQcFM5eGdXMWNkTktkUTFnMUtvcjRm?=
 =?utf-8?B?RmhvK0tNQVVjVlZCb2xVT2ErOElxYjBDM0RLNjlyRTJCUzBsUmp3d3EvUFB5?=
 =?utf-8?B?Sjh0WTFwL0NkL2pOdDlocFdNZzNhL3UzbmtNYnpZTDAvRFR1eWptRmdIazB3?=
 =?utf-8?B?YVk2amluSkMxcmlzVzdpd3JZdDQzb1E5eEVLZEpkM1JYN3M1R0RRa1htYmhu?=
 =?utf-8?B?NHBtaXhxcmNGNmV5Sm9FQmJTWCt2UGMzMDZ2QUNzUW9WVVBjYWpQd1RNYWhx?=
 =?utf-8?B?Yk5WOUNGRStPaHQ4OUVTOWxsLzkwTEJWekZ0Y0dGcVlEYjNqNFc4RzN2SlpE?=
 =?utf-8?B?TThFd0M4WlRLemVML3RGdmVSMDBMVnNGVExDc0hoZGZGSUx3b3RlREFCZDBB?=
 =?utf-8?B?M0RZeXlDdDlXL1VqRnNWZ3FFUVplU0FJaEVwdlN1c1RGc0V0RTJVODJjRVZM?=
 =?utf-8?B?MmthNnNRUDg5ekJENnkwaXJ6eFhpRXA4bFVJNlR2REc4Q1lXdlpVVnpmUDZ6?=
 =?utf-8?B?eEcxQmt0eGJyUW9TSUJnSldXQkhTZHovRWZDUjJnT2FJRjYwc0hia1V6bEpX?=
 =?utf-8?B?TW1jSFNSZ0ZUNHpZYTVaR2x2OW9tTkViK0VHSlRBNWtacmFidVpYVU1Oa1Rm?=
 =?utf-8?B?SEtUUWFNQzRxTlRHaDNSN3JabXhBUkUwdFZTdE85QjJORzZnYVRjYXNIeEhv?=
 =?utf-8?B?MFQ4aitYV202WmR6SW9jU3NrQmdUOFdOYWo1Wi9wQzJCaTBhNU9NcTNZUjRV?=
 =?utf-8?B?dkF1b25KblczSzJPYWxPL1JDTkcyOVRSaExHZC85Ui9TTVlRZ1hVR0lIRUM5?=
 =?utf-8?B?eVd6ZXlibmgzS2NRQkRyTWViS3RwWGhTcjhwWVZ1QlZZK2RBNHRTVDZxd2xJ?=
 =?utf-8?B?c2c4cG93cXZwMEpMbGh2SHM5SWw1aHZMVjJ6QUF2QXpqSXRneVFUckVlSzlQ?=
 =?utf-8?B?Y0d4eDdLenl5TUlIK015MU56cjdBVUI0bUJOTUZKaHYwMGhNdm9Zai9sZTA4?=
 =?utf-8?B?N29xeThScWprNTBrLzBHTi9odDdlNERuNHozNFJpcGExb1MyYm1mcGxqdmgy?=
 =?utf-8?Q?vVznXTZX2fMSqSgE5b8GK9ULecSCMJa8XRHIY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WE9mSkZsaHN1ZVBVT3NCZVMwcmM5bnd4bnZBUWQ2bDhNN0pQT3ZxSDdoSTZl?=
 =?utf-8?B?M3BZVUlBczNIL2ZyNEhtQXZsN095M0dxTXFYcVk3bVBnamRXaUtza0Nyb0ZD?=
 =?utf-8?B?WTdtVHgrekhvcENmOGZNSE1jTERSZ21tOGhZSWQzQnJ3Wm94RkVyRml3Uk5v?=
 =?utf-8?B?eGJROFNnRWdidkg2NmJKd2NIR1JEbDhEQzY3anhLZ000RUpBYTJRYk9rNkp3?=
 =?utf-8?B?bUpmNG9NSzJlRHVxWUlxTnFVcFZ0cHJyTHR2SDR3RXkzeDcyTm9LSVpSaFcv?=
 =?utf-8?B?RXZpUkU4c1E2MEdRYTdkN3NISVVDTzcxMjViVlVaMVZOSWxQMVNWM1RubXh2?=
 =?utf-8?B?Sm1SVS9jYUtzT1F6c3NPZEU2cVhIMk5IZEdaSWdBNFV2c1kwSGVXLy92NmtV?=
 =?utf-8?B?akpydVhZdTVKY1ovblAxQ3JaQ1p5MEhFQmp1bjFvbEVoNml1QUptYjdpNTZK?=
 =?utf-8?B?YStsMXdHU3RqY3J5b2dRaGd5eU8xc21oRmRHbldBcTg4MWdvZGVsdEFZTjR5?=
 =?utf-8?B?Rndna0FxZFcrY1FGNUxHZlZQUmJEZFFzSUVkd2ZaNXpHZ3NCRUFvMy9IOElk?=
 =?utf-8?B?SGs1UGREK3FjcVEvRGlyNk9STFpkTjVEYnFaUi9FSkY3ZUhXSHNhV3h4Q1Qy?=
 =?utf-8?B?dmVSbzlqS3loR25rUFp4SEFsRVlkdXcvZi9vWjNsRjl4Qms4Nnh5czAxUk9q?=
 =?utf-8?B?SDZNeHVOSWN6TmdobktEK0duYytua1JKM1JBa3ZGQ2ZxU3pzc1MzeVB3TUFh?=
 =?utf-8?B?cWNTR0p5Mk9BNHVhcTBlT2FUT2pWNjJpY3pPQTZqYkJTNzlpSmlFbGxZNGRn?=
 =?utf-8?B?N3ZOWnFLQVdOUVZWRWZiQWVBTWp6UWszdUtzVDg3M2lleHkwOEF1NE9lZ1hN?=
 =?utf-8?B?VkpYcTBLelRuNWtDNGJQRmJYNzVXWWV1eE9kMzRPSDF5SVVTc3B6RmJLanMr?=
 =?utf-8?B?Z0ttVGNXaTI0WnFobVZldGZ5RERxQm94ZHgxdDlzN1pFLzI3OWpUNWtidzF3?=
 =?utf-8?B?cW5tRk82Y3lZVi8veUMyamZDTTlqcUJNQU9QT3RLVVNodlFFcjdmYy9zOE1q?=
 =?utf-8?B?NzdSYml2ZFpBK3dHWUMwY0xJTmNPaXltY3RHODZZQkNtT0diWXFMQXRQelNL?=
 =?utf-8?B?Q25MRVFoUXRqNW9BUytJM1NLOG5kWDk0STVMVTFDdDVUN1lXVFJtNG9JeGhr?=
 =?utf-8?B?OTduQjFicjlmbWxOZ3BZTUtNMzFFVlBIeXVXTkg5dTZSOUFMS2RYTVpWLzlE?=
 =?utf-8?B?T054bW0zbUJ0R3QrM2NaVTdnajYxWlZSZ25Gb3p5NlppZ0JFWVd6Rjk5SUha?=
 =?utf-8?B?Um1OdXk0UjFJeVM3RUpOZmFUK2ZNZEc5VEF6NkVwU1E3aU03TmJsM2MyYkVB?=
 =?utf-8?B?Q2VzRXRRS3BuRmxCZjBrazJCa2RWSG9hMXAwYjdaQ1hDSnJoRzZDNjdJYmlV?=
 =?utf-8?B?YUowMEpITGlIT2xCNmZyVS9wZnpDTlpscFc5UXB3dXRCM0ZGOHZxY2JvQW9w?=
 =?utf-8?B?K0ZpM21GYjFoZm81QndvNlovU01DZGo1VE52WndKcWVQRVo2OUkrQWJrZWVT?=
 =?utf-8?B?RTdlVW81U0dKU2Z6S01uMXNUNk5yb0w1aXZPVEpkWGNuMHVRaGlpMlVqVTNZ?=
 =?utf-8?B?U1pyZGFXRmNyaXRrM3dZSTFWcGFhd1cwV3h4anZ0N0YvZk9xUENIZXczcU5o?=
 =?utf-8?B?T1QrQTRXMFlzT2dzYjR2R2NiMEYwTlNZNkNwelZCVVhuWVpxZEtTUFU4Yksx?=
 =?utf-8?B?RTJidk5Rc3VIQTFiSG44SzRCclYyYkF6NGdPUVRnZnZGYXZWVDdDczZ3NHlN?=
 =?utf-8?B?emczTmlhd3pXbWl2YlhFMjVBVENvNVRsRytTTzdHTzFINzNsTkdIVUt3L1Y1?=
 =?utf-8?B?cWt6bUN2cElBbWJLbHNrWHpjU2x5SFIvbjIxYklMTWFnc1JjVTVFWXBSK1Ax?=
 =?utf-8?B?d1ArZEFFRUZwUlVJd20yZ1dpb2s5VmJ6TFlNdk9RZDdjbmNYQkpmQ2lXcDdr?=
 =?utf-8?B?b1BEZy8rZHdLSUt4ZmRRNVFrU21CcjdFTmp2aHh3bldhYWg3NEU4Z3VIczFR?=
 =?utf-8?B?d0xqZ0c4cDZhRTcwaStYREhsOGtwTDd0aFI4bUlXL1pkZnMzUlBJMVRZaSt5?=
 =?utf-8?Q?uUqmQeQ4Kb5lcRIklQKPMU1Ob?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aektHnrP+Gr7saf5O/rpdFaSrmT+qqDsr94DVQiA0AFPhcWkSbO2x8yhBa5VCkRwNCuy8+ItmVS2puQpJIIQiuH3ZNtjBDCVgXlBKNSVeVoTFXcpwJzSdnAE1gWAJfxuiDus/SwLwLexxUuVma+1OJ+rlRcSZIPFGotF+8rExyMyGQGK2BjVsGlBvH1wHqKHRKs2rlDtfdALVozux6kuUl9O/dl1b7m9XqQjaL+SZ5ggymjyV3G55dIYvThquy521JPDYrqBijaFYYmVXCsHeWWTbTEfcZ2vNw+9cqn08y/75g3lGVW8TlYJNPmNPf5ZFUnbq9z0WMKX0mt9J5ti1xqKeVfP8GS2ZrH7KeOutNiKlgQQyZtfXZ5DI37d0djb/zdtbfZf2zuVMAw6kPgJvkFmQgxYX4tjKPFA/nB1kPb3vPElNOP4IXfEOwHH3qP6gNmdJ2OZSHlcvU/9vwYE0e1P/yKuiXk5Dxj2uby8SzFNZIAy/TTzLXrW2z6aVuJhRHUlaWtmVJjdIA0rE4lAFLHgE34LkmGwzDbTYUtM47QawfHxaXLVffwkM/ZkamHHPFxBsl4KH8mup0ZYhUY90vBRGcgSwgcULZ11LLeJg+0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01346c4-0652-4891-4966-08dcd15ca5cd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 05:51:43.0004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/xs5Ox+BfZaPxuK235zWi14r7CBYHFMBZxLCe6H1/qKPK48urumB9KRlGOQ3VpOC6rcyBdm1oSSHPknQndEpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5668
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-09_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409100042
X-Proofpoint-GUID: UB-wR4ZSq252lORVi_iGzA4s3nLerbz5
X-Proofpoint-ORIG-GUID: UB-wR4ZSq252lORVi_iGzA4s3nLerbz5

On 9/10/24 00:33, Kris Van Hees wrote:

> When an ERROR probe fires due to a fault happening while processing a
> probe firing, it was corrupting the first 6 probe arguments of the
> probe causing the fault because they were being overwritten.  But since
> a fault only aborts the execution of the clause it occurs in, those
> original probe arguments might still be needed for other clauses that
> are executed for the original probe.

"due to a fault... probe firing" makes the text cumbersome;  readers 
already know why an ERROR probe fires.

How about replacing the paragraph with, "When an ERROR probe fires, it 
overwrites the first 6 probe arguments.  If other clauses are then 
executed for the original probe, the probe arguments will have been 
corrupted."

> Save arg0 through arg5 prior to calling the ERROR probe, and restore
> them after the ERROR probe finishes.
>
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>   bpf/probe_error.c                             |  3 ++
>   libdtrace/dt_dctx.h                           |  1 +
>   .../error/tst.argv-corruption-by-error.d      | 48 +++++++++++++++++++
>   3 files changed, 52 insertions(+)
>   create mode 100644 test/unittest/error/tst.argv-corruption-by-error.d
>
> diff --git a/bpf/probe_error.c b/bpf/probe_error.c
> index c8ddcdfa..8d631704 100644
> --- a/bpf/probe_error.c
> +++ b/bpf/probe_error.c
> @@ -26,7 +26,9 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>   			     uint64_t illval)
>   {
>   	dt_mstate_t	*mst = dctx->mst;
> +	uint64_t	argv[6];

There is a compiler warning that argv[] is not used.  Did you mean to 
use argv[] instead of msg->error_argv?

> +	__builtin_memcpy(mst->error_argv, mst->argv, sizeof(mst->error_argv));
>   	mst->argv[0] = 0;
>   	mst->argv[1] = mst->epid;
>   	mst->argv[2] = mst->clid;
> @@ -36,5 +38,6 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
>   
>   	dt_error(dctx);
>   
> +	__builtin_memcpy(mst->argv, mst->error_argv, sizeof(mst->error_argv));
>   	mst->fault = fault;
>   }
> diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
> index 1422ad24..9f33f1fb 100644
> --- a/libdtrace/dt_dctx.h
> +++ b/libdtrace/dt_dctx.h
> @@ -31,6 +31,7 @@ typedef struct dt_mstate {
>   	dt_pt_regs	regs;		/* CPU registers */
>   	uint64_t	argv[10];	/* Probe arguments */
>   	uint64_t	saved_argv[10];	/* Saved probe arguments */
> +	uint64_t	error_argv[6];	/* ERROR probe saved arguments */

I don't think such a thing is needed in mstate.  It suffices to use 
local storage in dt_probe_error(), which is probably what you really 
meant to do.  Plus, calling it error_argv[] is misleading since these 
are the args that you are *NOT* using for the ERROR probe.

>   } dt_mstate_t;
>   
>   #define DMST_EPID		offsetof(dt_mstate_t, epid)
> diff --git a/test/unittest/error/tst.argv-corruption-by-error.d b/test/unittest/error/tst.argv-corruption-by-error.d
> new file mode 100644
> index 00000000..6fd1834e
> --- /dev/null
> +++ b/test/unittest/error/tst.argv-corruption-by-error.d
> @@ -0,0 +1,48 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2024, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: A fault that triggers the ERROR probe terminates the execution of
> + *            the current clause, while other clauses for the same probe should

"While" is a confusing word since it could mean "during" (which was the 
sense I assumed when I read this).  How about s/while/but/ or something.

> + *            still be executed.  This tests that the ERROR probe invocation
> + *            does not corrupt the arguments of the original probe.
> + *
> + * SECTION: dtrace Provider
> + */
> +
> +#pragma D option quiet
> +
> +syscall::write*:entry

This ought to work, but strictly speaking I suppose there should be a 
trigger.  In fact, it might be nice to use a trigger whose arguments are 
known.  How about a test that looks like test/unittest/pid/tst.args1.d?  
This could also illustrate (without the fix) that only arg0-arg5 are 
afflicted.

> +{
> +	self->arg0 = arg0;
> +	self->arg1 = arg1;
> +	self->arg2 = arg2;
> +	self->arg3 = arg3;
> +	self->arg4 = arg4;
> +	self->arg5 = arg5;
> +
> +	printf("%d / %d / %d / %d / %d / %d\n",
> +	       arg0, arg1, arg2, arg3, arg4, arg5);
> +}
> +
> +syscall::write*:entry
> +{
> +	trace(*(int *)0);
> +}
> +
> +syscall::write*:entry,
> +ERROR {
> +	printf("%d / %d / %d / %d / %d / %d\n",
> +	       arg0, arg1, arg2, arg3, arg4, arg5);
> +}

Maybe it'd be nice to have the printf()s also emit labels so that if 
someone needs to look at the output it's clearer what they're seeing.

> +
> +syscall::write*:entry
> +{
> +	exit(self->arg0 != arg0 || self->arg1 != arg1 || self->arg2 != arg2 ||
> +	     self->arg3 != arg3 || self->arg4 != arg4 || self->arg5 != arg5
> +		? 1 : 0);
> +}
