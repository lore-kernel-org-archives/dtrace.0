Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C59423C8D5
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758641496; cv=fail; b=HMtwl05V29hOxl2AOi+PPCOziiDrFEA0r/i2XHgfANNFnLdIebH3JmHtUi+6FkmA5ZnxFr7TN63XIL5/G22ik/qNHP3bXKgrWngSnDBnmCHS31YP4tH20u2ZP1tnFrXj5nrH2WEMhViI+RhrZ9h1Ma6kXRXFAK29izxLWxfwmt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758641496; c=relaxed/simple;
	bh=6zJ/ku3T6Cp4UDAZJy01y7ENal0Z0R9nLHDqriWn/mA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o4cMBl+FfckHaJX+49CmbzOYJBkZgp77nugjgwFkFbnWnJ7n1w2iliQNbv45wbOYo3dn+S8x0H3JuBmWf2uXjdTt9t9I28Ffoqi1Jb72pZGITdYY0X87hCzhWpSl+HIZUdfgNLSXGQGhIQQo62bECWLkTxglAUHZZG7UubbIbpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YUx5GOL5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=KEgfU3LI; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YUx5GOL5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="KEgfU3LI"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NEavgu004651
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 15:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=JbPrDLLmi98zRJNkzDan8zTji1D0DHOqQJD1KV3a5Vc=; b=
	YUx5GOL5QKNtUBmm5joSAjyyv+JNa5ZG7P4HBXyW5hOQT7CevYVkrwsQ+YrmUbQt
	mloymO/FnYVnolT93TeM10m354X85D8sF4bv/p9vfMbUkmKivd8qomOM+7x3AcdM
	zwBlLJ0GF5VS7w3nHAp72Kzm4erv7vYyIiTxVzyQd0evArLAWV+m/ds40Mxr3+00
	NqqwFhleeT0ihFGITR+wWfPYWODmaNhfIBKP8VNMRlgprK3dGqQoMPF1cpC6tGcu
	8wTezdgWDZ7n5cu5fzhh436qPucrQTM7LbFEruUfVvpCmBu612bQg79ogsrVjuXv
	69tgdtAYip1x0FtSZtr90w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499m59cw8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 15:31:31 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58NEpjAt013273
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 15:31:27 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 499jq8cv78-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 23 Sep 2025 15:31:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKD2xU1jeJk/Tw8qT9X843LIf8YoykZopvZw0yqyrOY3GhxSW/mV10UDNIYPSf0ztee+VPyunQpWJ8sx1KoZYsgZHQ8DVM4jFXYG8O7TFsF3r9+GTydJKZV17B4iVrNG7FztwqlzwNpX1UmkuYMbTUkkYhhAZSd3jncG+NIIyH6s8Kxk1aG0xn/o0VSlBQ043X56BCQruAFgk4e6KJ5UzonSq8qMirBRgd2jvl8CN+vSkDBUOl+kXB9ppmsbE/de4/WwGOnOqUo5qrwpTq63ignRPmYvO8XGr9bAorK+571DUSDPXiLJzW55roCpBVmAFBQ7YbSecYLVfdu/qtVWYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbPrDLLmi98zRJNkzDan8zTji1D0DHOqQJD1KV3a5Vc=;
 b=EKoCNSt+oqXPMi60nxary6lK0E9OZye6MYbWQKdzIJ3lpDrsUzDs4dzx2aRWZ0DovR6orSneKli67H7gBRgLnDFBVtvrXf57Z3+vLnE+IaEyP16/cpM+PvKp+yvcZGFMdH5oXElN4iE55W7MCM2aXatI5Xq1aUzONW93bs41bI7mC79wvx9lMrvQsAcDC761iY8M484Iywnd/berUhaM3WkuWkFRODknIid96eCliVz1QgWCJfmLVH/rGiZlMMI9+FpojXvMjXmtvYgAgVkDKjhfzFB94dq3Z8gOdR723zMSbH4wGyf6XdUeZJSHljBLxy7N0lw+6zRGcjPp8xLWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbPrDLLmi98zRJNkzDan8zTji1D0DHOqQJD1KV3a5Vc=;
 b=KEgfU3LIpX76wp0yjmtgV3Dl4rp5tz+aGeIHB0a8YArcLgEfMJxCOlC2VJmBejpVWQEv5OZN+l9SE1J67Ie8cBt1SeshX5+cz+kKZijXHjBZs+NPuvO0mtuASGI+z+jNwifKxXU4VNrUI4GbHrolEzHf3M7tRcG5qIxweUTRyHI=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by DM4PR10MB7426.namprd10.prod.outlook.com
 (2603:10b6:8:183::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 15:31:24 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 15:31:23 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2 4/4] test: fix test failure when no /usr/sbin/dtrace exists
