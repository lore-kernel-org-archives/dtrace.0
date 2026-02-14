Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9112D0C82
	for <dtrace@lists.linux.dev>; Sat, 14 Feb 2026 16:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771087193; cv=fail; b=s/zgSaDeK306SCBky62VlHY1uEOWbRlR+r1aL/7v2DGibRag5szr9MoZFnZ/sSHCOxS5uURUujK/zBLE+P36clO9EAlKK9x4UqEu1VzATFLiIZtgntBx/BKqLGf9CbWDRuVdfzIP85hrnUrKNDt6fcrUFV1ghdzsrcRYwGOBx2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771087193; c=relaxed/simple;
	bh=YpKLHnFoRte7TPEgtz60AjBCphnds8xZo73O6y1zk+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=i9Cz3mfhj88wv7Fg/J/bORd5HUfqpUhCz5uwLGkzxGdTk6LC11QCWG2mixG6ZjLFqSrwX5TLxVOTzE/o3Dl9RHzAQCWsE2qiM7kZBSd3Ey6PJrAh6pRnSri2GW+64LF9gWETfkSbh9LOLU+EVpHrYuGOwPPzvWvQyWwXFuPaK7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GRbrM6Jf; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=VuhAf1tR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GRbrM6Jf";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="VuhAf1tR"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61EFPxsY1413541;
	Sat, 14 Feb 2026 16:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=ZB5Ana6bZVAStwgLEi
	aBnbjG1GZmyI6Y8J9sojS813E=; b=GRbrM6JfA4VIc3iBzVp0CpIOudXqX9llev
	cg4/N+SrJMy6VbMCiSZrzHW4WukCGetFvDZepmNAT9yBJ/aPSbL44wImMRjpXGdb
	YiXXe/5OCoFqZ7c26LiTbzJTkn70sLkBGZ3OyypOpDMhpxABr6nDVBGTdoTj4ThN
	EFyhYNwxdwDOBHV4G6tMN/zwYJ5gC6JF1Wx0wT04ItDzkyjt8wCULsb5SU7iYwRJ
	SXOSS+O/mIJrqhDsywwaitRKjcb6FIpJ/uPy7BvgXSnzO+k6FM6vbZ9PaE7huxD8
	sKJFP5Z9awfEbZL8JyIzYRlYraZno2OrgqyAaOseecbwYqKoAcSA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj04095a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 14 Feb 2026 16:39:43 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61ED3sPG033957;
	Sat, 14 Feb 2026 16:39:42 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010063.outbound.protection.outlook.com [52.101.193.63])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4cafgaxqrw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 14 Feb 2026 16:39:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qk7vwtJO19RrxoPl9uHg98ImOAZx74wmqG41IY6MGYpO6q9z3TE2IGO7PKkj7idlxU4R0WAhoK8aEeRuuYEoqLpcB3om3tagm6eFCcyQRRNwdN9WyHjYvAwHqCjWDXugD2oc7Vfge4uZY67fwUjD3epTbSP97gXhl9b/lk5k3O16mysnLiiaovvQeV/WTxnC2w5unf5/wWV0xrerVGxPqzD/NH1oZd2U5QSO/LTWgSW7g5H/Ido7tn8g4HExmQWPcfiByOHaW16vfkFy4/5E94b03RqxlzlY77G3u90xYClZ/yt+nW7ghDCLkfURBdusNLiZ+aATa4rqzfzODFjLvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZB5Ana6bZVAStwgLEiaBnbjG1GZmyI6Y8J9sojS813E=;
 b=K6b2dXhpR/o0iBBTACrFLBtCq4nfjezeDtqz0wvXoU3qfymHtR8rKcwPoATO4jgHCK0HFwj0WPg98Tn5klxeBxgFV62JuRl3JKZJwiJFeyldkwbKiOehOrBVhmdVV2Jm2upuiA/LbzMXXwHeG3neRu5DC4NpK+4BX6wKbHV99UBPi9xeFDy+AurkTtqjPPoqgVqMZpaX+18G7ECMZO27p/lcoQqJuhbafTMFZQRKp+4UnTlA5EIMaIqdN1fblh3gavHziV73m8u6SlgdNGcVA1vXlunyLnZIQ1O2bwLQBgScuZ1pkYccl2nvmXWvJIw1Rzet7McCgxn4xZs1mp1PFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZB5Ana6bZVAStwgLEiaBnbjG1GZmyI6Y8J9sojS813E=;
 b=VuhAf1tRgi5occPrJgiD2dzc13pg07gofbEsaKwxSDOFpRCeXIxy4yaRlIYxshXB7l6CslQbJb8gbXZr4zthBkuZDIuXen30ofmNLg4dVfKmVifs5w1vIoXq+Dvz4KJp4cK7bekO3gwXv95WyrYmoVXv7Avat6H1wVmVuoc2Xt8=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by DM4PR10MB6815.namprd10.prod.outlook.com (2603:10b6:8:109::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Sat, 14 Feb
 2026 16:39:39 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 16:39:39 +0000
Date: Sat, 14 Feb 2026 11:39:36 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Sam James <sam@gentoo.org>
Cc: Nick Alcock <nick.alcock@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>, dtrace-devel@oss.oracle.com,
        dtrace@lists.linux.dev
Subject: Re: [DTrace-devel] [PATCH v4] Add packaging configuration for Debian
Message-ID: <aZClSFDq/mk2Pqjy@oracle.com>
References: <DS0PR10MB752255507DE8C6B11F027AF4C262A@DS0PR10MB7522.namprd10.prod.outlook.com>
 <87tsvkn0ai.fsf@esperi.org.uk>
 <874injxxco.fsf@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874injxxco.fsf@gentoo.org>
X-ClientProxiedBy: BLAPR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:208:36e::10) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|DM4PR10MB6815:EE_
X-MS-Office365-Filtering-Correlation-Id: acfb7dab-0d10-4532-2f62-08de6be7a55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UdZfplbWYr5lLGxVYsVWv804/lbmLUltVAIQ4cgwWXxvAfFsVT+kmClcLLnX?=
 =?us-ascii?Q?cKceon5Qs8PWMqc4/dfzQwUIYz2tCZU4EzXKxbe9SICjNJDO9/ASNvEIj0Ga?=
 =?us-ascii?Q?s+nJwLwMNahTl/7hwJnhtlHEzYHybLPA4wCH7LaNHJlTz7XwY8OxcizQDYPQ?=
 =?us-ascii?Q?/ROQQnDmk3kUUqW7RXQ3ml9pkB6Nxl9jndCX7s5vH+a2Ao0sEU8ha3I7KCeX?=
 =?us-ascii?Q?2TSStggZQM92kEGwPY7ZaZzXVz4pgubFexHflRLv1RZOT2rDCMV07Y2HELo0?=
 =?us-ascii?Q?WgOtalBRZQzLxNMvy8mBBV+q+t7Rpm1BWWNSGpYMMWgN6a8zXpp+an8vhzl8?=
 =?us-ascii?Q?hdfKF47GXS7N7P+nXMT2cn6VF0GnRQp8GBv2fGK/PctKVbcBOOLLHrHBBSac?=
 =?us-ascii?Q?UDjcNgZj6S1icTRGj238qiC9c9bUIqJoc8fyW+2W76IEnh2LLzD8u54TGJkC?=
 =?us-ascii?Q?4P9TnNMR04exjsgCGgsWBhM9ydN/3OfDqTr2hPkE7rs2U22q0XiZeaI7A/K0?=
 =?us-ascii?Q?m08wqvk0piVip8WxwDaTD0sLSVIZvR8zsla63utXTRf3+d78eXroZ1fmvEft?=
 =?us-ascii?Q?Bt5FXYr4BsYe3S1Pq0NhW8q3tpH02rR6nqFEMkfJzOI13tFcpv+BoA4D6kU7?=
 =?us-ascii?Q?UVXGuTq2C3StNPhdDModIBuw0n2y4tsnoa/k0jfPWPNFnBMwQIrNEvIM6Dvz?=
 =?us-ascii?Q?OaJlujWlkgnlvLaRQhFGv4o6a5vyBsAe5S7jz3omjOiUEfi2cKam7ddtnRKm?=
 =?us-ascii?Q?rKOS8yG5KrFeNUAS4rBpg7LLKMIX4S2ELh0bKE/gsN4vEWrJh29T7MRge2CM?=
 =?us-ascii?Q?qdKm7FTWatJ9fd7dQZG4C0uB4KqHP+2Mtjfrk5WjI+d2XjXyDl8I4KnYJqRX?=
 =?us-ascii?Q?eJbr+2VHOdRQjk/xx1U8e47w5NOw6hgERwOGBFTIUgirdxKi1QpgVBmXuORc?=
 =?us-ascii?Q?m6w3RMwlTBnakoG2m385nABXeiwQFYHwjLh5udnWWy2DlLsIV7HcaKw2mX36?=
 =?us-ascii?Q?TrP1lIkxaUfX7eK0T4FbBxWixNwBhgn7e0EAEuufUIliB/dTlZtKKl8OzH4K?=
 =?us-ascii?Q?5N+pNNzl0weP18/kkwlHDecYcsJFAHGOuHdNSFutRjSliZuc8ai2Xp3PmiHI?=
 =?us-ascii?Q?k+PcOLVvwrVrxJWNbqgUoxx4vcc0sOt+zmoE2nW9Oj7ZugTOp/0DvnI0Fk+Y?=
 =?us-ascii?Q?37vOXSDskjkVrAsNTSs9CCKscfdTM8tmKxVa5q7cdt0Qq1QCiHMxssv9mLG8?=
 =?us-ascii?Q?p39OK8YtcuQ+BUrZ8pbkFGCQJboojVK+z1P9eagMsQHAKyqVFSWWA8TqIYO2?=
 =?us-ascii?Q?TujjB+BHVf2qeKDo7c6fZjVQVsTrN4I5cJf8gZmWxBpLjEqs3/0nz1sSb7QL?=
 =?us-ascii?Q?IoPSVSI2im+Id+pmEyoSx8P3ulKdQfXCa7baHD2OhnWd5Jbu7Adx53whkqaQ?=
 =?us-ascii?Q?QX6rkoJXTuznbXEK2pUCIGj7e5OV31ERFD/6qNYiphwVY08TJPxeFtUTChUR?=
 =?us-ascii?Q?lkILhQrZbOKQB5k+QcnaSqEIMnJEbJmRB9ym?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/pbguRdvT0IJHjnVGypQvY7Ff4DaVW7oinKk9sItL3hbycLd0zNmmpTQxfu5?=
 =?us-ascii?Q?WzBjOwYrbYCTgg67DhAnyCSPWs2pdYHxtC8XdXqgDq1hpZk9A54zijVYImv0?=
 =?us-ascii?Q?FrgIexaqBO03Kvmjyju+/LTHeKqF0QPSF+jUgSMCrlws3X0Y51Tp8uQMKBT1?=
 =?us-ascii?Q?adyR15VhXquUKUovW6RXE8gHWSK7ljrZIFb6vDU02LBV9PZ9cF5FRUrJnqKl?=
 =?us-ascii?Q?aCXYrFnMRSj9ykBUfgVTeEUfKeQkxEzabI9TAgxl46oTF03APTAB+vmoULMe?=
 =?us-ascii?Q?U6Q+3xrWU1ynFoGTuo2VGUk0HQLT5ftr735MFqLwLefZ8iTcuBpvEvNb5f21?=
 =?us-ascii?Q?Z520PmurHH/5Km7LsULnx7sVfC4+Ts+OeEeLq/LZVL6oTm1jd6FgKKbobOp4?=
 =?us-ascii?Q?FTloLqOQRV1XGEydn6BkqrbSaGyRJEb6Cba80KOyzYGB0Pf/Ev4xfY7YKT/d?=
 =?us-ascii?Q?Mj8cO591jxv0mzkRDVrX+ZoZU6RvHDHQSWP9NyxBg39sP4yWE8Lt0CnLfy6P?=
 =?us-ascii?Q?MYwyxJASL3EhBD4qGAUIwfR3JvUfJMxVik0bySMtj3Updn0L5lf45NOUD+6H?=
 =?us-ascii?Q?iPACpFE3UBYBv892GBLXEDf/kFvQCZ401lnOWMxoI/IOPeITdCEsWbxPeqZS?=
 =?us-ascii?Q?4z+1JKjOlFo3jLMWDn80I6hf1gJne1kkn4xHeQm808v3ULfQgWNxMVFphKZi?=
 =?us-ascii?Q?8wv9TBig72XnpBhZ7Ie0iogEJryx+Ho+QJReIHOlmw8X4wuq7bw1LtdRcF2j?=
 =?us-ascii?Q?vcwcIuAfyJ8vDrIg+9b58HtxGiBOF39O7ysIARyOoMBvzJQrQpEQgAZean4y?=
 =?us-ascii?Q?qQ+83scc0rabjvQhBGWDq89bXYH4T11XC1bokEkvcFE1JcJaoCEFoK2EgrGu?=
 =?us-ascii?Q?L0d+YPAOtxtE7Ium1Tm2i8B2BMxRDsPM58wAHtHxmtWFZoYR/j2tzKw4HXWD?=
 =?us-ascii?Q?1ca3+g02vIYj9u0j/ymU2GTg5Sd1IYBpP02NJTOv08flnruSzWS/nhuB9xtx?=
 =?us-ascii?Q?9jhRhJOE1+8BwuVGPBoR40/j7guFDJBXj9vRUP7SN5hm1HpEAoXNd5uj/gsS?=
 =?us-ascii?Q?26MSZ3N/gvTEPCZsA5i1c+znxum3o2kOaDu/Lcn8A0ngB0SPT4ngmNuKF57R?=
 =?us-ascii?Q?2cwQZle8NXXWD9QUovnHmzvyIgYA0xjYd4sQ4eFUvu11v8/iNj0a5USdZS3X?=
 =?us-ascii?Q?mqkvXr5F7ZZ07bdojlMIEPN3r0VBsHUrfSrokB3RbFWLf8i7f8pVB7ODgfbj?=
 =?us-ascii?Q?7Rt5j/3kPjgdQ+NVtZMopx2xFU+nO2q1o+LbmpttqP4U5Z3x1WiO+LmJdu/E?=
 =?us-ascii?Q?Kfr6EY0WXJvFrdUncFb6OQ/v8nxNeAMGbSPrAAZFZfRB9Fl9OkoRBdUtahVn?=
 =?us-ascii?Q?tcOoWWK5IBx38GjpbxXxJpwbyXz5ijME1ofAQksjclP8m8rSPyQocH63DSN1?=
 =?us-ascii?Q?SjdHAMvP4hJA/V5p6bWwSneub3ZuwP5Q/eWqupBABsLgU8TR20SVu43+ol+U?=
 =?us-ascii?Q?d7/3wcSzcJGUi6PGqWIUbJXptpmfLnJTrqFoK1AMN6yaZWiUy+mUwiZgTVqu?=
 =?us-ascii?Q?7FLA25KE1LEZ0vZcMn1fj8x96dZ0UXw4zJ93hdxAEE/tM04edi0IYJdawQjq?=
 =?us-ascii?Q?Pox8xSLYhCMzSZVUqvj1q9VkeCUcH3X6woQUQRgf4HrpyNNdHo9PupBN/XUC?=
 =?us-ascii?Q?hOWyOM/m9jnZxKCfGw9HC2dV6CUaAl1WtRoTtR2svBtVoNhqFI18xjFP55Ug?=
 =?us-ascii?Q?j9gBNXSVBQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8ozhzi8tdfoZVd7JJ4XsBQGRP0o2VJuwZ+t6yeUyDj4C4Ay4OsHxl37NuVlyTwq7rYctn99prbrKaSmqQINpoGEbb07bjdnD/TslY03yIKm5dzOwurcl98l4bXAwWOD0tqraShUxmL2SHskn9ij+ZSnIp7T/aoh35PE7R/ue0yiD0s042JB1rKKJuUimYl20oNDabXe+noZHqKkETXtbdRl+V3wvpnXqcHQhoJgRLDNq54MzSh5fuZFICxHyyCR5iH30v+IrPcPo8L9B/hrU+klJ2O86l+U8rMWcuKwldGLt0vaHcQ6ixVH1wMVmXoGpFD6q6qjIOATeH7yVDFOCUg//0AYH1k9eDfkcofxbtEWyKeGhDdhx2ov5t6E1pFstPgLZeybeko//ZE3KOJ7oAgjjW+aOuKjCS3yxhYGkBokxKcZeNxMqX/EP3mDk5LsgHM5JkhcJO7c1LvMImMwRzsgrQ2+cLIMNXGfkH9SlP13syoJfcIJ5INx9VFERaUP3yeUbRg+wF8ToWDPVw8gbu44ILzlwNuYFBc2mzSCyRRUaNaeskfLI9SAotMScGAj/0Rixiopiv1riSOTX8jngWtprwN8HMOcIMNpCU2Q5d18=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acfb7dab-0d10-4532-2f62-08de6be7a55f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 16:39:39.0256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTktTAuM2xiHYnCrVzqgQJbtjZaNbF4XSzInfqwQ+DgLpGXsvqB9g6vrIpbR+oe3hkUMcb9sHqlI76q98TtU6Yqhni6y9A0t2Dj1b9lASto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6815
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-14_02,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602140137
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE0MDEzNyBTYWx0ZWRfX3imx7BPdwLmO
 T0io2ueMokZohHPa5AMRpZgN702LXdt44B2YNNfm5W3YXaDxm9tp9mMaXBnJhmBUL0mMoMZI63a
 3Hc1lGgiiAC8JnCWiZrM5II21TOREhAcpk04VVBBowBlFAUPYhahp0XxWQOqOMkXY1ICU2Oke+t
 Lrf0rL7bbPKskG4Z1aq7QrLRfzrgv4lgX1hdjKI9mCX3m3E5iX2PVS3BGqEy3DwSI5/jMedFC58
 v0Ti9uGYQS0wGC2rXp5DLF0Iwz9n7sjJgZ2nARo33nWxSUqdYPuV9Qb50eKzmX+/3OWjrvVh3Tk
 gwBQDPCQCV+d/X+Um5OV/6hY/PbEm9fnh4j9v/g901cBUAsG4MuqC7Snv2e9SeLyeH1cDAdpjfY
 qfG0sZ9cz8Q3GNsSrtQBg/oUo51Eh7Rybn6cdFQP+yWvv+USBP4U6ApyizjP5LCAdgf6xNvPwNI
 oFWZ+M+3E157K+jH0kzAddFvgVKUXT5GvdVZxOos=
