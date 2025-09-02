Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E641B2E8B92
	for <dtrace@lists.linux.dev>; Tue,  2 Sep 2025 21:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756847251; cv=fail; b=X16DM3iJYZrflpPcJFb6RtgQEtmpS8KThvWnsvcHXiBqlFxi6ZsAw07maxv1YqyJJ7bL/1rCWxMX+SKNWGHW8UsUB5V/TJZ+CMnICTfURdfUivHJP+Hef4ShecvaFwlXN6ihJu2atf0CTiMLhVEQ5l5qd7lYSD3aF8I2F8Oi6Wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756847251; c=relaxed/simple;
	bh=9OEgIred+JtnZEyv9pHTtOnsdXsxwDZOwgjEl7EmDjo=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JXYxsFTB2bJ2jspNBk39aW6SOP8ZXUMARakH1HpP2khcS/Mb0q9/e+TtNCnfzcrZvrEJ63qtq7/UmPaB1xSiE0xaSL89mJ8zIHL/HvGyvIP5YPpMUEGfx9SFdP3c2Z9p4NSfqgBjLDI1lCtGzhAGvSDjofC6s7D/X4Zm0DP+fMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=I9GQYpVL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jMAymGbh; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="I9GQYpVL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jMAymGbh"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582Ki40q018621
	for <dtrace@lists.linux.dev>; Tue, 2 Sep 2025 21:07:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=49rhbshk1qYsWmbfmdUd30bJJt9r6ip9QKk36VeIvV4=; b=
	I9GQYpVLahQPiXdBR8Bd4F4XpTwnWONA0kc9ih1BBHUAjK5VD1szD0WIXBz+eQwr
	WgclAsOd9WdCmpqIe6giz09YBd0nOmu8YT9tulU1RilLI57fcoSnyYAeCFvD/CCG
	wbfoHGEN9jdlj0VgXMrETfWGQ42qd97o9MOkPhGdwud3yi8P1IPzROwQoY23wkQY
	Kt59hVAk7N/8uR6Lilxstodm1DHJbNMjUpWn5UxBmMPKY9iQcHmMR9QG90uz6EnS
	SMtMFucr7mC+ax6qvqT4UMQEoiZHlwP5gajKdJsV/70yoklwsfCBOUnYxXlGq2u0
	OJi+37SD+q4MG5igOWPxTw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48ushvw1m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 02 Sep 2025 21:07:25 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 582KXYtp036197
	for <dtrace@lists.linux.dev>; Tue, 2 Sep 2025 21:07:24 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 48uqr9kkup-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 02 Sep 2025 21:07:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wsaoXchu2xOS3dcMZj/TqTaHeGAykyX9i580l6gG5rHNan4ZGd57WzjpT0oUWVwSr57jSpogWaCbnvq38Klj7z+TKmuFHn5lRQOTG7ITe6/1KnUmSncSvt4cYjerFMoKKgwqg2I1WCmxmRn9+/Gmj7W727ELk/xdue+eHwfx4AzBSetG8b/HVL9u/hJzsRe6WS3IziFMECZRcT7JSGhQDK9lZrZAbddz0fUwijJzHCh1Zlw1y2Vgg7mggVxrlfw0sgw4nMLzSm62pbP7wmMMMxKSzEhEs1JkYG3R710D3mUYk4IS/dImXl0CMJC4TTE9c5Bc+AS5k8CEJLZ2FEZnZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49rhbshk1qYsWmbfmdUd30bJJt9r6ip9QKk36VeIvV4=;
 b=EKuY/zxHUXoEdsssE7QcvYpkyzzs+aBrWMmtwRzoMGOTk8OlrwV+yDfyHNi5x9IYFSkQLKL65Gr3APGYVj3uzQrSR4TrVxU84GoT4nOvn6xIsFu848WoBGjctwCpHgTBO7/HIOHrDKwd9eBWAFFvW635ty3GCL4ib1AO51HJ2rzDsPw1MYAKX8RNpUB0SsKXIteBmHrZdtmwhk8LpgdtZqctZd9N+BnHp6O7xlMGE1Azc1QCuAoSBFXsPcYSD0zbQ01x/GUGJjUI5lN2R/qS/Yeb2Vf9ys4HGelrii9I8ZbIbFzIK5UnBqCL0wrL3AEFlCojzQMyQtQBm2nEAwTTVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49rhbshk1qYsWmbfmdUd30bJJt9r6ip9QKk36VeIvV4=;
 b=jMAymGbhyeshoohGjZUivi4QMZEGsdaU0rf9RWNL29wOt3l3rNUTvmLaixPVnymR8SpV7Ifq9dB0HEzNAG80xE/d4YrX69HyQuB7Dw4bRDFC+UJ7GdlMkUb7jQrd8e3pbDLvJO4ZfyoiUsKp0WQcQAQRHFheX+EolgsrF7OCpIw=