Date: Tue, 23 Sep 2025 16:31:19 +0100
Message-ID: <20250923153119.109721-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.51.0.284.g117bcb8de7
In-Reply-To: <47bb646d-eef0-bff0-cfdf-d0775154dfa7@oracle.com>
References: <47bb646d-eef0-bff0-cfdf-d0775154dfa7@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0394.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::22) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|DM4PR10MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7a2e29-b1ed-42c6-2fe6-08ddfab6407a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EKJf8DmkE3eaJ6oP7JODhPP1jroGAJcrAk7irMdbk5kL7MXF13DC+zvBpPWa?=
 =?us-ascii?Q?PLxORY70ihVdbPzmRSD83rHDXELP2vlPSAC6Z+GW6PJycpGpyhcVNjKJvYgM?=
 =?us-ascii?Q?qUVWT4zOV/ofWcIWMFYnHCdhaqsbyLJTaZKUriit0UgNilGQ7JVDYXAEuVJe?=
 =?us-ascii?Q?QcQ/V9sj0mAKU4e4k9QAXyIE9TznYbtVHCwIfpkud2l5wVy4yOhnCexAilvo?=
 =?us-ascii?Q?ePL5hLz4Xbb9oMvUikIDySh84OSSyFP4EoSYX4HmFPaHP4kfSE0nXbzEsHmw?=
 =?us-ascii?Q?FhUh4x1yjurlO60ZJFFcl7dnGaNevVbZPkU3rMOAhBK4UXQ25i7E0hlcCDfH?=
 =?us-ascii?Q?u9gCTF9g6K5WszgzYJbMun9eIJqMaV+iqGICytHaPVVjoAxFgUENxkVDru9Z?=
 =?us-ascii?Q?3HtdoxExrCZRaTVU56XgyRhaqXhYGow6ydWxBsFEORIIns2vfwL176Lknrr6?=
 =?us-ascii?Q?gyI6fhPm8LFKclieBT0I2+ugyMl/nsqlDQQURq89tymHJH4UtSBUtb2gIZPw?=
 =?us-ascii?Q?bndYqrrkwTNkeUz+hTo97FsbvHwYK/l+MfVZr0Cu0wk42qavKKTJBXYe6xre?=
 =?us-ascii?Q?cdM5fdtMVIW7k73KqvuNnWKCHh9VNiT0PCa0mdtoozSQ73yhXHpVIHrXSU1G?=
 =?us-ascii?Q?DjswL43WgjR+p5HVEf7B+IDR0pu654KmTXHJGVukIOmu7y3jnTxB3+lpv0sg?=
 =?us-ascii?Q?8zv0+5faE8rbIYqKem8QNJrz3gTrKabu26tD07iItTjqkrkPnn2/ah9myfaB?=
 =?us-ascii?Q?657tzSzVyKAUwVMxuP0Qpn3PAFnmRva1CjEKXw/stKCFxxm5j5uZeeaHQog/?=
 =?us-ascii?Q?R/OkbnMyD113KHvakfrYpEtpBT5phAvWp3NQ7AAXkjetnkW6nHR1u0Z87fBl?=
 =?us-ascii?Q?b4UwkAcYVTZv2VLQgEaJgEbopJJq2KBVuBCsC9ozCfTsm/0/w2LGLgX3ZQki?=
 =?us-ascii?Q?4gUoe4W+veN/0K2se8N4Fq9Z4HYmfkcFNra7r6XXzZngJYCYupUEhPghgSnO?=
 =?us-ascii?Q?/e11/EQx/L0aGTYPMJbpNWPlf1Ojw2VEFNHdpZeFn/YCO9jR38yCxPW1Nv30?=
 =?us-ascii?Q?0KuRoC2XMadzo9g3+QQFUKaucuMIsVYFKqvF5J+WfM/+yFiunHwBgppSZkpj?=
 =?us-ascii?Q?FM03GhSTerHB/Z5MJGQRUxWhPB435Vdp3S0HPvt1UiyJhP83Zet6shfx4+Hp?=
 =?us-ascii?Q?5eigI+HtUAJv5I7++a0YQuUhINxk2s5UoZcuvmwbO+TdYEIJwX71yn4e/Ljp?=
 =?us-ascii?Q?F6jd9XUyfD5OtghIid4Aw9QC+1zEV7fxAawzD8ZpnHa/nx+MPCe5YAHPd2vW?=
 =?us-ascii?Q?Vv9Wzifyd/URWhmqpNjquUHuubK842Q5BXYkDXKV5oXomKNtggLMMBZRws3i?=
 =?us-ascii?Q?5Fz9Ds8kC80emjPR6YsUX+gw2gz+L9xcqCumhSly9bY6PZ4X4U8Qcb6NpG9S?=
 =?us-ascii?Q?z1uoWn630Yk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?I/Jvf/VN/vYor3Wm+3MKlLCFd2fVWRQiQc7l+8IUeRNCUw816en+KHgI0HAI?=
 =?us-ascii?Q?Xu5dKND66JEjTplTLBTYCix5TQSMK3wEgGYe75D6nWt7X310ai7cgAy+uf2T?=
 =?us-ascii?Q?DHG6TFfbJ7YYZaA70rQHmEUx6xgHk7cHSR4ZaKaIlg9Y6HEHOXYDJuzmMxQe?=
 =?us-ascii?Q?yqycdmm5zJg/2JFKTtf7IjobHE5Hinkbg6U/V56LrWBg5s+FLLfBxGOmbWdU?=
 =?us-ascii?Q?7VAdibp2iVs09eDW+5V7JDj8eqU91egDQexQTR8IEl2RLj6TTU4aEHc8Vfo2?=
 =?us-ascii?Q?Op7G3jQxaJHVitK9wy4qHQLgrKb2Y3PsBK68YHhC1fMw/AEPF5CQLVDFIRNf?=
 =?us-ascii?Q?ymbuncazIb9B7dHAfvRpMw7lirNVJpD70Gla2yTRGPfvOtSXCrfc7X2ir21f?=
 =?us-ascii?Q?Mbm6usbqcOGWjQhiTRMK+X9G4OmY1HVUXxDieqAtFSEbS33Vb+GbKKd/NSPi?=
 =?us-ascii?Q?17NPPTEQ1QzH+jVep0aufr7W5/Sjg8ALL3AYGw7wZhzfBHi0t0Ak4AgcHL18?=
 =?us-ascii?Q?iBQxG/hbvQARI970V7uyDvNG7nHhrV7pdC1xfdnO0neR6/jF+YJeWVO6APrx?=
 =?us-ascii?Q?0AdqSKIIN0R28KEmHUhjIVsN0huzj0S7xc7iv7W9X/7i/D/Jlz+TQrBSpNTu?=
 =?us-ascii?Q?CzS7/FicH/v+YSvLlm7UM9eBTWnyRynlD+uQ1iQzFQiNXtJtEz+CqtXlyyjv?=
 =?us-ascii?Q?e90ggLaKjAPWFJ1Ii8yafx1nk/ANyitnYc3ab0JhqEM3gxXwOS9+4gbiUi1U?=
 =?us-ascii?Q?ei0uTLh313ZNXTXvneTMlhOJEqbzMzKrFj91B6WtRyK3s/28iosaxryIfY3T?=
 =?us-ascii?Q?/n82JVWzRp2G0N1k/gP4dQ5QR4qIiZMGFliSeni6AuMIxRWWouFCaa9FJjaN?=
 =?us-ascii?Q?PXwwuyh9a+hOsYP1t8HzPVLeEo5wH/dEtQt7xyKbo5pErlSnltRvGx+Ag/bs?=
 =?us-ascii?Q?IqdKu9oadCh2eXmDQEpUV/it9S+LD7cNzMCbseNx3ey1CK5oLov5TFSgzeON?=
 =?us-ascii?Q?I4XSxOruT6a6FtXetN3axSBx4B1S00EIVe/0HsAl6Z8zDKc+EnKMwmzI2PTc?=
 =?us-ascii?Q?LXFCEFqZGsJBW5P0Owj0IbywIsv83g6WrCI1iukAnyoMXm8oEE1wXfFK7omo?=
 =?us-ascii?Q?Q03EOKCyIt4eT0dU6HG02kCR3A9EyAmRdKRhkYh9kE6GPjHCElZcuwTc63ui?=
 =?us-ascii?Q?SezsNcQk3zRRcDVekG+2VEMtU6k26WulussnghsVrKteEo/H6dY9Xmo2vMB3?=
 =?us-ascii?Q?4iu7RmvJqD9busWkSBv1fpRzSVyFyvGIu9rEapcsGGlA8LEp+Wj3qcgq7Q1/?=
 =?us-ascii?Q?dBEoIFDuxoBQimkIWCAx08kxPs3gx3B01PfWoJUyk8dzpHMUghAqU+Lgvv6F?=
 =?us-ascii?Q?Ju+9rO5Z1G3GVESpNZ08HIeK7vSJ39x1rcZfbW8s9wRjYlZC1LRt4AGX5Lqd?=
 =?us-ascii?Q?62RfypkpjgkjXuOB2c94QvT1PgZL0k5J28ceHbizXD4bJAaUiyaUkYTpKvYh?=
 =?us-ascii?Q?invD3M7O2TJakiyGWl7Ei3A5TLvTwhwjliE5/WsKH++SNOFy88o6DhPAi/S1?=
 =?us-ascii?Q?MzAXzfjtugvGVfJ4XcJ+JHGSSTBf5afZmhfOxb8qN0OffEtx/FjPRdWNsgkN?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zi1QwgRmkUNMx00+eHwjiPkJHQhcMEwQwJtaNNuWZc0HggaldsWn76nPKD1CCQOLzm68h5p/hfNWzX0GBoW/SxNx6sTSzArnhkWplyf4Khr4r8mxlCRJSCebZhPF4bXC9OSXdgO1Y86/H4Uu2OvugJbCRMheye6tk7r8/NTnSjuEIYm1GmGI0/7fAxJUUPTtyDwHrCbffyEMo8zWiQ54pFUgszM3fwpYn90CzbSZm9WWvoGw6FvYMeuE6wNa5KuGj4GWeOvI1Jx6iMV3FBlOzBFhiKxDrWT8DD9TW40jE9t0oG6W4xSWgsTbiuPtsIUU9ti1o1TQrTtrWxhXrdprlGS/+Jqz9J54zh3nRYfk70Y0Ma/kKr2NxKJManfyuCnS4VCWQe0VUb8qryt9lFXTM6/rGIj02DcYVl7Ycw3rWugLPfpP3/2p26fdjkxeAZlZHTJWwtIKt9nYd3dV23zPtmxPSFZXd7eXUwT8ieuzwvOUOyFj5kuRhGryIgH0G3pEjfHmT2euv7uVos8ZW2hZgzfqfvVhdta+GBt9cz7tTzQQBd3TMqF276lw/amLwCWmJjxv7unZnoL1kK46hp0QPl9vdIjMV2CRzogS6trrrIg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7a2e29-b1ed-42c6-2fe6-08ddfab6407a
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 15:31:23.0750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tDXGK67tQFzM27bbR1NwHOr1Hgc1y8kTfjH9FZL2HUMcLPToTKHcVeXaCP6BqmJFBeYXlub5IqhZu7XHydAXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7426
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509230142
X-Proofpoint-ORIG-GUID: PfXl0btMkSjSWAEV0vBbBZptjaWMywKz
X-Proofpoint-GUID: PfXl0btMkSjSWAEV0vBbBZptjaWMywKz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyOCBTYWx0ZWRfX+fp5PJc524qv
 OyqA4nFk0eAgWHTYEWEbsuoFdflYlMQO/nZGX9g4T2dX9AL5tNGTOxubwlPnrZ+NciEwvVoosQh
 APnaNmaxABfeotgDqtv6DZ82cFu+d+rhq7lm+9yiRPQutICutCp3GayGoSHpqPtjMopiLSm78Ut
 1nJWanxEomrKL7H21f6WAVPN2EXzza2VXNTaj+LmasUnpnj9G0b5RaZL4PgKWNw3NkY4MhA8QF9
 VWEj6nS3jgbYYz2n+7mk65JGs4OQykoPOqA13ErbWU7BYzH/e1tZgttyPTAlNh04FAU4BppbtOJ
 DDgwr66BeeIwWQzYekMwNbkiJCDVwRrymrbmIN/8dFK2xONgEZupXNDC3tC+ZMnjoXDqI15fuba
 FMZYURD6F9qeTAVqcd45LefpPXIorA==
X-Authority-Analysis: v=2.4 cv=HJrDFptv c=1 sm=1 tr=0 ts=68d2bd53 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=zj7MPgeaqOmcQ1_OYVkA:9 cc=ntf
 awl=host:12089

A missing $ led to this test spuriously failing in this case.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/unittest/usdt/tst.exec-dof-replacement.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/test/unittest/usdt/tst.exec-dof-replacement.sh b/test/unittest/usdt/tst.exec-dof-replacement.sh
index b7ec5f2dc5e92..fc04c61d231a0 100755
--- a/test/unittest/usdt/tst.exec-dof-replacement.sh
+++ b/test/unittest/usdt/tst.exec-dof-replacement.sh
@@ -33,7 +33,7 @@ provider test_prov {
 };
 EOF
 
-if ! { $dtrace $dt_flags -h -s prov1.d && dtrace -h -s prov2.d; } then
+if ! { $dtrace $dt_flags -h -s prov1.d && $dtrace $dt_flags -h -s prov2.d; } then
 	echo "failed to generate header files" >&2
 	exit 1
 fi
-- 
2.51.0.284.g117bcb8de7

