Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A6F433B3
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 06:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736490660; cv=fail; b=X7MGrBmhQDJRP2jvyGvQdxtLwzFzjlhPjaVadDXSk4JguI80fR6JWYVxAYBWutlWL1HO+8Olof1zLdTaex8yBH01eqPVBzfKYV9BUlV5y6oOOENQuemUWae82n8x/rSJ3hMICYPYfkSxR3NfKYs72Is55fdlcjryKtwQTIJ03Os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736490660; c=relaxed/simple;
	bh=1dveLbyUeM5IOk+s676L2kFfPX30KQIoxhb5SohKr/8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cqc/1CRTtW+9y9l7rVvvY0Txyph/+YjlzC46TeGYa41F6zsFyqjfBeSnd6BXzr7UvpiSarhjMMw+AW4vRqetgo2Q/VaOocLBSu22ELah21Eh1dg8BojdcQfKjPI0Y6qFiTkJfcjOGyJ1ZhMamXU9nstDjllbYyz0d28jW6G+aPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BZ2PHhgB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PvM81PAc; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BZ2PHhgB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PvM81PAc"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509NfsAp020808
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 06:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=y+USipJ3CJZMJAH8wHfclyfBHRkE/e09el6GGm3zPw0=; b=
	BZ2PHhgBelG04sDOqg/ewp39f7dlQhomm0N5XoT92d17vMs3aDALQbJH99gBBxX4
	XmlnoGn7zCC6RYDW9+QQIL96fjWKPfO6uwUi+Y43SPuclXRlPBb20VHI/pbvIgGm
	jZaCFCkB3/XVKfYe/ags4fqYW2vhCt8Q2JLPjSyYaj1syEm6FXNJysLxbq8N67f8
	7C+a5b2OUghfo/y2rqx+ZvRfSLGaT8gGa+lh/fDSg6SeGCiWsfnRGyMEBzqG0Tys
	qehkbXcTUmVZ2mc4iCjIGnZUg/tyQRAI7CKxMpM/EXMaNteu0uguUn/I1hGIDHUn
	2jDTaGJMHp9wIeicZOEByw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 442b8uhx95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 06:30:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50A5Zxjg010924
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 06:30:56 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xuebwgwr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 10 Jan 2025 06:30:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdAcutVfctHb0A4xMmIQEUHrwebhhhf9JGkX0jDyOEGErUyzi5H5fb3CG+5Demm3nIaJ7YyZY8/vrzCvc/B6Fj7X74JxxnR0YbOwoy1PQZpFD38CiOUq7JQQMSXXZPf2i8EpZxN2WXMFFPQHO97K94sbNOfjy/8vlS0zWNe383rblALUXIuku7pVGHPwc7e4y1zFb6bQPLuoIcNSzpdl8TWc5ErGcMANJ94gvTE2JBuY9WtBBYjEZzYrrdC4ElKjhOif8D1GQataodP3WfcJAENfaEYq+mLxnG0GSyMAfMuCRkaeYFO6ugjKJ3Z4L74nmkqo91pOU0kgR2/Hk347+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+USipJ3CJZMJAH8wHfclyfBHRkE/e09el6GGm3zPw0=;
 b=nXk4cON4nl7gP0eGjl5FSl0wPOmxbWvxBGY114UhCvQOoWO47OP5QREtl5TTkIrXUJ62CQWkWBBuUeat15kzgre5dvYyrsOboQN3ZXIBTUtAOJjarf/xqbwYCeLebJY0SK6my0f6+esohOG+R+VQ45v6uGXPvYVe40ba4pyCzZexqpotfOpR3P7XLDMCoqPbfqyiEFIynb8hHvkT9+XsQDURivSIBRUH2AoHiIgytPaaxYNqySJ+8MFO6dlhBH3YmxnkY+UlzN77CuuM6/9f6v4gBZMjGh6TwqkdWTWi7ShiowpV4A/UnleyRmgLXV+Tu8uICX5mYCxqJuELJ3/9xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+USipJ3CJZMJAH8wHfclyfBHRkE/e09el6GGm3zPw0=;
 b=PvM81PAcaFKETWwFLORQoSyz3kK0MXU29Sa1vnIWdCeaokeM4e5MWwlp2hzk2U2YMbdORUdSiReUmYQoCfdSup3fhT6gcr/5un6UHgoHovc0R+MbErSA4J/CcbE6i9BDjHEEFuhMz9TEP4Zt/yxvyWxDyhNTWkwy26/PCLf9wsI=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by BY5PR10MB4195.namprd10.prod.outlook.com (2603:10b6:a03:201::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 06:30:54 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%7]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 06:30:54 +0000