X-Authority-Analysis: v=2.4 cv=O+w0fR9W c=1 sm=1 tr=0 ts=6990a54f b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8
 a=xD7NpyUv1j9wQAwvCyQA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13697
X-Proofpoint-GUID: wM5Dupeu_M9ouAqbIq2yJOOxQdVipq58
X-Proofpoint-ORIG-GUID: wM5Dupeu_M9ouAqbIq2yJOOxQdVipq58

On Sat, Feb 14, 2026 at 01:34:31PM +0000, Sam James wrote:
> Nick Alcock via DTrace-devel <dtrace-devel@oss.oracle.com> writes:
> 
> > On 10 Feb 2026, Kris Van Hees via DTrace-devel outgrape:
> >
> >> Packaging configuration files for Debian are provided in dists/debian.
> >
> > Nice! Seems to work, even on Debian stable (I was sure I'd need at least
> > testing, but no!).
> >
> > [...]
> >> diff --git a/dists/debian/patches/debian-configure.patch b/dists/debian/patches/debian-configure.patch
> >> new file mode 100644
> >> index 00000000..d4a89bb9
> >> --- /dev/null
> >> +++ b/dists/debian/patches/debian-configure.patch
> >> @@ -0,0 +1,17 @@
> >> +Description: issue a warning for unknown configure options
> >> + The Debian build system specifies configure options that are not known to
> >> + the DTrace configure script.  They should not cause the configure script
> >> + to abort.
> >> +--- dtrace-2.0.4.orig/configure
> >> ++++ dtrace-2.0.4/configure
> >> +@@ -172,8 +172,7 @@ for option in "$@"; do
> >> +         HAVE_VALGRIND=*) write_config_var VALGRIND "$option";;
> >> +         HAVE_BPFV3=*) write_config_var BPFV3 "$option";;
> >> +         HAVE_BPFMASM=*) write_config_var BPFMASM "$option";;
> >> +-        *) echo "Unknown option $option" >&2
> >> +-           exit 1;;
> >> ++        *) echo "Unknown option $option" >&2;;
> >> +     esac
> >> + done
> >
> > I assumed you could just stuff an || true in there, but this is being
> > invoked by dh_auto_configure, so that option isn't available (plus, of
> > course, if there's an actual error other than unknown args, we don't
> > want to fail).
> >
> > Maybe we should just not exit with exitcode 1 on unknown configure
> > options, only IIRC Gentoo actually wants us to. This may be the best we
> > can do.
> 
> I really doubt this is the first / only package for Debian where there's
> a non-autoconf configure script.
> 
> The real issue here is letting whatever Debian machinery that calls
> configure think it is autoconf. ebuilds do the same, by default econf
> will pass things assuming it's autoconf.
> 
> I'm sure there's a way to override that?