Received: from IA0PR10MB7327.namprd10.prod.outlook.com (2603:10b6:208:40e::22)
 by PH0PR10MB5796.namprd10.prod.outlook.com (2603:10b6:510:da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 21:07:20 +0000
Received: from IA0PR10MB7327.namprd10.prod.outlook.com
 ([fe80::f6c5:2814:c5cc:b398]) by IA0PR10MB7327.namprd10.prod.outlook.com
 ([fe80::f6c5:2814:c5cc:b398%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 21:07:20 +0000
From: Ruud van der Pas <ruud.vanderpas@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>,
        "dtrace@lists.linux.dev"
	<dtrace@lists.linux.dev>,
        "dtrace-devel@oss.oracle.com"
	<dtrace-devel@oss.oracle.com>
Subject: Re: [PATCH] examples: Add "language features" demo scripts
Thread-Topic: [PATCH] examples: Add "language features" demo scripts
Thread-Index: AQHcHESboIMvguoJ30+UWcyfNElADrSAYpgA
Date: Tue, 2 Sep 2025 21:07:20 +0000
Message-ID: <799E27D1-7A3B-44DD-91BF-3D7C6CAC76CE@oracle.com>
References: <20250902200246.3299-1-eugene.loh@oracle.com>
In-Reply-To: <20250902200246.3299-1-eugene.loh@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR10MB7327:EE_|PH0PR10MB5796:EE_
x-ms-office365-filtering-correlation-id: e8a7d188-59cd-44d4-4836-08ddea64b48d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bh2Sbj23KMiUJ03DbZ+Xf1cFLSINWzu3wwrix1zDpORjrVKe2zAkU4NqRMI+?=
 =?us-ascii?Q?2/+MRoDNjc0dIveuYadIcJqSbTVzC7/fqATxLuv9y8ycBpO47oHd1XsC1a2e?=
 =?us-ascii?Q?VyeQHMfUmax2DAPvlXfZzHPJa+VFOclV6Cm5BCnQ2anEGMwGtxOejXd1gyci?=
 =?us-ascii?Q?wXhM92CtcKBxGdlaTqaAFziQS/sfR7Hz/s8O35UaaYUmISrl70fGjeqMk4S5?=
 =?us-ascii?Q?iQFQ+D+LUgXtbiMvdLsc6uS04AwrOb3o1njCqdx/fSaXnQ2fZCKfW/VlOkLR?=
 =?us-ascii?Q?T5itlw+s4P/BLG0wf//fwgBg/7dkR7M7W25FoJcmeZ20avfz7yda4EquheQ9?=
 =?us-ascii?Q?V7+/nP6oMyL9RUF/JumIw+kNTYH5uuCH4y/d3IvJ/9SKfDDolM3FQ5WNozeE?=
 =?us-ascii?Q?lH4dJ4edxkouofeml/lZiT4Bt++o9jI2j9vb7t6Crh7hFklBtC8xaO1ikNLA?=
 =?us-ascii?Q?x47WzaWoI3b4J8535LGcQ0abqyaF1rr7HlQtWZulLdePHpMfOLHiWDDmaPsK?=
 =?us-ascii?Q?pWhFLsmXOjD6qqqQpJ8D8xCZy7Q4cen3aEUVzhXPCbZZ2eg4UCIJvnVnOPuz?=
 =?us-ascii?Q?/1fsiABTiBISX1sFqYhzURxcQswlPBXRKqqpKOuhSsQMufHMcYIyaqfms+Bi?=
 =?us-ascii?Q?0GcKZdrLWrhtpKSJmObi+MyfETsI8y8hpAVyHPFv3UNdmQdt9SoIHKY2ltMT?=
 =?us-ascii?Q?HbN5P+l1jfo2pxGq+95anRmlLCPxYF7gLut1FQM1SZiJEYSKbVNUWXNZPqUp?=
 =?us-ascii?Q?slS1lFfWCy7vyqGHriaXzrhpIigoryGNv4YHHHfAOh+5geHWvjL4NHGCWwqA?=
 =?us-ascii?Q?RW6SvPVzZqJ7Fb0MEFEKez2qdFMu5fxRBdXUvo08/zzqxMEL3iWIuyuICW22?=
 =?us-ascii?Q?XvkuHS1HREVMpyRGcmu50/DNENT8c6mRRZW6p+Cu+9j8s/17Y3Aa0OB5xt0j?=
 =?us-ascii?Q?8br4xHrBPHFcb0nwLqozXuc2FZ9yK9maMrAY5n/R1XNcDtNEvnYbqB+wTy8x?=
 =?us-ascii?Q?6yvIOCLJnPu4XMNHCuNh/wTCSImTlK3/wTefVkUy7nUVGS65T4h8hapKb6F4?=
 =?us-ascii?Q?VWCvAMTIWsYwrSQPKo4VN+oFpXy8YT0XCzPb6PRmLNo4btDG7qDPGWXBBcDy?=
 =?us-ascii?Q?PGFBMhHdZoiOcoR9TzNVbd4GEE8cFNY+GUoJK6EzlWU2iloIfCvM96NPPkw2?=
 =?us-ascii?Q?iA7CQjNWGl6KkriIkKL2JlnVGHP6E96drYmQNiAF6trvVEDIchl/LOFjsbVZ?=
 =?us-ascii?Q?TgUCK/FbCAoSHSaUJQwVoIHkNVCrjt0CtibGmpBExqFnI6LWA7lq88xsbUfi?=
 =?us-ascii?Q?aGcxBChbjlDeDvaPisviXO4tYgiQuvsjQySaYsRDeCm7cKlJY+BNIoa8rKds?=
 =?us-ascii?Q?Il3/gQnFFiKDR5AQUBvacOZG00n+IFM28Q9kQPl3TtygyZ+BcAd7+j/awNBW?=
 =?us-ascii?Q?pcXs+dbUHpVFX9w+KEAAkxIeCXd5bUwoJkoo1SmBrk4Ef6doPMXDdKlFjatu?=
 =?us-ascii?Q?VUvEVecxFgUN8JQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR10MB7327.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kSS4xlCPrBOQkw6otquVxVmhBUUXXZimG4bGAY6zfDU7zfxg6ucZdYAGdlXE?=
 =?us-ascii?Q?tOaRNaKoqplruZXvOdtm7R/A1MYa4SwKTYVGLmaoRCF1jmlpPN92NmpZcxeX?=
 =?us-ascii?Q?6ACdrlphzTpKMVgQEzV6znnHuA0Z9beLXhdmc2NutdpJfF5DwLAwbhReijiy?=
 =?us-ascii?Q?ZMdDXwamsX/QPfPx0hcW8oH6YtFQZW8YoutuLEektynN+ORV/lfJPFK3xeEN?=
 =?us-ascii?Q?gjqYnqHizZ43W6/vYZON3pcPz0ySxdwcRsuOfpqNkfXUBLgezWvUiXMChUQ0?=
 =?us-ascii?Q?PQC1E2gxsniC/3uis6anBIEFBXdnWiNVYGJDICdFL+hTBiveyuk4DtVVEIUh?=
 =?us-ascii?Q?b0M7lKKKOEuLUy/piC9skPOxKx/9uip5mEAS/r8iHZeBV5wozTlW6GemHU78?=
 =?us-ascii?Q?Xd3kBGLRWwGWXVIwOtwxiet27Am3gcY3fJAUVrIxDUSemsQr3P8OhThVqmLy?=
 =?us-ascii?Q?dtsUrfsUFBmyRzuS87jRiSgD/ux2sKBiRAb5qxmBYI5oiJnqfQOFsOuBVIqR?=
 =?us-ascii?Q?S0qInNP06B9iNsUKE8VdPjpB9gYYw+ZWM6qw2yUdjAwqCWWV1/r6f2x14n3O?=
 =?us-ascii?Q?17Lqxw3GCoKhrWRpOv4Hm+VttsOxSdnS6KtpKZTdracEuj6HVOHHzqdiSc3N?=
 =?us-ascii?Q?Gg1yXouf+AvL4xkFm6VoKkSHjaSyxKo9TyG5eux/WiSTJ0eLOd97dtN+j4Xa?=
 =?us-ascii?Q?7J//lfwjwDgZw9AiLQLeMeMgjGlPZMogsl4ghgD9BPa+1slSbZ6pQ5+rsIET?=
 =?us-ascii?Q?pvrNcePyviJzsNX61eeq4Oz2fVzAz+Tpg4eS0Zye4NpC5DRAFrYYXTtzq+P4?=
 =?us-ascii?Q?TVEYbz4d3SLnrhfVWieIc6L+zPUYuI49U1tRrijhRi2gGgLRV7UHNwfvgyb/?=
 =?us-ascii?Q?VYsyuCMtviLg1xq0g3pwR7dqIJSmLSGe/kqOa6cIJZfnfgPFA4MuLh9rQMxg?=
 =?us-ascii?Q?YOTScr+khd8OwJaKGHDlFH1oua8SK9aCdcHb0o+TRaL8gShSK1OhD/Z2c3N4?=
 =?us-ascii?Q?gka4LbRIsRwWwgufOEBV0bYyfM4qRiGIqYWMgcQl3AgL4GWsNKA/u76fMB6F?=
 =?us-ascii?Q?G1dR3XS4Jv2vtjCl/3TzekFvnKf2fZ/pLYASl+ikx0BQggodip/cOaYv4WiZ?=
 =?us-ascii?Q?qKvWb7vhjoqSQL6FNqB4AtGAmskMH6SjHUOqFe0XbEU03CnoZS+HadcC0/ks?=
 =?us-ascii?Q?2QP3w8jolts7HAIArzOEYAaphcCAgWu+4Ci11g02aeLSqko397gLqyNtsIhV?=
 =?us-ascii?Q?111HXeeYHLfNvtSy8vMejhXt0m/7hrbyMj4qOFDCKawpsXfEVjGdnLu799Ke?=
 =?us-ascii?Q?1BALIAQ3qAtZWuVQTShiqnVfGgM+3yBsdf6DCt58Sb3U8iqbMc+S8qthIvM8?=
 =?us-ascii?Q?7AKyrWNAdufXinQSl7FYKCf9BI/Dpi/r+Rd6ESTENbFT/knRiSuG3qAHVrrP?=
 =?us-ascii?Q?bBvsUHUq/9QEfo/mRE1i5OZNgaQnl+Xm9NjjbdavnIvIgDdWrq+xtNVU2uIm?=
 =?us-ascii?Q?yUdULRFC0p6Oe4HL0TzyCSiR9unD/HFaJ6H4dOnathjR1YJmqD9dESovCxHi?=
 =?us-ascii?Q?gj4Dp7JiSvS0DwMJZ4fOCbbvYmDa7FXSbIxJwBQ8oej6ORxZ1MLd+7z/Bv1I?=
 =?us-ascii?Q?/g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D8C9CA6C2EB4414AA151DD3C6A324E70@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GHx3xH14xwPM13pWDuf14JKX0ki7QVdfvVd1HzD/GVCAz5wWlitDkYDNrKAPSALk6Yfsq+8X5a3a5oqySJNSuKYX3q15mg2Itly994N5x7qAt3Ci0V0F2IOFz5BPc1PDAyQ5qxH3QxTsGxmJ4djw1P7FNdIOkVLU8r9lDO2c5NX5OYfYbdmKQZkwWYWU4zspazy8mEYKpx42N/NENHH7qbfp2l7c4fvEFcZhu2XDmRMW4rUeaFIm/jPLe1Sk34yyB5To0t/WK8aQb84i7cbfMe1rEgAHtKN7v+AgKzPeCVThQgaiTsrOND0kF0cTJSY23HXt0jIsf8zJyN6IeTVJF4y2OznI1D42OypjHolvYyAmX38Z9RPX2PUtS9FX7zotEQtkIxdbr1U4MRS54kFvO6FfjcEcW+kKu0rRsQN/WOWcyrTpDppArmC/HUoZpxPRNUovHsJzemnBTAcLsOeIRzKiZ/pcf8PR9tkqKSRI9af+3rGvIEcdezVOWUQvEIPLzXQeYXVh38aa4dN+qFQ49AMwq8Zp6okpGVyAWA61unWvR6ZbwHIrlHWDdN3gF/qG8cxzQ7HsZfx9k9tHaJTY4z5PS+UbjNXiT0O5hd713GA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR10MB7327.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a7d188-59cd-44d4-4836-08ddea64b48d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2025 21:07:20.3088
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PT286a2g/6I/BklM6TfcoVRpDnIGLa3zDfHMCv8Re4A6rbYwu0zS4mkQ29j2GqrjGKhE9SrsVn/UhlJzHQUPaB3RoX6M2mqRSEVYM7xyBh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5796
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2508110000 definitions=main-2509020208
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfXztLZZDBkRR55
 NG9darWQ4zqUDYb31VpgK0oow6rq/ybX+c4E+6VEtT2vTpfnc3kXdd7sCNwB445eQnE9le1RFFh
 83y9lzTLmIUbcetnzrBv1Va5UOXkg3WeSXtmFENqRv9wRl10XVvW7A4xkGWABjfghITWAkqNkHz
 1dl12i17AQeQxHWgQsklAiv/KJ9Wqm60w42xldBS3TiwES3GIKMkkj8dTY3TRTaKGjEpcf6+bgY
 IedcPSvOV18s5e0Z5M+f5a0H3GU8IPsqVoH0DUh5yd2Y96jSv0/QHashRejWDAL5je5Gmqb1ifv
 0HBtAOiSNflhIoU4wov43P0fcSynxgA8cqMKny8MkqzVVV517d9ft+AuyIoN8WDQmrGLXZ6+Wkk
 DPZHNafc
X-Authority-Analysis: v=2.4 cv=fZaty1QF c=1 sm=1 tr=0 ts=68b75c8d b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10
 a=yPCof4ZbAAAA:8 a=NrxKZqb7snSghux3JmMA:9 a=QWoAyJx5Xna_e5xF:21
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: YU-MfvbFrL8kdejcJC2jxtOYPULou_Cn
X-Proofpoint-GUID: YU-MfvbFrL8kdejcJC2jxtOYPULou_Cn

Reviewed-by: Ruud van der Pas <ruud.vanderpas@oracle.com>

> On 2 Sep 2025, at 22:02, eugene.loh@oracle.com wrote:
>=20
> From: Eugene Loh <eugene.loh@oracle.com>
>=20
> The idea is to have lots of short scripts, each illustrating a
> D language feature.
>=20
> The numbering scheme serves two purposes:
>=20
> *)  the scripts are more or less in ascending order
>    of difficulty, although that's admittedly a tricky
>    concept in such a multi-dimensional space
>=20
> *)  there is some grouping of themes -- e.g.,
>    "introduction", "providers", "built-in variables", etc.
>=20
> The combination of comments and code is intended to help either
> a human user or an AI bot to learn how to use the D language.
>=20
> Other examples have been based on functional objectives (doing
> simple but useful tasks).  These new examples are based on language
> features.  A future set of examples could be based on errors!  That
> is, the scripts generate errors of different sorts that we would
> illustrate (and explain how to fix).
>=20
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
> examples/README.md                            | 13 +++
> .../language_features/000intro-hello-world.d  | 63 ++++++++++++
> .../language_features/001intro-ERROR-probe.d  | 30 ++++++
> .../002intro-global-variables.d               | 31 ++++++
> examples/language_features/003intro-C-like.d  | 75 +++++++++++++++
> examples/language_features/004intro-ternary.d | 32 +++++++
> examples/language_features/005intro-strings.d | 65 +++++++++++++
> .../language_features/006intro-associative.d  | 34 +++++++
> .../007intro-this-variables.d                 | 49 ++++++++++
> .../008intro-self-variables.d                 | 57 +++++++++++
> examples/language_features/009intro-pragmas.d | 38 ++++++++
> .../010intro-external-variables.d             | 53 +++++++++++
> .../language_features/011intro-preprocessor.d | 25 +++++
> .../language_features/012intro-predicates.d   | 52 ++++++++++
> examples/language_features/100list_probes.sh  | 11 +++
> .../101count_probes_by_provider.sh            | 12 +++
> .../102list_probe_arguments.sh                | 11 +++
> .../language_features/110provider_profile.d   | 29 ++++++
> examples/language_features/120provider_proc.d | 37 ++++++++
> .../130provider_sched_on_off_cpu.d            | 28 ++++++
> .../131provider_sched_enqueue_dequeue.d       | 24 +++++
> .../language_features/140provider_syscall.d   | 20 ++++
> examples/language_features/150provider_fbt.d  | 48 ++++++++++
> .../160provider_sdt_rawtp.sh                  | 36 +++++++
> .../language_features/170provider_lockstat.sh | 17 ++++
> examples/language_features/171provider_io.d   | 31 ++++++
> examples/language_features/172provider_ip.d   | 26 +++++
> examples/language_features/180provider_cpc.d  | 52 ++++++++++
> .../200built-in-variables-probe.d             | 18 ++++
> .../201built-in-variables-timestamps.d        | 31 ++++++
> .../202built-in-variables-args.d              | 28 ++++++
> .../203built-in-variables-process-info.d      | 31 ++++++
> .../204built-in-variables-uregs.d             | 31 ++++++
> examples/language_features/300actions-exit.sh | 18 ++++
> examples/language_features/301actions-print.d | 32 +++++++
> .../language_features/302actions-strings.d    | 45 +++++++++
> .../303actions-strings-paths.d                | 25 +++++
> .../language_features/304actions-system.d     | 22 +++++
> .../language_features/305actions-progenyof.d  | 20 ++++
> .../306actions-speculations.d                 | 57 +++++++++++
> .../language_features/307actions-callstack.d  | 54 +++++++++++
> .../310actions-alloca-copy.d                  | 95 +++++++++++++++++++
> examples/language_features/311actions-rand.d  | 25 +++++
> .../language_features/500aggregations-intro.d | 24 +++++
> .../501aggregations-names-keys.d              | 19 ++++
> .../502aggregations-basic-funcs.d             | 26 +++++
> .../language_features/503aggregations-stack.d | 24 +++++
> .../504aggregations-printa.d                  | 29 ++++++
> .../505aggregations-quantize.d                | 65 +++++++++++++
> .../506aggregations-clear-trunc.d             | 63 ++++++++++++
> .../507aggregations-trunc5.d                  | 50 ++++++++++
> .../508aggregations-normalize.d               | 49 ++++++++++
> 52 files changed, 1880 insertions(+)
> create mode 100755 examples/language_features/000intro-hello-world.d
> create mode 100755 examples/language_features/001intro-ERROR-probe.d
> create mode 100755 examples/language_features/002intro-global-variables.d
> create mode 100755 examples/language_features/003intro-C-like.d
> create mode 100755 examples/language_features/004intro-ternary.d
> create mode 100755 examples/language_features/005intro-strings.d
> create mode 100755 examples/language_features/006intro-associative.d
> create mode 100755 examples/language_features/007intro-this-variables.d
> create mode 100755 examples/language_features/008intro-self-variables.d
> create mode 100755 examples/language_features/009intro-pragmas.d
> create mode 100755 examples/language_features/010intro-external-variables=
.d
> create mode 100755 examples/language_features/011intro-preprocessor.d
> create mode 100755 examples/language_features/012intro-predicates.d
> create mode 100755 examples/language_features/100list_probes.sh
> create mode 100755 examples/language_features/101count_probes_by_provider=
.sh
> create mode 100755 examples/language_features/102list_probe_arguments.sh
> create mode 100755 examples/language_features/110provider_profile.d
> create mode 100755 examples/language_features/120provider_proc.d
> create mode 100755 examples/language_features/130provider_sched_on_off_cp=
u.d
> create mode 100755 examples/language_features/131provider_sched_enqueue_d=
equeue.d
> create mode 100755 examples/language_features/140provider_syscall.d
> create mode 100755 examples/language_features/150provider_fbt.d
> create mode 100755 examples/language_features/160provider_sdt_rawtp.sh
> create mode 100755 examples/language_features/170provider_lockstat.sh
> create mode 100755 examples/language_features/171provider_io.d
> create mode 100755 examples/language_features/172provider_ip.d
> create mode 100755 examples/language_features/180provider_cpc.d
> create mode 100755 examples/language_features/200built-in-variables-probe=
.d
> create mode 100755 examples/language_features/201built-in-variables-times=
tamps.d
> create mode 100755 examples/language_features/202built-in-variables-args.=
d
> create mode 100755 examples/language_features/203built-in-variables-proce=
ss-info.d
> create mode 100755 examples/language_features/204built-in-variables-uregs=
.d
> create mode 100755 examples/language_features/300actions-exit.sh
> create mode 100755 examples/language_features/301actions-print.d
> create mode 100755 examples/language_features/302actions-strings.d
> create mode 100755 examples/language_features/303actions-strings-paths.d
> create mode 100755 examples/language_features/304actions-system.d
> create mode 100755 examples/language_features/305actions-progenyof.d
> create mode 100755 examples/language_features/306actions-speculations.d
> create mode 100755 examples/language_features/307actions-callstack.d
> create mode 100755 examples/language_features/310actions-alloca-copy.d
> create mode 100755 examples/language_features/311actions-rand.d
> create mode 100755 examples/language_features/500aggregations-intro.d
> create mode 100755 examples/language_features/501aggregations-names-keys.=
d
> create mode 100755 examples/language_features/502aggregations-basic-funcs=
.d
> create mode 100755 examples/language_features/503aggregations-stack.d
> create mode 100755 examples/language_features/504aggregations-printa.d
> create mode 100755 examples/language_features/505aggregations-quantize.d
> create mode 100755 examples/language_features/506aggregations-clear-trunc=
.d
> create mode 100755 examples/language_features/507aggregations-trunc5.d
> create mode 100755 examples/language_features/508aggregations-normalize.d
>=20
> diff --git a/examples/README.md b/examples/README.md
> index de4ba090b..b84a34031 100644
> --- a/examples/README.md
> +++ b/examples/README.md
> @@ -86,3 +86,16 @@ These are the scripts included, plus a brief descripti=
on.
> |                 | thread ID as returned in the DTrace tid variable.    =
     |
> | var-scope.d     | Demonstrate some of the scoping rules for global and =
   |B|
> |                 | clause-local variables.                              =
     |
> +
> +## Language-feature examples
> +
> +In the language_features/ subdirectory are short scripts,
> +each illustrating a D language feature.
> +
> +The numbering scheme serves two purposes:
> +
> +* The scripts are more or less in ascending order of difficulty, althoug=
h that's admittedly a tricky concept in such a multi-dimensional space
> +
> +* There is some grouping of themes -- e.g., "introduction", "providers",=
 "built-in variables", etc.
> +
> +The scripts start at Beginner, and they arguably do not get much more co=
mplicated than that.
> diff --git a/examples/language_features/000intro-hello-world.d b/examples=
/language_features/000intro-hello-world.d
> new file mode 100755
> index 000000000..a38f7cacc
> --- /dev/null
> +++ b/examples/language_features/000intro-hello-world.d
> @@ -0,0 +1,63 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./000intro-hello-world.d
> + *
> + *        or
> + *
> + *    sudo /usr/sbin/dtrace -s 000intro-hello-world.d
> + *
> + *        or
> + *
> + *    sudo /usr/sbin/dtrace -n 'dtrace:::BEGIN
> + *                              {
> + *                                  printf("hello world\n");
> + *                                  exit(0);
> + *                              }
> + *                              dtrace:::END
> + *                              {
> + *                                  trace("goodbye world");
> + *                              }'
> + *
> + *  DESCRIPTION
> + *    This is a simple "hello world" program in D.  It
> + *    illustrates a variety of very simple features of D.
> + */
> +
> +/*
> + * The BEGIN probe fires when the script is launched.  It can
> + * be called by simply asking for BEGIN.  Or, its provider can
> + * also be named:  dtrace:::BEGIN.  The other probe description
> + * fields, the module and function, are blank for this probe.
> + */
> +dtrace:::BEGIN
> +{
> + /*
> + * A C-like printf() function can be used to print
> + * data.  Alternatively, the trace() function can be
> + * used, and it will discern the appropriate data type.
> + */
> + printf("hello world\n");
> +
> + /*
> + * Variables can be assigned.  They maybe typed implicitly.
> + */
> + x =3D 123;
> +
> + exit(0);
> +}
> +
> +dtrace:::BEGIN
> +/x =3D=3D 456/    /* A predicate can indicate whether to execute a claus=
e. */
> +{
> + trace("YOU SHOULD NOT SEE THIS MESSAGE!!!\n");
> +}
> +
> +/*
> + * We can also gives actions to list at the end.
> + */
> +dtrace:::END
> +{
> + trace("goodbye world");
> +}
> diff --git a/examples/language_features/001intro-ERROR-probe.d b/examples=
/language_features/001intro-ERROR-probe.d
> new file mode 100755
> index 000000000..3c3a50eee
> --- /dev/null
> +++ b/examples/language_features/001intro-ERROR-probe.d
> @@ -0,0 +1,30 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./001intro-ERROR-probe.d
> + *
> + *  DESCRIPTION
> + *    The ERROR probe can be used to handle run-time errors.
> + *    If a clause encounters an error, its output is not seen
> + *    and the ERROR probe is triggered.  Other clauses associated
> + *    with the guilty probe, however, do execute.
> + */
> +
> +dtrace:::ERROR
> +{
> + printf("An error occurred.\n");
> +}
> +
> +dtrace:::BEGIN
> +{
> + printf("WE SHOULD NOT SEE THIS!\n");
> + printf("Dereference an illegal address: %d\n", *((int *)0x1234));
> + printf("WE SHOULD NOT GET HERE!\n");
> +}
> +
> +dtrace:::BEGIN
> +{
> + printf("This is a different clause.\n");
> + exit(0);
> +}
> diff --git a/examples/language_features/002intro-global-variables.d b/exa=
mples/language_features/002intro-global-variables.d
> new file mode 100755
> index 000000000..9b9ec6533
> --- /dev/null
> +++ b/examples/language_features/002intro-global-variables.d
> @@ -0,0 +1,31 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./002intro-global-variables.d
> + *
> + *  DESCRIPTION
> + *    Rules for variable names are similar to those in C.  By
> + *    default, they are "global" -- that is, seen by every thread
> + *    and every probe.  So be careful that no thread overwrites any
> + *    other thread's write.  Variables may be typed implicitly.
> + */
> +
> +int explicitly_typed_variable;
> +
> +dtrace:::BEGIN
> +{
> + explicitly_typed_variable =3D 1234;
> + implicitly_typed_variable =3D 5678;
> +
> + printf("%d %d\n", explicitly_typed_variable,
> +  implicitly_typed_variable);
> +
> + my_char =3D 'a';
> + my_string =3D "hello world";
> + my_pointer =3D (int *) 0x123456;
> +
> + printf("%c '%s' %p\n", my_char, my_string, my_pointer);
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/003intro-C-like.d b/examples/lang=
uage_features/003intro-C-like.d
> new file mode 100755
> index 000000000..2e3ea8bde
> --- /dev/null
> +++ b/examples/language_features/003intro-C-like.d
> @@ -0,0 +1,75 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./003intro-C-like.d
> + *
> + *  DESCRIPTION
> + *    Much of D syntax is very C-like.  Examples are shown here.
> + *    Check the documentation for more complete information.
> + *
> + *    Differences include:
> + *    - D variables can be typed implicitly
> + *    - D has no "if" "switch" "case" "for"
> + *    - D has no function definitions
> + */
> +
> +/*
> + * As you have already seen, one can use multi-line comments in D
> + * similarly to C.
> + */
> +
> +/*
> + * Variables can be declared explicitly.  Data types like short, int, lo=
ng,
> + * long long, char, struct, and union are familiar from C.
> + */
> +int x, y, arr[5];
> +
> +dtrace:::BEGIN
> +{
> + /* Assignments are similar to C. */
> + x =3D 1;
> + y =3D 2;
> + x +=3D 3;
> +
> + /* There are familiar operators.  E.g., arithmetic operators. */
> + x =3D x + y;
> + y =3D 3 * x - 2 * y;
> +
> + /* Relational operators. */
> + x =3D 2 > 3;
> + y =3D 2 >=3D 3;
> +
> + /* Logical operators. */
> + x =3D (2 > 3) && (2 >=3D 3);
> +
> + /* Bitwise operators. */
> + x =3D x & y;
> +
> + /* Various unary operators. */
> + x =3D x++ + --y;
> +
> + /* Types and casting. */
> + x =3D (long long) (sizeof(int) + ((int) 0xfedcba9876543210ull));
> +
> + /*
> + * In contrast with C, D has a printf() whose %d, %x, and %i format
> + * conversions use type information about the corresponding argument
> + * to interpret that argument with its actual word size.
> + */
> + printf("%x\n", x);
> +
> + /* Arrays can also be associative.  More on that later. */
> + arr[0] =3D 10000;
> + arr[1] =3D 11111;
> + arr[2] =3D 12222;
> + arr[3] =3D 13333;
> + arr[4] =3D 14444;
> +
> + /* One can get addresses and dereference addresses. */
> + /* (In this case, `nr_cpu_ids is a kernel variable.) */
> + ptr =3D &`nr_cpu_ids;
> + printf("nr_cpu_ids:  %d should equal %d\n", *ptr, `nr_cpu_ids);
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/004intro-ternary.d b/examples/lan=
guage_features/004intro-ternary.d
> new file mode 100755
> index 000000000..e6404f8b6
> --- /dev/null
> +++ b/examples/language_features/004intro-ternary.d
> @@ -0,0 +1,32 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./004intro-ternary.d
> + *
> + *  DESCRIPTION
> + *    Much of D syntax is very C-like.  Another example is
> + *    ternary operations:  ($condition ? $if_yes : $if_no).
> + *    In D, however, ternary operations are argubly more
> + *    useful than they are in C.  The D language does not
> + *    have conditional constructs like "if" statements.
> + *    Therefore, other constructs, like predicates and
> + *    speculations, must be used.  Or, ternary operations.
> + */
> +
> +dtrace:::BEGIN
> +{
> + x =3D 123;
> + y =3D 456;
> +
> + /* basic ternary operation to implement z =3D MIN(x, y) */
> + z =3D (x < y) ? x : y;
> +
> + /* a more novel use to conditionalize an assignment */
> + (x < y) ? (y =3D x) : 1;
> +
> + /* all three variables should have the same value */
> + printf("x =3D %d; y =3D %d; z =3D %d\n", x, y, z);
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/005intro-strings.d b/examples/lan=
guage_features/005intro-strings.d
> new file mode 100755
> index 000000000..5a758fcc3
> --- /dev/null
> +++ b/examples/language_features/005intro-strings.d
> @@ -0,0 +1,65 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./005intro-strings.d
> + *
> + *  DESCRIPTION
> + *    But D does differ from C when it comes to strings.
> + *    The D language has a built-in string data type.
> + */
> +
> +/*
> + * Strings are stored in arrays of fixed length.  The
> + * default length 256 can be overridden with a D option.
> + */
> +#pragma D option strsize=3D12
> +
> +/* string variables can be declared explicitly */
> +string exp;
> +string s1, s2, s3, s4;
> +
> +char carray[32];
> +
> +BEGIN
> +{
> + /* strings are truncated, if necessary, per strsize */
> + printf("%s\n", "abcdefghijklmnopqrstuvwxyz");
> +
> + /* string variables can be declared implicitly */
> + imp =3D "abcdefghijklmnopqrstuvwxyz";
> + printf("%d chars, string %s\n", sizeof(imp), imp);
> +
> + /* operators can be used to order strings lexically (akin to strcmp) */
> + exp =3D "zyxwvutsrqponmlkjihgfedcba";
> + printf("%s is %s than %s\n", imp, imp < exp ? "less" : "greater", exp);
> +
> + /* set up NULL-terminated char array for some illustration purposes */
> + carray[ 0] =3D 'A'; carray[ 1] =3D 'B'; carray[ 2] =3D 'C'; carray[ 3] =
=3D 'D';
> + carray[ 4] =3D 'E'; carray[ 5] =3D 'F'; carray[ 6] =3D 'G'; carray[ 7] =
=3D 'H';
> + carray[ 8] =3D 'I'; carray[ 9] =3D 'J'; carray[10] =3D 'K'; carray[11] =
=3D 'L';
> + carray[12] =3D 'M'; carray[13] =3D 'N'; carray[14] =3D 'O'; carray[15] =
=3D 'P';
> + carray[16] =3D 'Q'; carray[17] =3D 'R'; carray[18] =3D 'S'; carray[19] =
=3D 'T';
> + carray[20] =3D 'U'; carray[21] =3D 'V'; carray[22] =3D 'W'; carray[23] =
=3D 'X';
> + carray[24] =3D 'Y'; carray[25] =3D 'Z'; carray[26] =3D '\0';
> +
> + /* char pointers can be turned into strings */
> + s1 =3D (string) carray; /* type casting */
> + s2 =3D stringof carray; /* stringof operator */
> +
> + /* char pointers can be promoted automatically to strings */
> + s3 =3D carray;
> + s4 =3D strchr(carray, 'B');
> +
> + /*
> + * Note that in the above assignments, we did not simply set
> + * a char* to some existing string buffer.  Rather, contents
> + * are copied "by-value" to the destination string buffer.
> + * E.g., if the source buffer is modified, the output strings
> + * nevertheless all stay the same.
> + */
> + carray[2] =3D '\0';
> + printf("%s %s %s %s %s\n", s1, s2, s3, s4, carray);
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/006intro-associative.d b/examples=
/language_features/006intro-associative.d
> new file mode 100755
> index 000000000..b811c6028
> --- /dev/null
> +++ b/examples/language_features/006intro-associative.d
> @@ -0,0 +1,34 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./006intro-associative.d
> + *
> + *  DESCRIPTION
> + *    The D language also supports associative arrays.
> + */
> +
> +/* associative arrays can be declared explicitly by key (if any) and val=
ue types */
> +int exp[string, int];
> +
> +BEGIN
> +{
> + /* associative arrays can also be declared implicitly */
> + imp["hello", 5] =3D 1234;
> +
> + /* values not set are assumed to be 0 */
> + printf("set value is %d; unset value is %d\n",
> +    imp["hello", 5],
> +    exp["hello", 5]);
> +
> + /* when you are done, set a value back to 0 to free the memory */
> + imp["hello", 5] =3D 0;
> +
> + /*
> + * By the way, you cannot promote a char associative array
> + * to a string -- whether with stringof or (string) -- since
> + * it is not a consecutive block of memory holding chars in sequence.
> + */
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/007intro-this-variables.d b/examp=
les/language_features/007intro-this-variables.d
> new file mode 100755
> index 000000000..4d9ba5390
> --- /dev/null
> +++ b/examples/language_features/007intro-this-variables.d
> @@ -0,0 +1,49 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./007intro-this-variables.d
> + *
> + *  DESCRIPTION
> + *    We saw earlier that D supports global variables, allowing
> + *    convenient access from every probe and every thread.  In
> + *    the same way, however, this causes the danger of different
> + *    probes and threads overwriting one another's values.
> + *
> + *    For variables that are to used only within a set of clauses
> + *    for a specific probe, specify "this->".  Such variables have
> + *    undefined values at the start of the set of clauses.
> + */
> +
> +/* "this" variables can be declared explicitly */
> +this int exp;
> +
> +dtrace:::BEGIN
> +{
> + /* the value is undefined by default, define its value */
> + this->exp =3D 1234;
> +
> + /* variables can also be typed implicitly */
> + this->imp =3D 5678;
> +}
> +
> +dtrace:::BEGIN
> +/ 1 =3D=3D 1 /
> +{
> + /* the variables are available in this later clause for the same probe =
*/
> + printf("%d %d\n", this->exp, this->imp);
> +
> + /*
> + * There is no need to zero out this-> variables at the end of a
> + * set of clauses:  they will no longer exist anyhow and their
> + * values when they are used in a different set of clauses, for
> + * some other probe firing, will be undefined at first.
> + */
> +
> + exit(0);
> +}
> +
> +END
> +{
> + /* the variables are not available here, for a different probe */
> +}
> diff --git a/examples/language_features/008intro-self-variables.d b/examp=
les/language_features/008intro-self-variables.d
> new file mode 100755
> index 000000000..68a5dcf59
> --- /dev/null
> +++ b/examples/language_features/008intro-self-variables.d
> @@ -0,0 +1,57 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./008intro-self-variables.d
> + *
> + *  DESCRIPTION
> + *    In D, we can also have variables that are local to a thread.
> + *    We preface them with "self->".
> + */
> +
> +/* Thread-local "self" variables can be declared explicitly */
> +self int exp, dummy;
> +
> +syscall::write:entry
> +{
> + /* we initialize one variable to the fd of the write() call */
> + self->exp =3D arg0;
> +
> + /* we can declare a self->variable implicitly, setting it to the reques=
ted number of bytes */
> + self->imp =3D arg2;
> +}
> +
> +fbt::ksys_write:entry
> +/ self->exp /
> +{
> + self->kernel_value =3D arg2;
> +}
> +
> +/*
> + * We look for a write() return probe on the same thread where
> + * self->exp has been set.  Using thread-local variables allows
> + * us to connect two probes for the same thread, without interference
> + * from other threads.
> + */
> +syscall::write:return
> +/ self->exp /
> +{
> + printf("on fd %d\n", self->exp);
> + printf("bytes (requested): %d\n", self->imp);
> + printf("bytes (requested in kernel function): %d\n", self->kernel_value=
);
> + printf("bytes (actual): %d\n", arg1);
> +
> + /* uninitialized self-> variables are 0 */
> + printf("uninitialized is zero: %d\n", self->dummy);
> +
> + /*
> + * It is good practice to zero out variables when you are
> + * done with them to free up the associated memory.
> + */
> + self->exp =3D 0;
> + self->imp =3D 0;
> + self->kernel_value =3D 0;
> +
> + /* but for this example, we are finished */
> + exit(0);
> +}
> diff --git a/examples/language_features/009intro-pragmas.d b/examples/lan=
guage_features/009intro-pragmas.d
> new file mode 100755
> index 000000000..a4e359976
> --- /dev/null
> +++ b/examples/language_features/009intro-pragmas.d
> @@ -0,0 +1,38 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./009intro-pragmas.d
> + *
> + *  DESCRIPTION
> + *    D options can be set on the command line.  E.g.,
> + *
> + *        sudo /usr/sbin/dtrace -xq ...
> + *        sudo /usr/sbin/dtrace -xw ...
> + *        sudo /usr/sbin/dtrace -xstrsize=3D12 ...
> + *
> + *    They can also be set via pragmas inside a script.
> + *    Respectively,
> + */
> +
> +/* -q */
> +#pragma D option quiet
> +
> +/* -w, e.g., for the system() call */
> +#pragma D option destructive
> +
> +/* -xstrsize=3D12 */
> +#pragma D option strsize=3D12
> +
> +/*
> + * Simple options could alternatively be set on the first
> + * "shebang" line.  E.g., "#!/usr/sbin/dtrace -qws".
> + */
> +
> +dtrace:::BEGIN
> +{
> + /* string truncated to strsize */
> + system("echo abcdefghijklmnopqrstuvwxyz");
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/010intro-external-variables.d b/e=
xamples/language_features/010intro-external-variables.d
> new file mode 100755
> index 000000000..a763a36f6
> --- /dev/null
> +++ b/examples/language_features/010intro-external-variables.d
> @@ -0,0 +1,53 @@
> +#!/usr/sbin/dtrace -s
> +
> +#pragma D option quiet
> +#pragma D option strsize=3D64
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./010intro-external-variables.d
> + *
> + *  DESCRIPTION
> + *    We can examine external variables -- that is, variables from outsi=
de
> + *    the D program, such as kernel variables.  They are distinguished b=
y
> + *    a back quote ` and constitute a different name space from that of
> + *    the D variables.  When such a variables is named, the kernel and a=
ll
> + *    loaded modules are searched for the name.  Or, you can specify a
> + *    module before the back quote.  The kernel itself is module "vmlinu=
x".
> + *    D scripts cannot modify values of kernel variables.
> + *
> + *    Such external variables are not part of D and are subject to chang=
e.
> + */
> +
> +dtrace:::BEGIN
> +{
> +
> + printf("\n=3D=3D=3D=3D print some kernel variables =3D=3D=3D=3D\n\n");
> +
> + printf("cad_pid->level: %d\n", ((struct pid *)`cad_pid)->level);
> + printf("crashing_cpu: %d\n", `crashing_cpu);
> + printf("linux_banner: %s\n", (string)`linux_banner);
> + printf("linux_proc_banner: %s\n", (string)`linux_proc_banner);
> + printf("load averages: %d.%02d, %d.%02d, %d.%02d\n",
> +    `avenrun[0] / 2048, ((`avenrun[0] % 2048) * 100) / 2048,
> +    `avenrun[1] / 2048, ((`avenrun[1] % 2048) * 100) / 2048,
> +    `avenrun[2] / 2048, ((`avenrun[2] % 2048) * 100) / 2048);
> + printf("max_pvn: %d\n", `max_pfn);
> + printf("nr_cpu_ids: %d\n", `nr_cpu_ids);
> + printf("saved_command_line: %s\n", (string)`saved_command_line);
> +
> + printf("\n=3D=3D=3D=3D reprint some of them, explicitly naming vmlinux =
=3D=3D=3D=3D\n\n");
> +
> + printf("crashing_cpu: %d\n", vmlinux`crashing_cpu);
> + printf("linux_banner: %s\n", (string)vmlinux`linux_banner);
> + printf("linux_proc_banner: %s\n", (string)vmlinux`linux_proc_banner);
> + printf("max_pvn: %d\n", vmlinux`max_pfn);
> + printf("nr_cpu_ids: %d\n", vmlinux`nr_cpu_ids);
> +
> + printf("\n=3D=3D=3D=3D refer to a data type in a module =3D=3D=3D=3D\n\=
n");
> +
> + printf("offset of atomic in struct rds_message: %d\n",
> +    offsetof(struct rds`rds_message, atomic));
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/011intro-preprocessor.d b/example=
s/language_features/011intro-preprocessor.d
> new file mode 100755
> index 000000000..1ece9d2d6
> --- /dev/null
> +++ b/examples/language_features/011intro-preprocessor.d
> @@ -0,0 +1,25 @@
> +#!/usr/sbin/dtrace -Cqs
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./011intro-preprocessor.d
> + *
> + *  DESCRIPTION
> + *    D scripts can also use the C preprocessor.  This requires using
> + *    the "dtrace -C" option, or by adding 'C' to the first, shebang
> + *    line, as illustrated above.
> + */
> +
> +#define KEYS "abcde", 12
> +#define DEBUG
> +
> +dtrace:::BEGIN
> +{
> +#ifdef DEBUG
> + printf("\nabcde, 12 should get a count of 1\n");
> +#endif
> +
> + @[KEYS] =3D count();
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/012intro-predicates.d b/examples/=
language_features/012intro-predicates.d
> new file mode 100755
> index 000000000..3e4f7894d
> --- /dev/null
> +++ b/examples/language_features/012intro-predicates.d
> @@ -0,0 +1,52 @@
> +#!/usr/sbin/dtrace -qs
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./012intro-predicates.d
> + *
> + *  DESCRIPTION
> + *    We have already seen that predicates can be used to
> + *    conditionalize execution in a D scripts.  (Other
> + *    mechanisms include speculation and ternary operators.)
> + */
> +
> +BEGIN
> +{
> + ntimes =3D 0;
> +}
> +
> +/*
> + * The write() system call has a file descriptor in arg0 and a
> + * requested number of bytes in arg2.  If a nonzero number of
> + * bytes is requested, take note of the fd.
> + */
> +syscall::write:entry
> +/ (self->nbytes_requested =3D arg2) !=3D 0 /
> +{
> + ntimes++;
> + self->fd =3D arg0;
> +}
> +
> +/*
> + * When the write() system call returns, we know the actual
> + * number of bytes written.  Report it.
> + */
> +syscall::write:return
> +/ self->nbytes_requested !=3D 0 /
> +{
> + printf("fd %d: bytes requested %d, actual %d\n",
> + self->fd, self->nbytes_requested, arg1);
> +
> + /* free memory associated with self-> variables */
> + self->nbytes_requested =3D 0;
> + self->fd =3D 0;
> +}
> +
> +/*
> + * Only report a limited number of times.
> + */
> +syscall::write:return
> +/ ntimes >=3D 5 /
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/100list_probes.sh b/examples/lang=
uage_features/100list_probes.sh
> new file mode 100755
> index 000000000..23bfd0525
> --- /dev/null
> +++ b/examples/language_features/100list_probes.sh
> @@ -0,0 +1,11 @@
> +#!/bin/bash
> +
> +#  SYNOPSIS
> +#    ./100list_probes.sh
> +#
> +#  DESCRIPTION
> +#    List all probes.  There are many.
> +
> +sudo /usr/sbin/dtrace -l | head -10
> +echo "[...]"
> +sudo /usr/sbin/dtrace -l | tail -10
> diff --git a/examples/language_features/101count_probes_by_provider.sh b/=
examples/language_features/101count_probes_by_provider.sh
> new file mode 100755
> index 000000000..e897a1062
> --- /dev/null
> +++ b/examples/language_features/101count_probes_by_provider.sh
> @@ -0,0 +1,12 @@
> +#!/bin/bash
> +
> +#  SYNOPSIS
> +#    ./101count_probes_by_provider.sh
> +#
> +#  DESCRIPTION
> +#    The second column lists probes' providers.  Count how
> +#    many probes there are for each provider.  Use "tail" to
> +#    start at the second line of output, since the first line
> +#    has the column headers, which we want to ignore.
> +
> +sudo /usr/sbin/dtrace -l | tail -n +2 | awk '{print $2}' | sort | uniq -=
c
> diff --git a/examples/language_features/102list_probe_arguments.sh b/exam=
ples/language_features/102list_probe_arguments.sh
> new file mode 100755
> index 000000000..3d6eff537
> --- /dev/null
> +++ b/examples/language_features/102list_probe_arguments.sh
> @@ -0,0 +1,11 @@
> +#!/bin/bash
> +
> +#  SYNOPSIS
> +#    ./102list_probe_arguments.sh
> +#
> +#  DESCRIPTION
> +#    Some providers provide typed arguments for (some of) their
> +#    probes.  Use "dtrace -lv" for a verbose listing to see the
> +#    arguments and their types, if any.
> +
> +sudo /usr/sbin/dtrace -lv -n 'syscall::open:entry'
> diff --git a/examples/language_features/110provider_profile.d b/examples/=
language_features/110provider_profile.d
> new file mode 100755
> index 000000000..7f9e75b7d
> --- /dev/null
> +++ b/examples/language_features/110provider_profile.d
> @@ -0,0 +1,29 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./110provider_profile.d
> + *
> + *  DESCRIPTION
> + *    The profile provider has basically two kinds of probes:
> + *      - profile probes fire on all CPUs each time period
> + *      - tick probes fire only once each time period
> + *    One can specify either a frequency or a time period.
> + */
> +
> +/*
> + *  A profile probe is used with higher frequency to sample
> + *  what is executing on the system.
> + */
> +profile:::profile-10hz
> +{
> + printf("CPU %d: running %s\n", cpu, execname);
> +}
> +
> +/*
> + *  A tick probe is used to fire once to stop data collection.
> + */
> +profile:::tick-2sec
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/120provider_proc.d b/examples/lan=
guage_features/120provider_proc.d
> new file mode 100755
> index 000000000..7c442f39f
> --- /dev/null
> +++ b/examples/language_features/120provider_proc.d
> @@ -0,0 +1,37 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./120provider_proc.d
> + *
> + *  DESCRIPTION
> + *    We can track when processes throughout their life cycle.
> + */
> +
> +proc:::create
> +{
> + printf("%s %s\n", probename, args[0]->pr_fname);
> +}
> +
> +proc:::exec
> +{
> + printf("%s %s\n", probename, args[0]);
> +}
> +
> +proc:::start
> +{
> + printf("%s %s\n", probename, execname);
> +}
> +
> +proc:::exit
> +{
> + printf("%s %s\n", probename, execname);
> +}
> +
> +/*
> + *  A tick probe is used to fire once to stop data collection.
> + */
> +profile:::tick-10sec
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/130provider_sched_on_off_cpu.d b/=
examples/language_features/130provider_sched_on_off_cpu.d
> new file mode 100755
> index 000000000..0d927bc3d
> --- /dev/null
> +++ b/examples/language_features/130provider_sched_on_off_cpu.d
> @@ -0,0 +1,28 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./130provider_sched_on_off_cpu.d
> + *
> + *  DESCRIPTION
> + *    We can track when processes start and end execution
> + *    on a CPU.
> + */
> +
> +sched:::on-cpu
> +{
> + printf("on CPU %d is %s\n", curcpu->cpu_id, curlwpsinfo->pr_name);
> +}
> +
> +sched:::off-cpu
> +{
> + printf("off CPU %d is %s\n", curcpu->cpu_id, args[0]->pr_name);
> +}
> +
> +/*
> + *  A tick probe is used to fire once to stop data collection.
> + */
> +profile:::tick-2sec
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/131provider_sched_enqueue_dequeue=
.d b/examples/language_features/131provider_sched_enqueue_dequeue.d
> new file mode 100755
> index 000000000..c773dc908
> --- /dev/null
> +++ b/examples/language_features/131provider_sched_enqueue_dequeue.d
> @@ -0,0 +1,24 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./131provider_sched_enqueue_dequeue.d
> + *
> + *  DESCRIPTION
> + *    We can track when processes are enqueued and
> + *    dequeued on CPUs.
> + */
> +
> +sched:::dequeue,
> +sched:::enqueue
> +{
> + printf(" %s %s\n", probename, args[0]->pr_name);
> +}
> +
> +/*
> + *  A tick probe is used to fire once to stop data collection.
> + */
> +profile:::tick-2sec
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/140provider_syscall.d b/examples/=
language_features/140provider_syscall.d
> new file mode 100755
> index 000000000..370e7063d
> --- /dev/null
> +++ b/examples/language_features/140provider_syscall.d
> @@ -0,0 +1,20 @@
> +#!/usr/sbin/dtrace -qs
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./140provider_syscall.d
> + *
> + *  DESCRIPTION
> + *    With the syscall provider, you can probe the entry to
> + *    and return from any system call, which is useful for
> + *    watching how a program moves between user space and the
> + *    kernel.
> + */
> +
> +/* probe on entry to system call write() */
> +syscall::write:entry
> +{
> + printf("write %d bytes to fd %d\n", args[2], args[0]);
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/150provider_fbt.d b/examples/lang=
uage_features/150provider_fbt.d
> new file mode 100755
> index 000000000..6dd30e264
> --- /dev/null
> +++ b/examples/language_features/150provider_fbt.d
> @@ -0,0 +1,48 @@
> +#!/usr/sbin/dtrace -qs
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./150provider_fbt.d
> + *
> + *  DESCRIPTION
> + *    Function boundary tracing (fbt) can be used to trace the
> + *    beginning and end of just about any function in the kernel.
> + *    As such, it is very powerful.
> + *
> + *    That said, there are some challenges:
> + *
> + *      - One must know the kernel fairly well.  There may
> + *        be tens of thousands of functions available to trace.
> + *
> + *      - Functions that can be traced will vary from one
> + *        kernel build to another.  For example, a function
> + *        might be inlined in a kernel build, making that
> + *        function not traceable in that build.
> + *
> + *    Also, there are both:
> + *
> + *      - an fbt provider, which supports typed probe arguments
> + *        (seen with "dtrace -lvP fbt")
> + *
> + *      - a rawfbt provider, whose probe arguments are not typed
> + *        nor specially ordered;  traceable functions include
> + *        compiler-generated optimized variants of functions,
> + *        named <func>.<suffix>.
> + */
> +
> +/* probe on entry to kernel function ksys_write() */
> +fbt::ksys_write:entry
> +{
> + printf("write %d bytes to fd %d\n", args[2], args[0]);
> +}
> +
> +/* do the same thing with a rawfbt probe, so the args are not typed */
> +rawfbt::ksys_write:entry
> +{
> + printf("write %d bytes to fd %d\n", arg2, arg0);
> +}
> +
> +fbt::ksys_write:return
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/160provider_sdt_rawtp.sh b/exampl=
es/language_features/160provider_sdt_rawtp.sh
> new file mode 100755
> index 000000000..92ac621eb
> --- /dev/null
> +++ b/examples/language_features/160provider_sdt_rawtp.sh
> @@ -0,0 +1,36 @@
> +#!/bin/bash
> +
> +#  SYNOPSIS
> +#    ./160provider_sdt_rawtp.sh
> +#
> +#  DESCRIPTION
> +#    Statically Defined Tracing (SDT) refers to probes placed
> +#    in the kernel source code by kernel developers to support
> +#    tracing in stable, semantically meaningful terms.  In the
> +#    case of Linux, this means tracepoints.
> +
> +# You can see these tracepoints via the sdt provider.
> +sudo /usr/sbin/dtrace -lP sdt
> +
> +# You can see the exact same probes via the rawtp provider.
> +sudo /usr/sbin/dtrace -lP rawtp
> +
> +# The difference is that the rawtp provider gives DTrace users
> +# access to the raw tracepoints exposed by the kernel tracing
> +# system, including access to the untranslated arguments of the
> +# associated tracepoint events.  Regular tracepoints often expose
> +# translated arguments based on the raw arguments that were passed
> +# in the tracepoint call.
> +
> +# For example, the DTrace sched provider implements the "off-cpu"
> +# probe by using "rawtp:sched::sched_switch" and the "wakeup" probe
> +# by using "rawtp:sched::sched_wakeup".  We can see how the typed
> +# arguments for these probes depend on whether we are using the
> +# sdt or the rawtp provider:
> +
> +sudo /usr/sbin/dtrace -lvn :sched::sched_switch | grep args
> +sudo /usr/sbin/dtrace -lvn :sched::sched_wakeup | grep args
> +
> +# Here, the module "sched" is named, but the provider name,
> +# expected before the first colon ":", is left blank as a
> +# wildcard to pick up both providers with these probes.
> diff --git a/examples/language_features/170provider_lockstat.sh b/example=
s/language_features/170provider_lockstat.sh
> new file mode 100755
> index 000000000..de7913a82
> --- /dev/null
> +++ b/examples/language_features/170provider_lockstat.sh
> @@ -0,0 +1,17 @@
> +#!/bin/bash
> +
> +#  SYNOPSIS
> +#    ./170provider_lockstat.sh
> +#
> +#  DESCRIPTION
> +#    The lockstat provider can be used to study lock usage.
> +#    For example, here we count how many times spin locks
> +#    and adaptive locks are acquired by the command "date".
> +
> +sudo /usr/sbin/dtrace -qn '
> +lockstat:::spin-acquire,
> +lockstat:::adaptive-acquire
> +/pid =3D=3D $target/
> +{
> + @locks[probename] =3D count();
> +}' -c date
> diff --git a/examples/language_features/171provider_io.d b/examples/langu=
age_features/171provider_io.d
> new file mode 100755
> index 000000000..b91ba6cf5
> --- /dev/null
> +++ b/examples/language_features/171provider_io.d
> @@ -0,0 +1,31 @@
> +#!/usr/sbin/dtrace -qs
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./171provider_io.d
> + *
> + *  DESCRIPTION
> + *    The io provider can be used to study I/O operations.
> + *    For example, here we print whenever an I/O operation
> + *    is started over the course of ten seconds, reporting
> + *    the device name and whether it is a read or write
> + *    operation.  Consult the documentation for more
> + *    information on the probes and their arguments.
> + */
> +
> +BEGIN
> +{
> + printf("%10s %2s\n", "DEVICE", "RW");
> +}
> +
> +io:::start
> +{
> + printf("%10s %2s\n",
> +    args[1]->dev_statname,
> +    args[0]->b_flags & B_READ ? "R" : "W");
> +}
> +
> +tick-10s
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/172provider_ip.d b/examples/langu=
age_features/172provider_ip.d
> new file mode 100755
> index 000000000..dce852fbd
> --- /dev/null
> +++ b/examples/language_features/172provider_ip.d
> @@ -0,0 +1,26 @@
> +#!/usr/sbin/dtrace -qs
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./172provider_ip.d
> + *
> + *  DESCRIPTION
> + *    The ip provider can be used to study IP communications.
> + *    Here is an example that tracks sends and receives,
> + *    reporting their source and destination addresses for
> + *    10 seconds.
> + *
> + *    Consult the documentation for further information about
> + *    ip probe arguments.
> + */
> +
> +ip:::send,
> +ip:::receive
> +{
> + printf("%s: from %s to %s\n", probename, args[2]->ip_saddr, args[2]->ip=
_daddr);
> +}
> +
> +tick-10s
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/180provider_cpc.d b/examples/lang=
uage_features/180provider_cpc.d
> new file mode 100755
> index 000000000..a2ce8b271
> --- /dev/null
> +++ b/examples/language_features/180provider_cpc.d
> @@ -0,0 +1,52 @@
> +#!/usr/sbin/dtrace -qs
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./180provider_cpc.d
> + *
> + *  DESCRIPTION
> + *    The cpc (CPU Performance Counter) provider can be used
> + *    profile activity based on hardware performance counters.
> + *
> + *    For a list of cpc probes, use "dtrace -lP cpc".
> + *
> + *    Probe specifications are of the form:
> + *
> + *        cpc:::<event name>-<mode>-<count>
> + *
> + *    The "event name" tells you which counters are available
> + *    on your hardware.
> + *
> + *    The "mode" can be "kernel", "user", or "all", even if
> + *    only "all" is listed.
> + *
> + *    The "count" indicates how many times the event is seen
> + *    before the probe fires.  If the listed "count" is not
> + *    suitable for your purposes, you can specify a different
> + *    value.  It is usually best to start with a higher value,
> + *    decreasing it if there are not enough probe firings,
> + *    rather than starting too low and inundating your system
> + *    with very many probe firings.
> + *
> + *    Here, an event perf_count_sw_cpu_clock-all-1000000000
> + *    was listed by "dtrace -lP cpc".  We tweak the "mode"
> + *    and "count" for our purposes.  The probe will fire every
> + *    300 usecs of kernel activity.  We use aggregations to
> + *    count how many times each call stack is seen.  The
> + *    aggregation will be printed by default when the D
> + *    script exits, after 10 seconds.
> + *
> + *    Consult the documentation for further information about
> + *    cpc probes.
> + */
> +
> +cpc:::perf_count_sw_cpu_clock-kernel-300000000
> +{
> + @[stack()] =3D count();
> +}
> +
> +/* run for only 10 seconds */
> +tick-10s
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/200built-in-variables-probe.d b/e=
xamples/language_features/200built-in-variables-probe.d
> new file mode 100755
> index 000000000..5d7e97260
> --- /dev/null
> +++ b/examples/language_features/200built-in-variables-probe.d
> @@ -0,0 +1,18 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./200built-in-variables-probe.d
> + *
> + *  DESCRIPTION
> + *    We can get a probe's name components when it fires.
> + *    The fully qualified name is provider:module:function:name,
> + *    which we get with the built-in variables probeprov,
> + *    probemod, probefunc, and probename, respectively.
> + */
> +
> +syscall:::entry
> +{
> + printf("%s:%s:%s:%s\n", probeprov, probemod, probefunc, probename);
> + exit(0);
> +}
> diff --git a/examples/language_features/201built-in-variables-timestamps.=
d b/examples/language_features/201built-in-variables-timestamps.d
> new file mode 100755
> index 000000000..c07ee0456
> --- /dev/null
> +++ b/examples/language_features/201built-in-variables-timestamps.d
> @@ -0,0 +1,31 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./201built-in-variables-timestamps.d
> + *
> + *  DESCRIPTION
> + *    Built-in variables provide timestamps:
> + *
> + *    - timestamp counts nanoseconds since
> + *      some arbitrary point in the past.
> + *      Use differences between values to measure
> + *      elapsed time.  The value is captured only
> + *      once per clause.
> + *
> + *    - walltimestamp counts nanoseconds since
> + *      00:00 Universal Coordinated Time, January 1, 1970.
> + */
> +
> +dtrace:::BEGIN
> +{
> + printf("\n%d %d\n", timestamp, walltimestamp);
> + printf(  "%d %d\n", timestamp, walltimestamp);
> +}
> +
> +dtrace:::BEGIN
> +{
> + printf("\n%d %d\n", timestamp, walltimestamp);
> + printf(  "%d %d\n", timestamp, walltimestamp);
> + exit(0);
> +}
> diff --git a/examples/language_features/202built-in-variables-args.d b/ex=
amples/language_features/202built-in-variables-args.d
> new file mode 100755
> index 000000000..192fff8e1
> --- /dev/null
> +++ b/examples/language_features/202built-in-variables-args.d
> @@ -0,0 +1,28 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./202built-in-variables-args.d
> + *
> + *  DESCRIPTION
> + *    A probe's arguments can be accessed through the built-in
> + *    variables arg0, arg1, arg2, etc.  These are all signed,
> + *    64-bit integers, whose meanings depend on the probe.
> + *
> + *    Some probes have typed arguments args[0], args[1], args[2],
> + *    etc.  To see the types, use "dtrace -lvn $probe".  Their
> + *    meanings are described in the documentation.
> + *
> + *    When arguments are typed, they may also be reordered.
> + *    So there may be no correspondence between, say, arg0
> + *    and args[0].
> + *
> + *    Typically, it is better to use the typed args[] when
> + *    the probe has them.
> + */
> +
> +syscall::write:entry
> +{
> + printf("Write %d bytes to fd %d\n", args[2], arg0);
> + exit(0);
> +}
> diff --git a/examples/language_features/203built-in-variables-process-inf=
o.d b/examples/language_features/203built-in-variables-process-info.d
> new file mode 100755
> index 000000000..82600ba9e
> --- /dev/null
> +++ b/examples/language_features/203built-in-variables-process-info.d
> @@ -0,0 +1,31 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./203built-in-variables-process-info.d
> + *
> + *  DESCRIPTION
> + *    A number of built-in variables describe the process
> + *    that is running.
> + */
> +
> +syscall::write:entry
> +{
> + printf("\n\n");
> + printf("The CPU is %d (%d).\n", curcpu->cpu_id, cpu);
> +
> + printf("\n");
> + printf("The exec name can be accessed through\n");
> + printf("    the struct task_struct: %s\n", curthread->comm);
> + printf("    or a built-in variable: %s\n", execname);
> +
> + printf("\n");
> + printf("The execargs are: %s\n", execargs);
> +
> + printf("\n");
> + printf("The group id and user id are %d and %d.\n", gid, uid);
> + printf("The process id and thread id are %d and %d.\n", pid, tid);
> + printf("The parent process id is %d.\n\n", ppid);
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/204built-in-variables-uregs.d b/e=
xamples/language_features/204built-in-variables-uregs.d
> new file mode 100755
> index 000000000..55e333218
> --- /dev/null
> +++ b/examples/language_features/204built-in-variables-uregs.d
> @@ -0,0 +1,31 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./204built-in-variables-uregs.d
> + *
> + *  DESCRIPTION
> + *    The uregs[] array can be used to access the current thread's
> + *    saved user-mode register values at probe firing time.  The
> + *    available registers depend on the chip architecture:
> + *
> + *    - x86_64
> + *        R_SP R_PC R_FP R_TRAPNO R_ERR
> + *        R_CS R_DS R_ES R_FS R_GS R_PS R_SS
> + *        R_RSP R_EBP R_RFL R_RIP R_RDI R_RSI R_RAX R_RBX R_RCX R_RDX
> + *        R_ESP R_RBP R_EFL R_EIP R_EDI R_ESI R_EAX R_EBX R_ECX R_EDX
> + *        R_R0 R_R1 R_R8 R_R9 R_R10 R_R11 R_R12 R_R13 R_R14 R_R15
> + *
> + *    - aarch64:
> + *        R_SP R_PC R_PSTATE R_FP
> + *        R_X0 R_X1 R_X2 R_X3 R_X4 R_X5 R_X6 R_X7 R_X8 R_X9
> + *        R_X10 R_X11 R_X12 R_X13 R_X14 R_X15 R_X16 R_X17 R_X18 R_X19
> + *        R_X20 R_X21 R_X22 R_X23 R_X24 R_X25 R_X26 R_X27 R_X28 R_X29
> + *        R_X30
> + */
> +
> +BEGIN
> +{
> + printf("0x%x 0x%x\n", uregs[R_PC], uregs[R_SP]);
> + exit(0);
> +}
> diff --git a/examples/language_features/300actions-exit.sh b/examples/lan=
guage_features/300actions-exit.sh
> new file mode 100755
> index 000000000..fea6cb50d
> --- /dev/null
> +++ b/examples/language_features/300actions-exit.sh
> @@ -0,0 +1,18 @@
> +#!/bin/bash
> +
> +# SYNOPSIS
> +#   sudo ./300actions-exit.sh
> +#
> +# DESCRIPTION
> +#   The exit() action terminates the script, returning an
> +#   unsigned 8-bit integer value.
> +
> +/usr/sbin/dtrace -n '
> +BEGIN
> +{
> + x =3D 123;
> + y =3D 456;
> + exit(x < y ? x : y);
> +}'
> +
> +echo $?
> diff --git a/examples/language_features/301actions-print.d b/examples/lan=
guage_features/301actions-print.d
> new file mode 100755
> index 000000000..0b3742644
> --- /dev/null
> +++ b/examples/language_features/301actions-print.d
> @@ -0,0 +1,32 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./301actions-print.d
> + *
> + *  DESCRIPTION
> + *    There are multiple ways to examine data values.
> + */
> +
> +BEGIN
> +{
> + /* printf() is a C-like formatted print */
> + /* note:  %d can be used with any size of integer */
> + printf("%c %d %s\n", 'a', 1234ll, "hello");
> +
> + /* trace() uses data-type information to format */
> + trace('a');
> + trace(1234);
> + trace("hello");
> +
> + /* tracemem() dumps a specified number of bytes */
> + tracemem(`linux_banner, 64);
> +
> + /*
> + * print() uses data-type information to print and annotate
> + * contents at a pointer
> + */
> + print(curthread);
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/302actions-strings.d b/examples/l=
anguage_features/302actions-strings.d
> new file mode 100755
> index 000000000..097eff064
> --- /dev/null
> +++ b/examples/language_features/302actions-strings.d
> @@ -0,0 +1,45 @@
> +#!/usr/sbin/dtrace -s
> +
> +#pragma D option quiet
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./302actions-strings.d
> + *
> + *  DESCRIPTION
> + *    There are functions to manipulate strings.
> + */
> +
> +BEGIN
> +{
> + /* find the length of a string */
> + printf("length of 'abcde' is %d\n", strlen("abcde"));
> +
> + /* various other functions also resemble libc */
> + printf("text starts with first 'd': %s\n", strchr("abcdefedbca", 'd'));
> + printf("text starts with last 'd': %s\n", strrchr("abcdefedbca", 'd'));
> + printf("text starts with 'def': %s\n", strstr("abcdefedbca", "def"));
> +
> + /* break a string up into tokens */
> + printf("token #1: %s\n", strtok("hello world", " "));
> + printf("token #2: %s\n", strtok(NULL, " "));
> +
> + /* join (concatenate) strings */
> + printf("join 'abc' and 'def': %s\n", strjoin("abc", "def"));
> +
> + /* dump part of a string */
> + printf("start at char #4: %s\n", substr("abcdefghij", 4));
> +
> + /* dump part of a string, only 2 chars */
> + printf("start at char #4: %s\n", substr("abcdefghij", 4, 2));
> +
> + /* find index of a substring */
> + printf("found at char #%d\n", index("abcdefghij", "def"));
> + printf("found at char #%d\n", rindex("abcdefghij", "def"));
> + printf("found at char #%d\n", index("abcdefghij", "XXXX"));
> +
> + /* convert an integer to a string */
> + printf("123000 + 456 =3D %s\n", lltostr(123000 + 456));
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/303actions-strings-paths.d b/exam=
ples/language_features/303actions-strings-paths.d
> new file mode 100755
> index 000000000..9588d08f5
> --- /dev/null
> +++ b/examples/language_features/303actions-strings-paths.d
> @@ -0,0 +1,25 @@
> +#!/usr/sbin/dtrace -s
> +
> +#pragma D option quiet
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./303actions-strings-paths.d
> + *
> + *  DESCRIPTION
> + *    There are functions to manipulate strings, specifically path names=
.
> + */
> +
> +BEGIN
> +{
> + /* find the base name of a path */
> + printf("base is %s\n", basename("/usr/sbin/dtrace"));
> +
> + /* find the directory of a path */
> + printf("directory is %s\n", dirname("/usr/sbin/dtrace"));
> +
> + /* clean up a path name */
> + printf("cleaned up path is %s\n", cleanpath("////usr/bin/../sbin/././//=
dtrace"));
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/304actions-system.d b/examples/la=
nguage_features/304actions-system.d
> new file mode 100755
> index 000000000..001566808
> --- /dev/null
> +++ b/examples/language_features/304actions-system.d
> @@ -0,0 +1,22 @@
> +#!/usr/sbin/dtrace -s
> +
> +#pragma D option quiet
> +#pragma D option destructive
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./304actions-system.d
> + *
> + *  DESCRIPTION
> + *    One can launch system calls from within D script,
> + *    but this must be explicitly allowed with the "destructive"
> + *    option or dtrace -w switch.
> + */
> +
> +BEGIN
> +{
> + system("ls");
> + system("echo hello world");
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/305actions-progenyof.d b/examples=
/language_features/305actions-progenyof.d
> new file mode 100755
> index 000000000..2aa3e8ea3
> --- /dev/null
> +++ b/examples/language_features/305actions-progenyof.d
> @@ -0,0 +1,20 @@
> +#!/usr/sbin/dtrace -s
> +
> +#pragma D option quiet
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./305actions-progenyof.d
> + *
> + *  DESCRIPTION
> + *    One can test whether one is progeny of another process.
> + */
> +
> +BEGIN
> +{
> + printf("I am%s progeny of pid 1234\n", progenyof(1234) ? "" : " not");
> + printf("I am%s progeny of myself\n", progenyof(pid) ? "" : " not");
> + printf("I am%s progeny of my parent\n", progenyof(ppid) ? "" : " not");
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/306actions-speculations.d b/examp=
les/language_features/306actions-speculations.d
> new file mode 100755
> index 000000000..7e0d21370
> --- /dev/null
> +++ b/examples/language_features/306actions-speculations.d
> @@ -0,0 +1,57 @@
> +#!/usr/sbin/dtrace -s
> +
> +#pragma D option quiet
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./306actions-speculations.d
> + *
> + *  DESCRIPTION
> + *    In DTrace, one can write output speculatively, deciding at a
> + *    later time whether to commit or discard the speculative output.
> + */
> +#pragma D option nspec=3D2
> +
> +BEGIN
> +{
> + /* create two speculations */
> + s1 =3D speculation();
> + s2 =3D speculation();
> +}
> +
> +BEGIN
> +{
> + /* the clause has "speculate()" before data recording */
> + speculate(s1);
> + printf("one\n");
> +}
> +
> +BEGIN
> +{
> + speculate(s2);
> + printf("two\n");
> +}
> +
> +BEGIN
> +{
> + speculate(s1);
> + printf("three\n");
> +}
> +
> +BEGIN
> +{
> + speculate(s2);
> + printf("four\n");
> +}
> +
> +BEGIN
> +{
> + commit(s1);  /* commit "one" "three" output */
> + discard(s2);  /* discard "two" "four" output */
> +}
> +
> +BEGIN
> +{
> + /* cannot be in same clause as commit/discard */
> + exit(0);
> +}
> diff --git a/examples/language_features/307actions-callstack.d b/examples=
/language_features/307actions-callstack.d
> new file mode 100755
> index 000000000..8e3d6fe47
> --- /dev/null
> +++ b/examples/language_features/307actions-callstack.d
> @@ -0,0 +1,54 @@
> +#!/usr/sbin/dtrace -qs
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./307actions-callstack.d
> + *
> + *  DESCRIPTION
> + *    In DTrace, one can get information about the call stack.
> + */
> +
> +/* have a probe fire somewhere in the kernel */
> +fbt::ksys_write:entry
> +{
> + /* dump the kernel call stack */
> + stack();
> +
> + /* a built-in variable gives the number of frames */
> + printf("%d frames\n", stackdepth);
> +
> + /* another built-in variable gives the caller PC */
> + printf("second frame is the caller %p\n", caller);
> +
> + /* we can get the symbolic name of its module */
> + printf(  "  module   ");  mod(caller);
> +
> + /* we can get the symbolic name of its function */
> + printf("\n  function "); func(caller);
> +
> + /* sym() is an alias for func() */
> + printf("\n  =3D=3D symbol");  sym(caller);
> +
> + /*
> + * Similarly, we can also get the user-space call stack
> + * through ustack().  The related built-in variables are
> + * ustackdepth and ucaller.  Conversion to symbolic names
> + * can be made via umod(), ufunc(), usym(), and uaddr().
> + * User-space call stacks face a few challenges:
> + *
> + * - The BPF helper functions rely on frame-pointer
> + *   chasing, which can be impaired or even incorrect
> + *   unless -fno-omit-frame-pointer is specified.
> + *
> + * - Conversion to symbolic names does not take place when
> + *   the probe fires but later, in user space, when results
> + *   are printed.  It is possible that the user application
> + *   has already terminated and the information about its
> + *   address space gone.
> + *
> + * - For a stripped executable, you must specify
> + *   --export-dynamic when linking the program.
> + */
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/310actions-alloca-copy.d b/exampl=
es/language_features/310actions-alloca-copy.d
> new file mode 100755
> index 000000000..1a48c696b
> --- /dev/null
> +++ b/examples/language_features/310actions-alloca-copy.d
> @@ -0,0 +1,95 @@
> +#!/usr/sbin/dtrace -qs
> +
> +#pragma D option strsize=3D32
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./310actions-alloca-copy.d
> + *
> + *  DESCRIPTION
> + *    A DTrace program has scratch memory that it manages
> + *    for its own purposes.  The program can allocate scratch
> + *    memory as well as copy into, out of, and between buffers.
> + *    It is automatically freed at the end of each clause.
> + */
> +
> +/* alloca */
> +BEGIN
> +{
> + /* alloca() a string */
> + ptr =3D (string *) alloca(32);
> +
> + /* set its contents (truncated to strsize chars, including NUL) */
> + *ptr =3D "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
> +
> + /* print it */
> + trace(*ptr);
> +
> + /* end of the clause:  ptr is freed */
> +}
> +
> +/* bcopy */
> +BEGIN
> +{
> + /* alloca() a string */
> + ptr =3D (string *) alloca(32);
> +
> + /* copy from kernel memory to scratch memory */
> + bcopy(`linux_banner, ptr, 32);
> +
> + /* print it */
> + printf("\n%s", *ptr);
> +
> + /* end of the clause:  ptr is freed */
> +}
> +
> +/* copyinto */
> +syscall::write:entry
> +{
> + /* alloca() a string */
> + ptr =3D (string *) alloca(32);
> +
> + /* copy from user space into scratch memory */
> + copyinto(arg1, 32, ptr);
> +
> + /* print it */
> + printf("\n%s to fd %d, %d bytes", *ptr, arg0, arg2);
> +
> + /* end of the clause:  ptr is freed */
> +}
> +
> +/* copyin */
> +syscall::write:entry
> +{
> + /* copy from user space to scratch memory, allocating the pointer */
> + ptr =3D copyin(arg1, 32);
> +
> + /* print it */
> + printf("\n%s to fd %d, %d bytes", *ptr, arg0, arg2);
> +
> + /* end of the clause:  ptr is freed */
> +}
> +
> +/* copyinstr */
> +syscall::write:entry
> +{
> + /* copy string from user space to scratch memory, allocating the pointe=
r */
> + str =3D copyinstr(arg1);
> +
> + /* print it */
> + printf("\n%s to fd %d, %d bytes", str, arg0, arg2);
> +
> + /* end of the clause:  ptr is freed */
> +}
> +
> +/*
> + * There are also copyout() and copyoutstr() functions, that may be
> + * used to copy from scratch memory to user-space buffers.  Since they
> + * alter the behavior of the user code, the "destructive" option -w
> + * must be specified.
> + */
> +
> +syscall::write:entry
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/311actions-rand.d b/examples/lang=
uage_features/311actions-rand.d
> new file mode 100755
> index 000000000..54500fb3b
> --- /dev/null
> +++ b/examples/language_features/311actions-rand.d
> @@ -0,0 +1,25 @@
> +#!/usr/sbin/dtrace -qs
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./311actions-rand.d
> + *
> + *  DESCRIPTION
> + *    The rand() function generates a random integer.
> + */
> +
> +BEGIN
> +{
> + printf(" %3d\n", rand() & 0xff);
> + printf(" %3d\n", rand() & 0xff);
> + printf(" %3d\n", rand() & 0xff);
> + printf(" %3d\n", rand() & 0xff);
> + printf(" %3d\n", rand() & 0xff);
> + printf(" %3d\n", rand() & 0xff);
> + printf(" %3d\n", rand() & 0xff);
> + printf(" %3d\n", rand() & 0xff);
> + printf(" %3d\n", rand() & 0xff);
> + printf(" %3d\n", rand() & 0xff);
> +
> + exit(0);
> +}
> diff --git a/examples/language_features/500aggregations-intro.d b/example=
s/language_features/500aggregations-intro.d
> new file mode 100755
> index 000000000..54b5cbe6b
> --- /dev/null
> +++ b/examples/language_features/500aggregations-intro.d
> @@ -0,0 +1,24 @@
> +#!/usr/sbin/dtrace -s
> +
> +#pragma D option quiet
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./500aggregations-intro.d
> + *
> + *  DESCRIPTION
> + *    Aggregations can be used to collect statistical data on
> + *    some value.  Results are printed by default when the
> + *    script terminates.
> + */
> +
> +tick-20hz
> +{
> + /* do not even bother naming the aggregation;  just "@" */
> + @ =3D count();
> +}
> +
> +tick-1sec
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/501aggregations-names-keys.d b/ex=
amples/language_features/501aggregations-names-keys.d
> new file mode 100755
> index 000000000..06ede5301
> --- /dev/null
> +++ b/examples/language_features/501aggregations-names-keys.d
> @@ -0,0 +1,19 @@
> +#!/usr/sbin/dtrace -s
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./501aggregations-names-keys.d
> + *
> + *  DESCRIPTION
> + *    Aggregations can be named or use keys.
> + */
> +
> +tick-20hz
> +{
> + @my_count[(timestamp % 2 =3D=3D 0) ? "even" : "odd"] =3D count();
> +}
> +
> +tick-1sec
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/502aggregations-basic-funcs.d b/e=
xamples/language_features/502aggregations-basic-funcs.d
> new file mode 100755
> index 000000000..b55a42117
> --- /dev/null
> +++ b/examples/language_features/502aggregations-basic-funcs.d
> @@ -0,0 +1,26 @@
> +#!/usr/sbin/dtrace -s
> +
> +# pragma D option quiet
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./501aggregations-basic-funcs.d
> + *
> + *  DESCRIPTION
> + *    Aggregations can include basic statistical functions.
> + */
> +
> +tick-20hz
> +{
> + @my_count["count"] =3D count();
> + @my_sum["sum"] =3D sum(timestamp);
> + @my_avg["average"] =3D avg(timestamp);
> + @my_stddev["standard deviation"] =3D stddev(timestamp);
> + @my_min["minimum"] =3D min(timestamp);
> + @my_max["maximum"] =3D max(timestamp);
> +}
> +
> +tick-1sec
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/503aggregations-stack.d b/example=
s/language_features/503aggregations-stack.d
> new file mode 100755
> index 000000000..3e297c34b
> --- /dev/null
> +++ b/examples/language_features/503aggregations-stack.d
> @@ -0,0 +1,24 @@
> +#!/usr/sbin/dtrace -s
> +
> +# pragma D option quiet
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./503aggregations-stack.d
> + *
> + *  DESCRIPTION
> + *    An interesting key to use is "stack()", giving you
> + *    information, for example, about hot kernel call stacks.
> + *    Each distinct kernel call stack found will be reported
> + *    along with the number of times it was encountered.
> + */
> +
> +tick-20hz
> +{
> + @[stack()] =3D count();
> +}
> +
> +tick-1sec
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/504aggregations-printa.d b/exampl=
es/language_features/504aggregations-printa.d
> new file mode 100755
> index 000000000..6867511e2
> --- /dev/null
> +++ b/examples/language_features/504aggregations-printa.d
> @@ -0,0 +1,29 @@
> +#!/usr/sbin/dtrace -s
> +
> +# pragma D option quiet
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./504aggregations-printa.d
> + *
> + *  DESCRIPTION
> + *    While aggregations are printed by default when the D
> + *    script terminates, it can be useful to print aggregations
> + *    explicitly using the printa() function -- either to use
> + *    detailed formatting or if results should be printed
> + *    while the script is still running.  In addition to the
> + *    usual formatting directives used by printf(), printa()
> + *    also uses "@" directives for the aggregation values.
> + */
> +
> +tick-20hz
> +{
> + @["key"] =3D count();
> +}
> +
> +tick-1sec
> +{
> + printa("KEY BEFORE VALUE: %s %@d\n", @);
> + printa("VALUE BEFORE KEY: %@d %s\n", @);
> + exit(0);
> +}
> diff --git a/examples/language_features/505aggregations-quantize.d b/exam=
ples/language_features/505aggregations-quantize.d
> new file mode 100755
> index 000000000..5ae382843
> --- /dev/null
> +++ b/examples/language_features/505aggregations-quantize.d
> @@ -0,0 +1,65 @@
> +#!/usr/sbin/dtrace -s
> +
> +# pragma D option quiet
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./505aggregations-quantize.d
> + *
> + *  DESCRIPTION
> + *    While avg(), stddev(), min(), and max() are useful for
> + *    characterizing the distribution of values crudely, one
> + *    may also be interested in more detail on a distribution.
> + *
> + *    Aggregations can count by value after the value has been
> + *    "quantized" -- that is, grouped into bins.
> + */
> +
> +BEGIN
> +{
> + /* time origin at the beginning of the script's execution */
> + t0 =3D timestamp;
> +
> + /* for this example, use some dummy value that will change in scale */
> + dummy =3D t0;
> +}
> +
> +tick-20hz
> +{
> + /*
> + * If you have no sense for the distribution of values --
> + * not even of the scale -- then quantize(val) can be a
> + * good starting point.  Its only input parameter is the
> + * value.  Bins are powers of two -- you reduce values
> + * log2() -- giving you a sense of the scale of the values.
> + */
> + @crude =3D quantize(dummy >>=3D 1);
> +
> + /*
> + * But perhaps you know the scale and want to chop some
> + * range of values up linearly.  So we use lquantize().
> + */
> + @linear =3D lquantize(
> +    (timestamp - t0) / 1000000, /* number of msecs since D script start =
*/
> +    0, /* lower bound */
> +    2000, /* upper bound (msecs in 2 secs) */
> +    200); /* number per bin */
> +
> + /*
> + * Finally, and this is a little complicated, what if you
> + * liked the original, logarithmic quantization, but you
> + * just want a little more detail.  Then, there is a
> + * log-linear quantization.
> + */
> + @log_linear =3D llquantize(
> +    dummy, /* number of msecs since some arbitrary time in the past */
> +    100, /* use log10() */
> +    3, /* lower bound is 10 to the 3 =3D 1000 */
> +    5, /* upper bound is 10 to the 9 =3D 1000000000 */
> +    4); /* number of steps per logarithmic range */
> +}
> +
> +tick-2sec
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/506aggregations-clear-trunc.d b/e=
xamples/language_features/506aggregations-clear-trunc.d
> new file mode 100755
> index 000000000..26314d8a8
> --- /dev/null
> +++ b/examples/language_features/506aggregations-clear-trunc.d
> @@ -0,0 +1,63 @@
> +#!/usr/sbin/dtrace -s
> +
> +# pragma D option quiet
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./506aggregations-clear-trunc.d
> + *
> + *  DESCRIPTION
> + *    Here, we show clear() and trunc(), used with aggregations.
> + *
> + *    One reason to use printa() is to get aggregation values
> + *    periodically while the D script is executing.  In that
> + *    case, however, you may want to reset the aggregations.
> + *    There are two ways of doing so.
> + */
> +
> +tick-20hz
> +{
> + /* in this example, consider two aggregations */
> +
> + /*
> + * "parity" counts whether the timestamp is even or odd.
> + * In each one-second time interval, both cases should
> + * get some values.
> + */
> + @parity[(timestamp & 1) ? "odd" : "even"] =3D count();
> +
> + /*
> + * "low_bits" counts how often the low bits (0-255) appear.
> + * It is reasonable that some keys will not reappear.
> + */
> + @low_bits[timestamp & 0xff] =3D count();
> +}
> +
> +tick-1sec
> +{
> + /*
> + * Every second, we print the values for the recent
> + * one-second interval.
> + */
> + printa("parity: %-4s %@2d\n", @parity);
> + printa("low bits: %3d %@d\n", @low_bits);
> +
> + /*
> + * We clear out the "parity" values, leaving the keys,
> + * since almost surely those keys will recur.  And if
> + * a key ends up with no counts, we want to know about it!
> + */
> + clear(@parity);
> +
> + /*
> + * We trunc() (truncate) "low_bits", however, since keys
> + * might not reoccur.  Unused keys take up memory and
> + * pollute the periodic output.
> + */
> + trunc(@low_bits);
> +}
> +
> +tick-4sec
> +{
> + exit(0);
> +}
> diff --git a/examples/language_features/507aggregations-trunc5.d b/exampl=
es/language_features/507aggregations-trunc5.d
> new file mode 100755
> index 000000000..ca5fdae02
> --- /dev/null
> +++ b/examples/language_features/507aggregations-trunc5.d
> @@ -0,0 +1,50 @@
> +#!/usr/sbin/dtrace -s
> +
> +# pragma D option quiet
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./507aggregations-trunc5.d
> + *
> + *  DESCRIPTION
> + *    Here, is another use of trunc() -- with an additional
> + *    argument to focus attention on the top values.
> + */
> +
> +BEGIN
> +{
> + /*
> + * The mask will change size.  When it is wide, it will
> + * spread values over many keys.  When it is narrow, it
> + * will concentrate values over a few keys.  So, some
> + * keys will get many values, while others will get few.
> + */
> + mask =3D 255;
> +}
> +
> +tick-100hz
> +{
> + /* the aggregation */
> + @[timestamp & mask] =3D count();
> +
> + /* update the mask */
> + mask >>=3D 1;
> + mask =3D (mask =3D=3D 0) ? 255 : mask;
> +}
> +
> +tick-1sec
> +{
> + printf("entire result\n");
> + printa("    %3d %@3d\n", @);
> +
> + trunc(@, 5);
> +
> + printf("top 5 keys\n");
> + printa("    %3d %@3d\n", @);
> +
> + /*
> + * On exit, we will no longer print the aggregation
> + * by default, since it was just printed.
> + */
> + exit(0);
> +}
> diff --git a/examples/language_features/508aggregations-normalize.d b/exa=
mples/language_features/508aggregations-normalize.d
> new file mode 100755
> index 000000000..5c2429f74
> --- /dev/null
> +++ b/examples/language_features/508aggregations-normalize.d
> @@ -0,0 +1,49 @@
> +#!/usr/sbin/dtrace -s
> +
> +# pragma D option quiet
> +
> +/*
> + *  SYNOPSIS
> + *    sudo ./508aggregations-normalize.d
> + *
> + *  DESCRIPTION
> + *    Here, is another use of trunc() -- with an additional
> + *    argument to focus attention on the top values.
> + */
> +
> +BEGIN
> +{
> + treport =3D timestamp;
> + ttick =3D timestamp;
> +}
> +
> +/* add the number of nanoseconds since the last tick */
> +tick-100hz
> +{
> + @ =3D sum(timestamp - ttick);
> + ttick =3D timestamp;
> +}
> +
> +/* report at erratic intervals */
> +tick-3100ms,
> +tick-3600ms
> +{
> + /* determine number of usecs since last report */
> + this->us_since_last =3D (timestamp - treport) / 1000;
> + treport =3D timestamp;
> + printf("%8d usecs since the last report\n", this->us_since_last);
> +
> + /* normalize the total number of nsecs by the number of usecs */
> + normalize(@, this->us_since_last);
> +
> + /* report aggregation (do not worry about formatting) */
> + printa(@);
> +
> + /* clear the aggregation before resuming */
> + clear(@);
> +}
> +
> +tick-12sec
> +{
> + exit(0);
> +}
> --=20
> 2.47.3
>=20
>=20