Message-ID: <70efe39d-ec79-a959-f6fc-455fab4f0d51@oracle.com>
Date: Fri, 10 Jan 2025 01:30:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [DTrace-devel] [PATCH 6/6] Add support for pid function "-" with
 absolute offset
Content-Language: en-US
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
References: <20241220222716.18511-1-eugene.loh@oracle.com>
 <20241220222716.18511-6-eugene.loh@oracle.com> <Z4Afgp96zlq1g5Jf@oracle.com>
 <68af528d-8dbd-f081-835a-d92b42e3045e@oracle.com>
 <17bc480b-3785-7b7e-9df9-601d65038df8@oracle.com>
 <Z4CrGJ8Muw1qXDf1@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <Z4CrGJ8Muw1qXDf1@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR15CA0041.namprd15.prod.outlook.com
 (2603:10b6:208:237::10) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|BY5PR10MB4195:EE_
X-MS-Office365-Filtering-Correlation-Id: ea4fb83f-215a-4984-a043-08dd3140557c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SDdDS3FGWFNiUjFmUTh1eGx0MkFDK1pCOTI4WWJkOGQrOVRPR2ZMSjdsYVVo?=
 =?utf-8?B?b0dIakdkV1c3TnJjaytFVGx1RjBSWEJ2RnhuOU1wencrdUJzc1E4UTlDaC9w?=
 =?utf-8?B?dFAzelRnVUs2UmlzU0tBMUdJSzJWcmF6NUxjRkgvaXMrK0thdC9vbmVGbWY5?=
 =?utf-8?B?M3hlNjVnQm1zeVJiWTBWZHpLTThkTGNPOS9qUkxkUThKWkhjcEdtWnJyaHN2?=
 =?utf-8?B?TEZreUhmeUUvTytmTnlibHk0Szd6aExSV21oQ2RMb1RWNVpUc2xHOEtlQ2NY?=
 =?utf-8?B?R2N3WDNkUHc0VlpDSG03cE1zRTNyUWlEN01ha2NqaTd3Q0NTamduc1dDZlRo?=
 =?utf-8?B?RzgzSDJGMnlvYWc2M3FLcFQ1RmVwaXM4Zm1MeEhlVTh6cTJ4QkVoWFJMYkpp?=
 =?utf-8?B?ZFJXWWVjV2NBTjhGZGFFTGpuZld2Tm91aGoxN1lxdE5qWmNWaDM3MWZPNUtI?=
 =?utf-8?B?Y0FZeE5GbmgwbUlpcFcrOFdtaUxNL29OWHRTdndFN092bDFOSlpkNEJITytv?=
 =?utf-8?B?Zkg1bTMvaE9TaG9wdWRpOGhaOW5TclRoOXBEMkJzc1A5YTdZS29mazd5a3Vk?=
 =?utf-8?B?M2NQTzdrR2xhb1pQQ2dKSG5oZHNZZXk1R3Q1VUtJcm5odkNhWU5GWDdTMnV0?=
 =?utf-8?B?OXVnNWN5OWRPYy9JVEVZeFIzdWhET2VLVFZrOXNvS1FmTzhwcXEzbGdJSEUr?=
 =?utf-8?B?U2RvWXloNlZwbGNaWHlUbzJ2ZkloUnhuSTRrb2llTEgzMkVKTlNMSHpSRzUz?=
 =?utf-8?B?ZzJYSTdobjZhMmJVRjBOT2h2UlFXZkxNbFdqTHhaTG9od2h2Ry9RQlVCaExw?=
 =?utf-8?B?eUxic3ltSEZDdnlMZXY0S0RINU5HbTY2ZEI4SHdIdVFrU0lhSzY1aVgwNzFC?=
 =?utf-8?B?TTRXSi9oeDlKQWdmT2JidlpiK0xRWk14d0IvME5pMzFibkZOTjFjUjRCb3Vl?=
 =?utf-8?B?WmkwKzU1dDRpQTFVbFU5NUs0T0p2YnYxNG1KeVBHVzVKTjhRZEJyRVN1TGFj?=
 =?utf-8?B?M3NsSmowL3BiVzk3TUpOWlpCakJEZTIzYzRmYlg5c3JKWGwzS2tyWDRGVmpC?=
 =?utf-8?B?eEpwQ1ZLN1R4YUdXWHBSVW5hQnNtVnJXaFlQME1ZOTVieHBTRGNvaDlvRTVY?=
 =?utf-8?B?Yk81dWtSOW1JU2NjTmFSMnJlTmlaNElGOVUxQWI4K0U5WU5rRlhZZUE3S1dn?=
 =?utf-8?B?NGdsUGx3L0J5WlYxVUI2YUtmbVoxaW90ZkI1ckJPZjlEampUQWV1bTdZU25R?=
 =?utf-8?B?Wloydm9xYlcrMmR0Q2Z3VENMcU1YSE53ZGUrWXpPNmtpQkZWREdpSmpKc1l4?=
 =?utf-8?B?aHlXRkZqR1pyZGZVNzRyN1ZDTFhZcCt6QXhHblpEaHFpUmE0aGVOZzRVZ3Ri?=
 =?utf-8?B?dm9DQmhpeVF4NHN5UDAzT1dCV200citUdXJrdTVQMW1wVDhhWlYvaXU1ZVA3?=
 =?utf-8?B?QklFbVkwK0lsZ3l0dWVhYUJmYXRwRkkxVlhJaVhqQ2xmT0VrcFFuOFRJWnlp?=
 =?utf-8?B?WjduVDJjekljekJlSlo0OU1XaWZkTlloWE4wZWgvclZ1cmt0MmNpQU90VmdW?=
 =?utf-8?B?SlBqSUk4WUVjRHVNK1lhY3p5V01vL0hBbWN2NXVFNExqVWpuTVRJQy93QWV4?=
 =?utf-8?B?WkJ5WitVdWtWelpHTzUxWm1KVjdodkdrVEZabHdLVGZFQ3JhZFN1UGVpWHY5?=
 =?utf-8?B?ZGRtYzRlQllBdkFVZEpaWjVvcVYxOGZabURKdnd0d08xbENYck5lNnV0SGV3?=
 =?utf-8?B?MkZ1SDRNeU83UkdDdUxrSXBUSUdoQm1EVjVWTWRGQTNqSGljSjIrQS9LaWR3?=
 =?utf-8?B?UFZNRDhKeEp0ZS91UGgyQjhJZE8xaE1aWC9BdFFubGpIM0tJWG80UUZ4VFE2?=
 =?utf-8?Q?6A33hFSRM1RVQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmhLQW5NTWIvdjQ2TU5HSWxtTDU0N3pRYzIvb0JDRndheUFFYURMUHZpMVJP?=
 =?utf-8?B?MmVVOG9LaTZLTVNvVzA5aWgvbmVYWXFzQzRxMGZOajV4RnNkS1pVcU9Ubk5J?=
 =?utf-8?B?M2ttQUhIQjdyMnBqNSt4c01JMXNpNTVwUGZmQ0dVU1V2WHpoL05FK09QTkFR?=
 =?utf-8?B?TTc1SnF2b3kwRDFid2JUTkJyQkFObytLNkxjTm9oWFR0SDJHSnNFd2F2dTds?=
 =?utf-8?B?NWdsMFdmVS9namZyZ2cycGhUR0hoT2JlQzhNbHc4Z2l1RC8yT0RFYkJ5a1cx?=
 =?utf-8?B?ZmlUUzYzTWo5YmcxbmJKSnlKY2tKSjBFRTdLVTdpTHJBcko0bEZWRTFrWC94?=
 =?utf-8?B?c09zRlhCZm1VbUJlRVVCRnNHR25tNjNxQ25Gbk80cUMvelpXTmo4dDFJZHlI?=
 =?utf-8?B?SWR4djhuYkx4Q01qZU1FUkN2VmtLa2VTMXVMQ2prWmJTRmpwUUZxNk5wVFRo?=
 =?utf-8?B?WHFoNWhubVRyN0EyTEt6Z1BVNmoyelBZaFVWbmljSkpxVGxxWTE5bXEycWVR?=
 =?utf-8?B?Mm1HQTQ0eDR2alptNWNUdmcrL1pvOHE2a1hNeldBakFFUXBmOWZab2w0SFdp?=
 =?utf-8?B?dkYrZVhnM216cG1JQmdsVjJxSWZxc0I1aDQrL0JOcmcvei9SQzdUdE42dEJm?=
 =?utf-8?B?UGw3T1lONEN5a0FVWTlxVXRIeU9ERTlZZnRWN3JpMjRLVlo4U0plNktZYTdF?=
 =?utf-8?B?NDBwOHVnTjlsNS9zV0UrWXV2cnkrQkEvVnMvODdDQkU4SUR4WmxyTzhFVEo5?=
 =?utf-8?B?MDdxTEdkYzdIa25YSUFJN2pIMy9FQzkrYTJBaENhRWd4WnFXN0Zwa2tGM1VX?=
 =?utf-8?B?UGRuKy9vcndaaXRTazh3a0ZZZ29uSUxvdDhZREtEY0p3bUViZWFlcmd0VWZJ?=
 =?utf-8?B?d2kvWEc0V2RscFIzTDdNTWl1MWxIa2RVUlJmTmtvTTJnb1hwMTRuVHB0cHlS?=
 =?utf-8?B?emo0c3B4R3grL0djbG5NVzlqdVJZVjRoanRUcCt2cjBFN2k2NDV1MmRVb3Zy?=
 =?utf-8?B?NmhNYy8vY0ozbG5wRS9pWjc4OFF4RzczL1RtNnBCVG9MUTRvTGd3c2VZMy9m?=
 =?utf-8?B?K0RTYThlemFQSWdBODlwV29CNE5JcHk1Qk9pZGFzWXRjaTFiU2c2UU43T0U2?=
 =?utf-8?B?cHJoWUNxTUNHTWgzZFBuV0d1dnFIRmxxUHZDVFptdlR5cWh0LzRTY1JqWVgr?=
 =?utf-8?B?bU9WZlgzTnE0Q2J5cUFVa3ZZWTdGY3NsQ0JCZXYwaUR0TmNpZTdrSUhBSWhO?=
 =?utf-8?B?QUVyM3duazZJUWhnWEFpMlg4WFM4K3hIVWFOR3FTRkxlZzZYVnp4ZlZOY2Mx?=
 =?utf-8?B?WThHUk93b3RTbkVRNFVxbmIrVnlXc2k2VHAxSzNHVzdqUmdubGJnRjZBR1pm?=
 =?utf-8?B?UlZIbFk2ci92a05tYUdTZTNZTzBVSGhEU1Z1NkROSm13OHE4SWJORjlmdURM?=
 =?utf-8?B?Yk5SL3NCemhFSDZJSDJJMXZNQzJTZlBuTjFOSFp0eW80eW1Hb3FhMVoyQytT?=
 =?utf-8?B?QkZBaXF0ZStTWE1KT3d0K3BOUzFEUDZMUWdYS0JEeFRVaXczQVY1ZERnZm5M?=
 =?utf-8?B?T3dSVmRjaUx1SndjQ0xoL1REUGliRVZVL2dKcjB0bENyeXpYdHI3TzV6dWx5?=
 =?utf-8?B?SWM0SVdqVm1UL3h4SkdHa2I5T1BjNHhMak9kL1hZUGhUMmNidzdkNjFZemVz?=
 =?utf-8?B?WVhjdW5vTWV0N3gydWdjd1NUbCtFSFAzL2F6Wlg4c3hrbjBKdkNJcTRsL2dE?=
 =?utf-8?B?N3BjamtBZFRSZHhMdmttSE03b1hMUjN1M2d5SXYybS9Vai91UEtRT0J5ZnhL?=
 =?utf-8?B?aVRUVzdtb3gzditFREZQYmUrN2pET05wdjUvVFpjK0dpczB5djlYZHRyVlZ6?=
 =?utf-8?B?YXBzY1E4Rmc4KzJIdkMyaDVZRTFhY2NzUWZyTXZkWkYvaFF5NDg4bzZNM1cy?=
 =?utf-8?B?Y0E1bDFHYmphVk9IMmFvNElMVFVaUVpnVnFtU3hVb0F4TERTZlBFYm9qbDlF?=
 =?utf-8?B?emtxY1lkTUJ4ZkJxYkpzQWJ4ZitWSEdyMU5VNWhYSng3RDRqb2JETktyYnAx?=
 =?utf-8?B?NjVLaXdiWTYxWHh0T25ueVpPZ1R2aTg4QzhsbXhyRWpzekZPcDN1SUVQUTdG?=
 =?utf-8?Q?4ffPeUux7XS2ZMuNz7O0165xr?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	l2PnVv7rgUj6N1jmAvC3Kau9bo6LeXeX7FumAVn9ffA2CfD6RdA/I7WKaVKd+6OJRU1NokgKaVHYcxroXTxv7WTdJ8seUslrw3Q5MpgbAaz5N8dNRMnmGwJME/lvUPAhyyONyWSI7LHMX9+1U0AU8IJ25VSw976IuS3p4FetN3I/5ovj/pepTWVU3zAX9l5Mkb/tMTlMjt4MbFYJRwV1BxwsRCVmfMRup5agEyI/XUtUMQoWk80gq9UhNYA+eETc2iik/VgNE2xG0XV4EWF1NmDW7mVBASsoMzMzL8bTyNQsQZ42amosdBVi4LY1T/Ny9kw8pXoKlBEsRGD/+Pe07fJTGneMpC0bEvln/4eocifHZtxrqJPARJEO5HAdhOHwXQoCTL648jS0Lm6KQAXnzV5O5fUJmEkOfkr5nQISawG3hm69FmOyj6PjsGEk2ltpVrakzyc8S1Jinlq/ZgrTD8hOFw19sWn5iKkruRZSCvKFmINvvqHax/83WkSENSrgq1fGCX9AeH5WolHmf43Lkk4Qna6SiXAwFPyTsn5TwLBcdcc6B6l4EAHsFvkWrdg6ICiEW7r1fhPAYt8keGjYUvpkNUckMKvws+vSVsWWDlM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4fb83f-215a-4984-a043-08dd3140557c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 06:30:54.0170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1pfli+ldMlxNLfZVy454yJ0kpQFX2/OrNTCi2GyA04talXweysCwpslgAbaZ58XYp6q4094WYaj1fOHQaJVeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4195
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-10_02,2025-01-09_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501100052
X-Proofpoint-ORIG-GUID: IIs54HbdPY2J2gyofaJiTgVeG66B0INS
X-Proofpoint-GUID: IIs54HbdPY2J2gyofaJiTgVeG66B0INS

