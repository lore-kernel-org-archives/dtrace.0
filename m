Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3F81DFDA1
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150356; cv=fail; b=CL2QHnvm6jU2FuYGwCuWZPpqO5Cq/gGmk8BivZdE3tYuHK4VVAhOv+lab/Ao2jEsHyEs81YwxZIDsELuUprE220T+d4OexO+HCEUgNhZB+IDlazAM9IdfK+f5bpg4hiE4G8oW+GEmmFq1E1g9fRz6G8e+EaLS2+SnrO7hoLnlug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150356; c=relaxed/simple;
	bh=m+XjKze3yJGFrAenL8/CIovpcxA1mVdgFbxe1Iv7vmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Aq4UAMC/DQ4OzJtx0TFeH/KTNHjlXrp65f2b0mWd3QR0x2RkbamMmgg9oGFZSmZ4/PadEXA+1QMcUABPR274a+nmF4bDmmcS7saQxlJlCvNs3Gk0O+2oYbdrw6Zp4FVaVzXqNVOPjkH0dGeReEJRsgur+FCo2AnyIMFeuot80Yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F9WpXnqb; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=k4M3pugt; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F9WpXnqb";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="k4M3pugt"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKtbfg024240
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=cXIksa8aICBXUAbAwjJ8jwvs1XRIWoLXBX49jpfb98s=; b=
	F9WpXnqb0/RNNpULL8AksoLa/yzlt1xNWed3USzYCI/XH9gaF2HKzKacuvA2niNL
	5kkQMbO8CL5l/kqoYgm+LtALLcf9AS9G0rGEh8battzE+/t5Fvt/nIAp6U3n9rz0
	KWacWfkaOzB/hGSonVZLwjWICPaJY9W4kuh/MfXAjRLVQe6bSZ1h25+27HUmfH0L
	AmEh4/1BTikdpef5ejrTZPkjV3gCV7RNzSNdHgqhL9v4P1h+0W5Z9VTcogGYjIE4
	qF1SQrXtlQi33sz6kHPTfEPWETdnbCk69iFZ3G/p4j2kHXb/13UtsP8i9QB6Gtz4
	YFdO7u3CsimRd47tCJnfWQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42grgwc0eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49SKxKvI034871
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:09 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2045.outbound.protection.outlook.com [104.47.70.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42hnd6kf1c-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 28 Oct 2024 21:19:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C69MgACASnjEPPujulUSgKyBpZ52gkudQuzWiLcT8A0s9HLWWG/PARw67jtkJQDfZqo99fTLsu3EbTVNF4Y1J2qVcOvQTOOLWDudXlf2/qdIbsmzGMsl9cKPhb1ot0doUS0G5b04/VpGTvfBkRolTRC9r/iOC2nVeUxGhSReVnb0rzbYQ947poKTRW9o1hXgylGvEjBmMZc09ul7/Iu9QROototyekJZ3TO6zCNh6//jicy9GaxfqJy9uPmUAlRlMQmH8QV7KXLrzVRNOBlQmtXSXRmnFcn9Hrjhwn9ri/xy2WZVHePAmpi5ngBY56+YajvtHvUPJTrnsHGNwVwhnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXIksa8aICBXUAbAwjJ8jwvs1XRIWoLXBX49jpfb98s=;
 b=Oz9wc3j2VnRTUDVdIz7C2A2xlgZBz3KvZW1Ot/v1mKGrs1xgoFqvbbyHw7iODUB4kfVd/uBAZhBI1/4RF8afsJRZXBuQCp+wb2hRpSQczcLAl6kvehy96FFIfshsSiAXB1RLaQgJ0Qx1VhI1SIB0LZDfr+rBgrXWpXNjiqJHxPufxVcB4Hkg7obN6ffvAYbYWMgBytQYihY+SrD2G+ba67f+5PJ5ZImgXmAZKkCiu7LzRwyYv7VO9/jvGwmCMa10l9e6WIznxAGzCoTyTNRgBrOC8WKzsn79xt1Qn1U4uuYQY0b/369fqrBNWnl1nNSRrytoIVohkUUGeEceYH7hPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXIksa8aICBXUAbAwjJ8jwvs1XRIWoLXBX49jpfb98s=;
 b=k4M3pugtaa6AyX3+UWrjrrAvIcj5HByn6QXIi61doDF9mBeMGZIKBEBAWMQ9ShLY1To6TaZsMZul+FfAaeD8bUaXj2gySuKNCt8EWH3pSOr9b6t91q672DqozTzHmbg/R8UhRiyXVD2NNhDxyMlNrYAaQ97nscnH96Cq0JF8I8c=
Received: from MN2PR10MB4093.namprd10.prod.outlook.com (2603:10b6:208:114::25)
 by CH2PR10MB4166.namprd10.prod.outlook.com (2603:10b6:610:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Mon, 28 Oct
 2024 21:19:07 +0000
Received: from MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b]) by MN2PR10MB4093.namprd10.prod.outlook.com
 ([fe80::d72e:fa5c:c426:b4b%4]) with mapi id 15.20.8069.027; Mon, 28 Oct 2024
 21:19:07 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: Kris Van Hees <kris.van.hees@oracle.com>
