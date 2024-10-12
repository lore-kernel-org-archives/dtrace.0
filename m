Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB1D1799F
	for <dtrace@lists.linux.dev>; Sat, 12 Oct 2024 03:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728703780; cv=fail; b=iZhSmkMCo55UZD98MG+lOTjkAsxTeQdg8ky5MOdtFRrvjCJ/oK9ok9Od3d7rF5cQJh9JkhaQRgsShnkuo8aodHMTdNc9glSEhEMyWd3hnxo+G8SnnnQiBrZz+Xq39gjtOw1QyzXcoTuCYBC35xqybIvKYtORxmVL7OPGfgShtVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728703780; c=relaxed/simple;
	bh=ktuqqjrMY3tz+3Igd9DWVWfdMW2g/TuLkPP4ro3rNWc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kaT5x+h9/pS15YUYut7EF8X0Eyo/fkcX6F6mCUxbaEHtH/kz3xQ4p5uGgrq+5Um3jp0bO8ldMz4NqjSqy6W9jN9TS+hoNBdjcQidzVAbVS3TM2KGpY0EQOZ3Nkjy1XDF88Eo3CT/v8jRnzW+HPErUsT5gampXyShS+gVpGL7L7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=PJLrlRS3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=K/OBaP5B; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="PJLrlRS3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="K/OBaP5B"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C3CmxG014673;
	Sat, 12 Oct 2024 03:29:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=r8RFnlAw7k+b1XNpAX
	OxrZX+OnJfStCkC70wKmFflJA=; b=PJLrlRS3tgGaBoMWBNkXBjptTgf58JkOHM
	5vtO8SxPPBARcA7RZ0W4QXvxyoEnnmsTCowFkl5nrms0ezswA6lq6Cc8ZliTsWBD
	ey2XY9R8vawffRBawDgDwT1hutpiF3uWTaIJhcUPxLB1oNjqrNsza8SHZxtnfenr
	YSyHQGPZ+30ymtCCUrMKsshr3BtDIJPdsJVatWyxmLKZhWmVeLP4T6L61BhmBrYu
	hN5DReIeBoKSMxYfiYFrbRsaaY3b/jcjueey07KqoftXcsFrjSVxMbNQKHqUWnTo
	K6Y3kp4rmbHnW0dkoqDK9yrESnZK79mgpek4mdIniZmpyCGjI6pw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 427h098088-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:29:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49C1XWvB026553;
	Sat, 12 Oct 2024 03:29:35 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2042.outbound.protection.outlook.com [104.47.70.42])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 427fjasmgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 12 Oct 2024 03:29:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwW5S2DpRyHTmwMq+QWm1QT7xSdpwFLKOJGDe3YVqGpcZiL+Aakv+Ivyg8vXHEz7SbsudauvkoKu5v+FCwlCeoQBuKtYXz4HLztJPF7XAvdB4aCgyEPs5DwrVk9qrDoAPm+ZGufzuYIP1qh3lNSArx/mYrfRdQUMWmfLZiFuxpEYaM3TTnvz+5xnqPlTbtqA+tnOUGg8GiKNM0amYwT5CY400koXTD/jJx8Y4zBezpDVMXa4ndxHU5qWGumpojXzrJ8Rkz3ywI3HiazIBoY/XUtqK+o86xW/Q8jHjO317L8vzVq0EKZR8z2m9PFhm4wxmPON22VNoKb7GwVIIgvJJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8RFnlAw7k+b1XNpAXOxrZX+OnJfStCkC70wKmFflJA=;
 b=sGfm/9ujA9sreZrc4AYVp4j74GYM40ynKaiuHuTw2LXnun7g6aCskNWcQpEXLfYHq4ZGeA9ESnSLbCsNCYmiCID0TdlDtY3CaM25C4Mg95xeUEEQrTQW9vyF+lDUC+/xdSIPrNF/Es2UfpwSytX2lfgb6QHfY3Bu3v8Y/3KgDHmNeOxg/OwvUpQfId1R9ahguK2x6Ma715NYbGMjobGnJulInVYD6WabIWQr7dkZC3s5yimfDC70GTNVA8eeHJ3JTD7YjQm5ZAsE4kdzywmMuFDnm/xchhMP2PU5pkl7BOoGNp83BorJAxOJiRMqPplX6TetC2cA/vdhWhs//8/5YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8RFnlAw7k+b1XNpAXOxrZX+OnJfStCkC70wKmFflJA=;
 b=K/OBaP5B/v9lJQw+u1mMQvP8pvBVchpA3RTKucvISAsJfTJBR1ZkqqbaXLRMlRxGP530/sfjAbZpApDaHb7DpZlLTIWGRnDVFojKjHiEaz0ycb1hpOSi0PS6CkxH1THSQ+umGZXcYiBHeiTdnIrfJg2qJpk0T9sav50ELiIWKGo=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by DS7PR10MB7132.namprd10.prod.outlook.com (2603:10b6:8:ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Sat, 12 Oct
 2024 03:29:34 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8048.018; Sat, 12 Oct 2024
 03:29:34 +0000
Date: Fri, 11 Oct 2024 23:29:31 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Sam James <sam@gentoo.org>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH 3/3] test: fix exit code in tst.newprobes.sh
Message-ID: <ZwntG33P5oU7pt9t@oracle.com>
References: <cover.1724112622.git.sam@gentoo.org>
 <6ab9502eb62a6d4be913b5032fd6b1f54fe7627f.1724112622.git.sam@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ab9502eb62a6d4be913b5032fd6b1f54fe7627f.1724112622.git.sam@gentoo.org>