On 1/10/25 00:07, Kris Van Hees wrote:

> On Thu, Jan 09, 2025 at 04:00:42PM -0500, Eugene Loh wrote:
>> On 1/9/25 15:52, Eugene Loh wrote:
>>> On 1/9/25 14:12, Kris Van Hees wrote:
>>>> On Fri, Dec 20, 2024 at 05:27:16PM -0500, eugene.loh--- via DTrace-devel wrote:
>>>>> diff --git a/include/dtrace/pid.h b/include/dtrace/pid.h
>>>>> @@ -47,6 +47,7 @@ typedef struct pid_probespec {
>>>>>        /*
>>>>>         * Fields below this point do not apply to underlying probes.
>>>>>         */
>>>>> +    int pps_absoff;                /* use "-" for overlying probe function */
>>>> Why use this?  All you do with it is record that func is "-", and then later
>>>> in the pid provider, you actually use that to force the function name in the
>>>> probe description to be "-".  But that function name in the probe desc is (in
>>>> the pid provider) already coming from pps_fun, and the code was already
>>>> assigning func to pps_fun, so it would be "-" anyway.  So the pps_absoff seems
>>>> to serve no purpose, and you could just rely on pps_fun being "-" when needed.
>>> Yeah, good point.  Let me see if I can remember/understand/explain
>>> what's going on here.
>>>
>>> In essence, the problem is we have to pass two function names: "-" (for
>>> the overlying probe) and the actual function name (for the underlying
>>> probe);  up until now, they were both the same.  I tossed around
>>> different ideas for this.  E.g., pass two function names in. Or, get the
>>> actual function name inside dt_prov_uprobe. It seemed to make most sense
>>> (given the alternatives) to pass in the actual function name and add
>>> this flag to say when the overlying probe's function name should be
>>> "-".  Does that make sense?
>>>
>>> Note that pps_fun is not "-".  Although we set it to func ("-"), the
>>> code that processes this case then fills pps_fun in with the actual
>>> function name.  Again, one option is not to do this until
>>> dt_prov_uprobe.c, but that introduces some other hassles.
> Ok, I see what you mean...  because we rely on underlying probes, we need to
> track the function name that the absolute offset falls in in order to be able
> to determine the underlying uprobe that the PID probe maps onto (especially
> since there might be another probe on it already).
>
> However, as far as I can see there is not really any need to have a function
> name on the underlying probe.  After all, it is actually a uprobe that is
> identified by dev/inode/offset where offset is an offset into the mapping at
> dev/inode, i.e. not relative to any particular function at all.  So, not
> having the function name associated with the underlying probe would make more
> sense than what we are doing now.
>
> And if we drop the function name from the underlying probe, we suddenly no
> longer need to carry it across for absolute offset probe, and this entire
> two-function name thing goes away.

Right.  I considered that, but decided against it.  I think the reason 
was that, although we don't really need a function name for naming the 
underlying uprobe (as you point out), it's nice to have the function for 
the whole "USDT ignore clause" stuff.  Put another way, we *do* use the 
function name of the underlying probe... not so much for naming the 
uprobe but for an extra USDT ignore_clause() check.  If we wanted to, we 
could get rid of that check, but... well, that's the trade-off that 
we're facing here.

>> Hmm.  Having said all that, maybe another (better?!) way of solving this
>> problem is to add another probe type to pid_probetype_t.  Maybe
>> DTPPT_ABSOFFSETS.  After all, we already have this problem of a "special"
>> name for the overlying probe while requiring the "real" name for the
>> underlying probe:  we have that problem for probe names.  There, we solve
>> the problem by checking the pid_probetype_t.  So maybe that same approach
>> should be used here, for probe function.
>>
>> Let me know.  If you agree/prefer, I can revise the patch.