Subject: [PATCH v2 6/6] usdt: fix create_underlying error path
Date: Mon, 28 Oct 2024 21:18:49 +0000
Message-ID: <20241028211849.458862-7-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.278.g36e3a12567
In-Reply-To: <20241028211849.458862-1-nick.alcock@oracle.com>
References: <20241028211849.458862-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0077.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::10) To MN2PR10MB4093.namprd10.prod.outlook.com
 (2603:10b6:208:114::25)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB4093:EE_|CH2PR10MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: 41afe2cc-3506-4882-0cb1-08dcf7962883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jnwGuGR4Lj8hyed62N4QPmoZmYYFRrjE8SmI3mEi4YBMiMuQ8EdEGVp/1y7v?=
 =?us-ascii?Q?IB5xALw9PCo27YlcCLKsHNlx9+zAPbBhPVttN/75ihB9Q3v2tBsb7naEkfJV?=
 =?us-ascii?Q?EUacbmxiUwpbVxReNFr5+ey/O2jS7Cn6ynV3/FfAW1e4/WDJtddnXVlwgID1?=
 =?us-ascii?Q?v0PaGfmAnWKX6iPMXasVOKQCnYZCgSVXsbZnJguAKe6cjBmxJHwgTFecv/BJ?=
 =?us-ascii?Q?3MLmTndZLUzwpzuyykqVMEMOBL66BFq0CXnOBI24m+UJNSQw44vIRGqtwR1h?=
 =?us-ascii?Q?ajo5Ns9wa/x6ON/Vp2C+isQ2xqn+olr1RUOXovAUUtsbQ0OyzXYihu/3Pzme?=
 =?us-ascii?Q?iD3J8T1bNKQKbbdeJ5RzQUSU2QAfDxqNXny8HeRS2jFDN+frcLzjCRCa8Pxz?=
 =?us-ascii?Q?rY2uyMSg3lZjQjmOr4WdaoHhejAfoH8+vLAo8v6d7hnIcx5+FKBKv4yN9Oij?=
 =?us-ascii?Q?flQTxQ/qqLYzX6sphF7Uj55wF2IFZIj9QmOhAwfiTm/T/rfTa5+3FKuo059M?=
 =?us-ascii?Q?mw0aImP3JVVo/qgxn39BGWMeqVGVidqSyW6wiMAuPkDHzBzobBM0Zge9u+h4?=
 =?us-ascii?Q?Alcdvi3u/AZYAvtH+TQ+uhH4RTz37qJMhjYl60MZStXwQ8mt+T0fgw8kuBmO?=
 =?us-ascii?Q?3E1DodSW2nXOsMikrE8XWHHTlGt21wzn6lfFMDYxdkC/21lLKhHtLwR+uRC4?=
 =?us-ascii?Q?36DJiZvZ27yXoRpGd14ILbcFIDpgmqdCvvCCLT4Lo0aqB5QsOYcP2Du77zsq?=
 =?us-ascii?Q?n5+6AX+Onj/zdxA/wHKhRCj/VhfochrEW1BETk/qDUtflxyoEhnBAVtCqhAZ?=
 =?us-ascii?Q?rpvrSo8Ra/lxF/Ni0C3mNG1QWndD6wJjo+mnz3SQ3U7jteCS8VD7KWQ707dF?=
 =?us-ascii?Q?uCJbfe6jRo/+osbRtox9DLEsaMGprSuX/8Uj4bA9ywGNDnxakT9xaCegZ4bc?=
 =?us-ascii?Q?UlozqZzT3kcnMbo2VCR2jouC0jDpK6M+56kGCHaARgmIJNRWGKazAtuA22ut?=
 =?us-ascii?Q?p5O4JI4TOWPnE6DJ1lwO0W7qakPR+QvqnBpt3PXJ5AsDPjxf52VyWKoMBVi+?=
 =?us-ascii?Q?aKBbJm+9cVqSun5ReG7IKyBsui8+QxmPMmmCyGfVIgQcNgnRZ8qLM5+3TlC6?=
 =?us-ascii?Q?fwJoRzKQqsOSG0hAo6kqrZbyEVCWQUVRERuek/g5tqrGb6Vn0DOhZO4UU5pu?=
 =?us-ascii?Q?QIcXA5KTtafj0H1MiOYbI0tlrtiC7LLhb0zb23+y4vbb47iMDCioKKdcYBAs?=
 =?us-ascii?Q?ttgRcRRKmfzyRTr0lvLNNGCjnbdfet2x2TmQa/C3qSVGgjkNyt+qU1gAvp5P?=
 =?us-ascii?Q?dr+xJFA2JcJXcAMwlLhrNYCa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4093.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IOBbWby7uSlY2IPIKinKhwc5nhCl+hRc1R3m0QnBhXGb7EzMY81vzBdKeyYl?=
 =?us-ascii?Q?jFtks/NXrafuqsmGWG2pqEsZ6nvaz5tFDy1NnUhxqrX26O77mNsaNho0xQcw?=
 =?us-ascii?Q?ymDRkHhki0Ud+ITuPbB7BROOII7txqjR8bK5jzMBTQl2WgBFTjDBQBsdD92f?=
 =?us-ascii?Q?iccE8/8iJBMPj1DRo+7zF682dhpqYiUDYQ8BnLhVDSMSDrw9JGWAtEOfp772?=
 =?us-ascii?Q?/fjsYtMo7ZtlACJkuUHojfpcj1QzhiYgQYJ0++1YscSqA2dqIeOKbjl55tGE?=
 =?us-ascii?Q?L6DgVwPdoRn2ORKJBVC3gUQR5RZh9q+WzfC8alrMxJz9zfBeAWwJPUFhnJxd?=
 =?us-ascii?Q?ITZUz83pkX8TfUpcGLUzYEowYPkN01k/6lT2OnYULoGelrRI8LA5fmySbqdc?=
 =?us-ascii?Q?4zDaoMjIX4oZ9iEe10f3ssOFMpbnGiFeprmZFwWdWSPr2FCqwyDBCoEEN088?=
 =?us-ascii?Q?QS4eXr3hZ3mgXllZqevTfcwOkS2hNnFiW+ASxGLUiobtbzRG7mjcjA0FywHu?=
 =?us-ascii?Q?N4f/1mW4rilgONYdSbL9cSVH+PUMAOibj9vWM0nQOUGNkFmTbCckhUONwoLW?=
 =?us-ascii?Q?62NQthcNTVHPS9rhinaL/wRpRBB0AmhrYiBAyUvfHu3RUiay5ahTSoJNRD04?=
 =?us-ascii?Q?hC3vWZiCpPOKK89voyY2C6UYg0jKGS78MjdVrYRHXI5yey3vDxleI4009aZO?=
 =?us-ascii?Q?nVuVEP3Ath8RtSUS7hvpycBI8eNdjJMTxFle3/aKK+kCiyz+8rhRlmOUgzWY?=
 =?us-ascii?Q?nBfCyrAqeToVpDffRTGzEaliUycYCVRYJvJTEwzVy315uCmKoRnwqIxdWto3?=
 =?us-ascii?Q?z1BGmMRWJ3gSpqp08iXTjfuEydYIJ3LDG0a7A2eix4hLejoB7EouCWUSPbMd?=
 =?us-ascii?Q?vuhn6KXAcufOO04Cc0zsk4TIJ5yvPhvL/ESb+nKUVCluFyByL/0hNlXRGmrS?=
 =?us-ascii?Q?py/1ZDa+nvVmfrjKopWAV3clrZQ8OXJEG/cxIac2kNeErp268x5+OqRBqWPw?=
 =?us-ascii?Q?sS5+CTUtV5ck8dw4h3w+eQ0uSKgb0g91i2GgXWvT/cO0NmR0ikiaw9nSfIJs?=
 =?us-ascii?Q?F1fJp1wbiyJQ0eC0hdh5U8eKJinU4Iu8mcGSQwpuWxOKrmVId5lOc2A5UV/D?=
 =?us-ascii?Q?Ip/8ShgAYb9dEmAm/YyM/E3CHytM0NrqCXPv5kN7UYuEH6N9cPS3e7JpdU5r?=
 =?us-ascii?Q?QlD1GCAK3m5K5DuJrq52DewEyxEqGqzP1DJWxlcs7h9EahWSE976WbiqN4pg?=
 =?us-ascii?Q?0xnZEfYU5EJCJkiMtsz7RDS65E2WZ7RidBOeIfJ688feBvOYNWPOf3Y5XM+y?=
 =?us-ascii?Q?Pye2YwiGQM11J6qYLOPEtmgzPpqwe3Ag0NnIXu39fo+aHfIs/w9JdTTrkGqx?=
 =?us-ascii?Q?pKPkm1PdvZs6j31ilmNxCU/Y8fhHZWBsmsbHTtApG9twQuh1Dj92phEbyzzD?=
 =?us-ascii?Q?3C0CP1Z02ZgZpexg9lc3bq43s9sRsW4j+zdrsho4ZYtqfeznFCb/pCSGRDL0?=
 =?us-ascii?Q?XvF25Jo3Qxw6jYIDqsGf1nnzemW7ec+8q7J7m0KWxTCnzGJiopJzMVfa8lHp?=
 =?us-ascii?Q?wgVNGdWLBrWdDg9qzxO4gmp89L8iqV31zua4i276PTcuOJtZ0QA/ot2/V4jY?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xqQAYXgutXGqyLs87ZmhS5u8YkY1oklDIHTsUcDQVuaOpApnqc3F0YIZQxFpC4KWwr7933xQZ/F95qZQ1wkmT2AKYLiwVXlmo5snTbatauVLskqpKl5oea7eJjNGOFr7aLk2bc7uz0cfHoNnC90e8rYS9+BFwdOBN3cbRFGgCHyt9CTXICS+3GFCpsBjzuWbx2K5ybZx8jXUXeKI3kLE13Ps21Z3imii7qmcY2ltS9BzBLXr5CzS9GQzMOhUvH0C+ltVv8fHPne0FgmoOD/+QFlOv8Hhr/CEg7ju7Sx5QzSW9kJ0X5dGNUWeIzHHr8P4zFKfoPYxYKtyK0Tqohd33Q24nL1cX0DjDr1Hsm7Bb+XoK0/iCAYkXR22SCoxLX36ObDL6BCU/fIh7g9kf5YpGEfyAM2zweUMXFPCOzH08o7Sbk470vi334M5ngR6QDs7xtmMMsC2hYgHf9/1/5AOKb+vWZlYGRgX+NM3oejUvr/Ui09wINC4Z0x0notDHL8cyinfN256KZ3gguHxkpuQDWfWwAKnk9VRAltwjJuF4zP1GMiyq6QBcDrIjiePwyV9riDQ3WP2kWK26iJfhrb6svQVElwVjGJg5KB5J5lrrQ4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41afe2cc-3506-4882-0cb1-08dcf7962883
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4093.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 21:19:07.7465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kUbI7IQY4c809COtL9b5AZni3sE8e03PPoHZLXppiJfz24s7nWxHh4NgIk9TIniqp2LGpq5I8GqHiakcBWknw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4166
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-28_10,2024-10-28_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410280165
X-Proofpoint-ORIG-GUID: stb8UTPfEX5LtU20LDakwPozFHOKJk8H
X-Proofpoint-GUID: stb8UTPfEX5LtU20LDakwPozFHOKJk8H

On error, we were destroying the underlying probe using the wrong call,
as if it were an overlying probe.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index e45d9b1bab61..f163a9eba0e1 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -272,7 +272,7 @@ static dt_probe_t *create_underlying(dtrace_hdl_t *dtp,
 	return uprp;
 
 fail:
-	probe_destroy(dtp, upp);
+	probe_destroy_underlying(dtp, upp);
 	return NULL;
 }
 
-- 
2.46.0.278.g36e3a12567