Well, while the configure script Nick wrote isn't autoconf, I believe he did
make it accept optionsn autoconf's configure style and naming.  That said, the
script does not support all the options that autoconf's configure scripts
could accept (and that are passed by dh_auto_configure).  Hence this patch.

I guess we could replace the dh_auto_configure invocation with an explicit
invocation of our configure script, but then we need to figure out all the
explicit options we do need to pass to set various paths correctly based on
the build system configuration.  That seems to me like replicating work that
is already done for us by dh_auto_configure.  None of the options we ignore
are actually relevant (and if in the future, they are, we'd need to patch
our configure script anyway).

So I would be inclined to argue that ignoring the unrecognized options is not
a bad option.  It reports what is being ignored.

Alternatively, I'd suggest we update the configure script to actually support
the options that we get complaints about right now, providing an implementation
that makes sense (accept and ignore some, accept and use some others).

I could go either way here.  I don't think one is worse than the other, aside
from having 'accept and ignore' cases feeling a bit less ideal to me because
it hides the 'ignore' effect (unless you print a message we're ignoring it and
then we're back to my current solution anyway).

Thoughts?

> >
> >> diff --git a/dists/debian/patches/debian-interpreter-paths.patch b/dists/debian/patches/debian-interpreter-paths.patch
> >> new file mode 100644
> >> index 00000000..58bea538
> >> --- /dev/null
> >> +++ b/dists/debian/patches/debian-interpreter-paths.patch
> >> @@ -0,0 +1,107 @@
> >> +Description: fix interpreter paths in tests
> >> + Lintian prefers /bin/bash and /bin/sed over /usr/bin/bash and /usr/bin/sed.
> >
> > Honestly this one I think we should do upstream. I always thought that
> > /bin/bash is universal and /usr/bin/bash less so.
> >
> 
> Yes.

Done.

> > [...]
> 
> sam