X-ClientProxiedBy: SJ0PR03CA0365.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::10) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|DS7PR10MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fecc737-9477-4873-e50b-08dcea6e1763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IXiU5Rx1iZUK4P1qjbMwDi9ygmznPLNXKjzg5xU/2u+TFpub3F2I+3U8lMfF?=
 =?us-ascii?Q?qYKYaj6hPqIV3IGtX6VGbdKlTR8a/5xPA5P2iB6rvsZVfpRn3a/SG12kYftZ?=
 =?us-ascii?Q?CNlhOU/Qy6hgSl1BmTanWGPqB6Fb8O1yR7XSx3sTrBfQj2tZD1IVRG+zKGLz?=
 =?us-ascii?Q?cZ30xnFrt4ZtrWBS2tHMVtkb+e6ZR0i2EKKttTzRbk3Qv3a+Qy0Hwjy5rqvZ?=
 =?us-ascii?Q?i7qD/3SIQoqFILvOsBd2XJ5KV/biVuvvLfj482zLnAWItyNckjjRvr6gdpvt?=
 =?us-ascii?Q?dXGlnQOVGFU6kghetmxkKT0sGejG5WfxKOheGQWHQqwn3vfKywTw+eJO/Hfb?=
 =?us-ascii?Q?0wwdNPpCY6i+rs5Ma03z7pr/iFvkeuC+mDg8bY63nlDZvWmUegzytK5exvK/?=
 =?us-ascii?Q?wI/rTfyAwRK7mhv/X7QbuhS4zrVCZN71RSEuJuIeOQMaZwcvmHqDti69pCmu?=
 =?us-ascii?Q?uoEmHnQtzcPQGQwHSshLBmPrr0kQIro40WiYqNnAAKzjvCRgq+LB03KOv7yv?=
 =?us-ascii?Q?pdS+botujWz519qcezYQYE+Xq9yQ9ZpzA521+CDktV8XMPvQPSRpxQ6uNDva?=
 =?us-ascii?Q?U2bM8Ae8vsPgVAGl5edaxl1nhYxOKvRKW3gTcUz2eg1zrQ3BQ29GGRxPUvkC?=
 =?us-ascii?Q?1WeJ8AQINDwnW8KXeLQbd0YhkUlb11axLXx935HCITM4WFRNlSUv0iPF7Fto?=
 =?us-ascii?Q?2TqcaYhk5XYDCr7nkxd+7HLH+OQyY5h31Qo+sXXgfGzMPs5qAmpkam1KfuNo?=
 =?us-ascii?Q?qCtze67VJTQPH/E9B9hDtPRXF60xV1Vri/7nE/fosbW2ooPssHKL2pg3Dx6z?=
 =?us-ascii?Q?P/MhjqXJGxRHtkRqEVZOAYG5QyW6xsZ3uLHebhgg0oeS823SudT4g/XHQ298?=
 =?us-ascii?Q?s8g16wnb+7dtCWS9VeQ4xVksxzQvg+rvfV6yC8wq7/ena3ocsw61JxQ2/nVZ?=
 =?us-ascii?Q?LbaiP64DFGu7bhh5IDtnrLjpgCKmg2YGmT9ApiXFd1FYqj0cdrftjfp+MbDt?=
 =?us-ascii?Q?QK9C5rWm/x7wlOHK6f2mFTr5rZNCvig966VPagM4revqJQ+8atdaGavb6Rq4?=
 =?us-ascii?Q?Vq/2+K6dOvQV+jK/C9Lo0Xz3CV5UIBRG0TTLA5OphybX9caAlBPXezOYMx+3?=
 =?us-ascii?Q?TMTgfXEUujoEwvXTTtefrINuj/AUVFyej/bE1AQrizRpAvGPtLtl3b31sf7Q?=
 =?us-ascii?Q?NUnHHR8dhoSkQ3BQ96R8rQSxaiFpcrq50BQphRylo3GkUZLSClK2X45QXQJb?=
 =?us-ascii?Q?h6FfAuSIzGrO3uGa4iwJPoGIAdp6dorh7RY4dZ90Vw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C/bmNUPrgm7LUUFuZJ6N8ESTwPffMmuZ//w0giGHye2NyjD69MhFkXlFlzXq?=
 =?us-ascii?Q?MXkFWxBk+YnpBU90XJgWjtIlKADjK5BE0GYeJRgrNCWqRbADVFWxQ8AzbV/u?=
 =?us-ascii?Q?hQBPwhWedHzeJ4NNdrH52Now/BWcR7nzU4tl+sqzFBR2bPDi8R7cC2/CJwgK?=
 =?us-ascii?Q?bl1Wg63l09/9zD9UFYO9SrAF71GRg16vNzMk3PXRSXNMgb1a/V9VlpcLKLTP?=
 =?us-ascii?Q?Atc743vq6Ss1+Jc7g64SpL3o/k8NbhL/mLGer43DWTqqkxHiQ46u+4qTC1Ps?=
 =?us-ascii?Q?WFCzfzXFo3/JeM/3kh2MjAA+B9rnSF5x3teBWOqXJ3nq0LRZs/gVucD+R4T1?=
 =?us-ascii?Q?G3w2ptDS+SEtq+Kr9EQshPdoG/vhE+GcHVgRrrZQ4PO5qIjdPN+gBgeyvCt9?=
 =?us-ascii?Q?HFTPPpvQcb3fJJufs9GlymSBbk4lPVfhVW/ZKHn7WKbwmG9dB1fDWR1S1anK?=
 =?us-ascii?Q?RjPdu/bRHld/vfbNzdQH3X6AhmoHPVaFjHuwoPwyuxFy20Wnne7fEoFTvvRb?=
 =?us-ascii?Q?EI6x0s6Yso+yJZjXYhvrykcnAErHJl7UOV2wxAAN65cizRxY85yGW02V4O6a?=
 =?us-ascii?Q?alCrZXflBKGuh0CohtOji1twqKKSAUg27aDH8G5Rk65wFOjryLNxxAkYD1hO?=
 =?us-ascii?Q?2gg6WtwkeAG0CK1icvwTo0uzsk+0LjY7aEKN3OfIebDLM741LOyOMvle3ybJ?=
 =?us-ascii?Q?tbem/oJ+jQXwKroCzVxbiRHcdJgecZe5DRJ3Rp9c9Ci6o9Noou3fhaknPgox?=
 =?us-ascii?Q?yXxQ+2UhHeXBbcBLkjPK0XAdVpRUgN9k7IJECOSbUMlbF89kaCl3CMCNdGQt?=
 =?us-ascii?Q?xjOB7hyYc1mr44IAZp25a+9NlZGSNQLzym3Ct9lF1jszJPHsKUFns2kYjMkD?=
 =?us-ascii?Q?2PNVneXPgUu4iKsZZ+I4FOyvRE0m3QLjpUjBKJLpLHgk38atvTK5K2bwCCjU?=
 =?us-ascii?Q?8FzxWlLzE//iP8oZwjcBN+MmnoEJXTLDrbxT+1ROuYL0FDdPQqSZBAj6Nr56?=
 =?us-ascii?Q?o9zD9crPoRpAoOA/TK3zhnQX2oAmGWTImrmBjyITUco1ZtWwK+Ux7Py0rltY?=
 =?us-ascii?Q?vYJrU9KtTVYqi9ys0iT2zi1Jrn+FkQNP0+9PZSyBv4p443WdY7mQ4HpantZm?=
 =?us-ascii?Q?QXJHoUSa/A918dp0NmkHW/FY8KLV82kUQCfGKtGFA3jYYdwLJMoLEoUKmEGQ?=
 =?us-ascii?Q?P0EStOI/cKS1GVGx2ftlcdSfcy2ic0DBZ47RjZ2ZN0HmB8zgNqQH7MSSe59G?=
 =?us-ascii?Q?YD6gTh8n7iWOaQaMjDo6vPZsWIqTWeV9iMqE/GYqoRzqm3+OGUHp/L8z8qiH?=
 =?us-ascii?Q?pvQdurTr/n7CLNxPKrLfNkieT7cic8MXzlctrGGD1GWSOcbPS8dp3paMbR6J?=
 =?us-ascii?Q?sFSDwPP4ZaDkVe8kUP2nxtCOwLKZVaNf/+33CTn+LScQ9DLZpLhmQcmI1bDN?=
 =?us-ascii?Q?DgC5m+ZtLoG0tznrlF8eJXWBjzeS4VcujM5DnzI0TaklCqj5mvadqkpEAzHz?=
 =?us-ascii?Q?FwupuAGr/t418FewKpg8xqlf3TP++yR/bSAeL6VKaSZQgRjnMikXRzNFC+Sv?=
 =?us-ascii?Q?V6Gckc/qHCzCODWXTmGZK72xFpn4snaXPHujiT5I+/xPh6a1HTrZC+gyrxTd?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XprGYuEJ2t9av58KcxdMeQoeifo4Pf9eJpUZAl2WVIlt+wSKthFr7ewnQCDb5VNQluMn+2yCHompvgewQRrzm8Vb58dDpjUsCjrm5mnOYlg/0ca+UCorJILlVvrSTCTzTA+dL5Q7CXff/ZnuuA0tcgebr4QeWF1x3YpjCWfxKlgt818L8spc7sm09+YLNm+hl96opWA9ylDIE6yYFGEoB8gtg185NPlpmsXei422AKEDZ172mQ6r2AsIKnc0tTvMh6QP47JNhKRiRf/i46BVTsccUU8JjaZgzw/HPOhe+4g7k0bKkSwls17Aahec3nZNzaZyDGQzirsjFfI+ZOYC11FrfxiLOkHarSRnvW2/oM95BAfojz4kRy3IXVRxWhT7417/aWHHD3PQUP0dQwXAFImub15txHHk9uf9fgHnaWWwnZ1qVYZYeiMoOwjyL4H5EJ9de3Qy3yUmS+cZx+o7/IzkstoUIfE9HsbXdqdC9NxqvB5e9c0ZYkqh9iFVsUrMxsDpgxSWToCLAth+Q3Kh/YvohXb727bjjhTCD51p4IZPaqFOgYJGmvmFOiUN6HFzgPSl2Tq7DmjMHwWjgSf1xY1+JbgRJR/EdwGVqO/MYQI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fecc737-9477-4873-e50b-08dcea6e1763
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 03:29:34.0717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MarMco1XxYb+t0X2aul+Er63DsS9PAgeH9UyD0yZmJO2jYL5kfguC5nZtMwDvh6ML/QjSal/ILbOeIRX0zai03rtJQgtpmTlv7ojWe3VPug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7132
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-11_23,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410120023
X-Proofpoint-GUID: 9xVTAKqe5Ay5Eus-UWbxhMXSEIF1H4w3
X-Proofpoint-ORIG-GUID: 9xVTAKqe5Ay5Eus-UWbxhMXSEIF1H4w3

On Tue, Aug 20, 2024 at 01:10:22AM +0100, Sam James wrote:
> $status is never assigned, just use $?.

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... and committed with Signed-off-by added.

> ---
>  test/unittest/pid/tst.newprobes.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/test/unittest/pid/tst.newprobes.sh b/test/unittest/pid/tst.newprobes.sh
> index a4944688..0980d3b3 100755
> --- a/test/unittest/pid/tst.newprobes.sh
> +++ b/test/unittest/pid/tst.newprobes.sh
> @@ -44,4 +44,4 @@ tick-1s
>  }
>  EOF
>  
> -exit $status
> +exit $?
> -- 
> 2.46.0
> 
